# _*_ coding: utf-8_*_
import time, urllib2, json, re
from lxml import etree
import pandas as pd


import sys

reload(sys)
sys.setdefaultencoding('utf-8')
import pymysql




def getPage(url):  # 获取链接中的网页内容
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'
    }
    try:
        request = urllib2.Request(url=url, headers=headers)
        response = urllib2.urlopen(request, timeout=5)
        page = response.read().decode('utf-8')
        return page
    except (urllib2.URLError, Exception), e:
        if hasattr(e, 'reason'):
            print '抓取失败，具体原因：', e.reason
            request = urllib2.Request(url=url, headers=headers)
            response = urllib2.urlopen(request, timeout=5)
            page = response.read().decode('utf-8')
            return page


def getList():
    place = raw_input('请输入想搜索的区域、类型(如北京、热门景点等)：')
    url = 'http://piao.qunar.com/ticket/list.htm?keyword=' + str(place) + '&region=&from=mpl_search_suggest&page={}'
    i = 1
    sightlist = []
    while i < 2:
        page = getPage(url.format(i))
        selector = etree.HTML(page)
        print '正在爬取第' + str(i) + '页景点信息'
        i += 1
        informations = selector.xpath('//div[@class="result_list"]/div')
        for inf in informations:  # 获取必要信息
            sight_name = inf.xpath('./div/div/h3/a/text()')[0]
            sight_level = inf.xpath('.//span[@class="level"]/text()')
            if len(sight_level):
                sight_level = sight_level[0].replace('景区', '')
            else:
                sight_level = 0
            sight_area = inf.xpath('.//span[@class="area"]/a/text()')[0]
            sight_hot = inf.xpath('.//span[@class="product_star_level"]//span/text()')[0].replace('热度 ', '')
            sight_add = inf.xpath('.//p[@class="address color999"]/span/text()')[0]
            sight_add = re.sub('地址：|（.*?）|\(.*?\)|，.*?$|\/.*?$', '', str(sight_add))
            sight_slogen = inf.xpath('.//div[@class="intro color999"]/text()')[0]
            sight_price = inf.xpath('.//span[@class="sight_item_price"]/em/text()')
            if len(sight_price):
                sight_price = sight_price[0]
            else:
                i = 0
                break
            sight_soldnum = inf.xpath('.//span[@class="hot_num"]/text()')[0]

            sight_point = inf.xpath('./@data-point')[0]

            sight_url = inf.xpath('.//h3/a[@class="name"]/@href')[0]
         #   print sight_url
            sight_picture = inf.xpath('//img[@class="img_opacity load"]/@data-original')[0]

            sightlist.append(
                [sight_name, sight_level, sight_area, float(sight_price), int(sight_soldnum), float(sight_hot),
                 sight_add.replace('地址：', ''), sight_point, sight_slogen, sight_url,sight_picture])
        time.sleep(3)
    return sightlist, place


def listToExcel(list, name):
      df = pd.DataFrame(list, columns=['景点名称', '级别', '所在区域', '起步价', '销售量', '热度', '地址', '经纬度', '标语', '详情网址','图片'])
      df.to_excel(u'热门景点信息01.xlsx')


def datatojson(sightlist):
    # 直接生成json数据
    json_geo = {}
    bjsonlist = []
    ejsonlist1 = []
    ejsonlist2 = []
    num = 1
    for l in sightlist:
        p = '(.*?),(.*?)$'
        geo = re.findall(p, l[7])[0]
        json_geo['lat'] = geo[1]
        json_geo['count'] = l[4] / 100
        json_geo['lng'] = geo[0]
        bjsonlist.append(json_geo)
        print '正在生成第' + str(num) + '个景点的经纬度'
        ejson1 = {l[0]: [geo[0], geo[1]]}
        ejsonlist1 = dict(ejsonlist1, **ejson1)
        ejson2 = {'name': l[0], 'value': l[4] / 100}
        ejsonlist2.append(ejson2)
        num += 1
    bjsonlist = json.dumps(bjsonlist)
    ejsonlist1 = json.dumps(ejsonlist1, ensure_ascii=False)
    ejsonlist2 = json.dumps(ejsonlist2, ensure_ascii=False)
    with open('./points.json', "w") as f:
        f.write(bjsonlist)
    with open('./geoCoordMap.json', "w") as f:
        f.write(ejsonlist1)
    with open('./data.json', "w") as f:
        f.write(ejsonlist2)


# 连接数据库 mysql
def connectDB(list):
    db= pymysql.connect(host='127.0.0.1', port=3306, user='root', password='root', db='placelist', charset="utf8",cursorclass=pymysql.cursors.DictCursor)
    conn = db.cursor()

    # 数据插入表中

    for i in list :
        # 景点名字
        sight_name = i[0].encode('utf-8')
        # 景点的星级
        sight_level = i[1]
        #区域
        sight_area = i[2].encode('utf-8')
        # 价格
        sight_price = i[3]
        #月销售
        sight_soldnum= i[4]

        sight_hot= i[5]

        sight_add= i[6].encode('utf-8')

        sight_slogen = i[8].encode('utf-8')

        sight_picture = i[10]
      #  print sight_picture


        sql = "insert into hotplace (s_img, s_name, s_level, s_area, s_price, s_soldnum, sight_hot,s_replace,s_slogen) values( %s, %s, %s, %s, %s,%s,%s,%s,%s )"
        conn.execute(sql, (sight_picture,sight_name, sight_level, sight_area, sight_price, sight_soldnum, sight_hot,sight_add,sight_slogen))

    if len(list) == 15 :
        db.commit()
       # conn.close()
        db.close()

        print 'inert contents to successfully '


def main():
    sightlist, place = getList()
    print(sightlist)
    listToExcel(sightlist, place)
    datatojson(sightlist)
    connectDB(sightlist)

# getBaiduGeo(sightlist,place)

if __name__ == '__main__':
    main()
