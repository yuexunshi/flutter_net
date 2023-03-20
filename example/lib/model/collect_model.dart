import 'package:flutter_net/flutter_net.dart';

/// curPage : 1
/// datas : [{"author":"xiaoyang","chapterId":440,"chapterName":"官方","courseId":13,"desc":"<p>大家在日常开发过程中，应该对invalidate，requestLayout简易的区别都理解，最近准备针对这两个问题问几问。</p>\r\n<p>先来invalidate吧。</p>\r\n<ol>\r\n<li>invalidate 的执行流程是什么样子的？</li>\r\n<li>如果连续调用多次invalidate执行流程是？</li>\r\n<li>invalidate重绘的区域是如何确定的，仅是当前View还是整个View树，还是某种计算方式？</li>\r\n<li>View除了invalidate()外，还有个方法叫做postInvalidateOnAnimation()，这两个方法有何区别？</li>\r\n</ol>","envelopePic":"","id":167227,"link":"https://wanandroid.com/wenda/show/16190","niceDate":"2020-12-18 15:33","origin":"","originId":16190,"publishTime":1608276804000,"title":"每日一问 | View invalidate() 相关的一些细节探究~","userId":82504,"visible":0,"zan":0}]
/// offset : 0
/// over : true
/// pageCount : 1
/// size : 20
/// total : 1

class CollectModel extends BaseNetworkModel<CollectModel> {
  CollectModel({
      this.curPage, 
      this.datas, 
      this.offset, 
      this.over, 
      this.pageCount, 
      this.size, 
      this.total,});

  CollectModel.fromJson(dynamic json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      datas = [];
      json['datas'].forEach((v) {
        datas?.add(Datas.fromJson(v));
      });
    }
    offset = json['offset'];
    over = json['over'];
    pageCount = json['pageCount'];
    size = json['size'];
    total = json['total'];
  }
  num? curPage;
  List<Datas>? datas;
  num? offset;
  bool? over;
  num? pageCount;
  num? size;
  num? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = curPage;
    if (datas != null) {
      map['datas'] = datas?.map((v) => v.toJson()).toList();
    }
    map['offset'] = offset;
    map['over'] = over;
    map['pageCount'] = pageCount;
    map['size'] = size;
    map['total'] = total;
    return map;
  }

  @override
  CollectModel fromJson(Map<String, dynamic> json) {
    return CollectModel.fromJson(json);
  }

}

/// author : "xiaoyang"
/// chapterId : 440
/// chapterName : "官方"
/// courseId : 13
/// desc : "<p>大家在日常开发过程中，应该对invalidate，requestLayout简易的区别都理解，最近准备针对这两个问题问几问。</p>\r\n<p>先来invalidate吧。</p>\r\n<ol>\r\n<li>invalidate 的执行流程是什么样子的？</li>\r\n<li>如果连续调用多次invalidate执行流程是？</li>\r\n<li>invalidate重绘的区域是如何确定的，仅是当前View还是整个View树，还是某种计算方式？</li>\r\n<li>View除了invalidate()外，还有个方法叫做postInvalidateOnAnimation()，这两个方法有何区别？</li>\r\n</ol>"
/// envelopePic : ""
/// id : 167227
/// link : "https://wanandroid.com/wenda/show/16190"
/// niceDate : "2020-12-18 15:33"
/// origin : ""
/// originId : 16190
/// publishTime : 1608276804000
/// title : "每日一问 | View invalidate() 相关的一些细节探究~"
/// userId : 82504
/// visible : 0
/// zan : 0

class Datas {
  Datas({
      this.author, 
      this.chapterId, 
      this.chapterName, 
      this.courseId, 
      this.desc, 
      this.envelopePic, 
      this.id, 
      this.link, 
      this.niceDate, 
      this.origin, 
      this.originId, 
      this.publishTime, 
      this.title, 
      this.userId, 
      this.visible, 
      this.zan,});

  Datas.fromJson(dynamic json) {
    author = json['author'];
    chapterId = json['chapterId'];
    chapterName = json['chapterName'];
    courseId = json['courseId'];
    desc = json['desc'];
    envelopePic = json['envelopePic'];
    id = json['id'];
    link = json['link'];
    niceDate = json['niceDate'];
    origin = json['origin'];
    originId = json['originId'];
    publishTime = json['publishTime'];
    title = json['title'];
    userId = json['userId'];
    visible = json['visible'];
    zan = json['zan'];
  }
  String? author;
  num? chapterId;
  String? chapterName;
  num? courseId;
  String? desc;
  String? envelopePic;
  num? id;
  String? link;
  String? niceDate;
  String? origin;
  num? originId;
  num? publishTime;
  String? title;
  num? userId;
  num? visible;
  num? zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    map['chapterId'] = chapterId;
    map['chapterName'] = chapterName;
    map['courseId'] = courseId;
    map['desc'] = desc;
    map['envelopePic'] = envelopePic;
    map['id'] = id;
    map['link'] = link;
    map['niceDate'] = niceDate;
    map['origin'] = origin;
    map['originId'] = originId;
    map['publishTime'] = publishTime;
    map['title'] = title;
    map['userId'] = userId;
    map['visible'] = visible;
    map['zan'] = zan;
    return map;
  }

}