import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'model/banner_model.dart';
import 'model/collect_model.dart';
import 'model/user_model.dart';
import 'model/user_wrapper_model.dart';
import 'my_http_decoder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetWrapper.instance
      // header
      .addHeaders({"aaa": '111'})
      // baseUrl
      .setBaseUrl("https://www.wanandroid.com/")
      // 代理/https
      .setHttpClientAdapter(IOHttpClientAdapter()
        ..onHttpClientCreate = (client) {
          client.findProxy = (uri) {
            return 'PROXY 192.168.20.43:8888';
          };
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        })
      // cookie
      .addInterceptor(CookieManager(CookieJar()))
      // dio_http_cache
      // .addInterceptor(DioCacheManager(CacheConfig(
      //   baseUrl: "https://www.wanandroid.com/",
      // )).interceptor)
      // dio_cache_interceptor
      .addInterceptor(DioCacheInterceptor(
          options: CacheOptions(
        store: MemCacheStore(),
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 7),
        priority: CachePriority.normal,
        cipher: null,
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        allowPostMethod: false,
      )))
      //  全局解析器
      // .setHttpDecoder(MyHttpDecoder.getInstance())
      //  超时时间
      .setConnectTimeout(const Duration(milliseconds: 3000))
      // 允许打印log，默认未 true
      .enableLogger(true)
      .create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Get 请求
  void requestGet() async {
    var appResponse = await get<BannerModel, BannerModel>("banner/json",
        responseType: BannerModel());
    appResponse.when(success: (BannerModel model) {
      var size = model.data?.length;
      debugPrint("成功返回$size条");
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
    });
  }

  /// Post 请求
  void requestPost() async {
    var appResponse = await post<UserWrapperModel, UserWrapperModel>(
        "user/login",
        responseType: UserWrapperModel(),
        queryParameters: {
          "username": '你的账号',
          "password": '你的密码'
        });
    appResponse.when(success: (UserWrapperModel model) {
      var nickname = model.data?.nickname;
      debugPrint("成功返回nickname=$nickname");
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
    });
  }

  /// 自定义Decoder的 Post 请求
  void requestCustomDecoderPost() async {
    var appResponse = await post<UserModel, UserModel>("user/login",
        responseType: UserModel(),
        httpDecode: MyHttpDecoder.getInstance(),
        queryParameters: {"username": '', "password": ''});
    appResponse.when(success: (UserModel model) {
      var nickname = model.nickname;
      debugPrint("成功返回nickname=$nickname");
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
    });
  }

  /// 自定义Decoder的 Get 请求
  void requestCustomGet() async {
    var appResponse = await get<BannerBean, List<BannerBean>>("banner/json",
        responseType: BannerBean(), httpDecode: MyHttpDecoder.getInstance());
    appResponse.when(success: (List<BannerBean> model) {
      var size = model.length;
      debugPrint("成功返回$size条");
    }, failure: (String msg, int code) {
      debugPrint("失败了：$msg");
    });
  }

  /// 自定保存和携带 cookie 的请求
  void requestCookieGet() async {
    var appResponse = await get<CollectModel, CollectModel>(
        "lg/collect/list/0/json",
        responseType: CollectModel(),
        httpDecode: MyHttpDecoder.getInstance());
    appResponse.when(success: (CollectModel model) {
      var size = model.datas?.length;
      debugPrint("成功返回$size条");
    }, failure: (String msg, int code) {
      debugPrint("失败了：$msg");
    });
  }

  /// 带缓存的 Get 请求
  void requestCacheGet() async {
    var appResponse = await get<BannerModel, BannerModel>("banner/json",
        options: buildCacheOptions(const Duration(days: 7)),
        responseType: BannerModel());
    appResponse.when(success: (BannerModel model) {
      var size = model.data?.length;
      debugPrint("成功返回$size条");
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
    });
  }

  /// 通过回调解析返回的请求
  void requestCallBack() async {
    var appResponse = await get<BannerModel, List<BannerBean>>("banner/json",
        options: buildCacheOptions(const Duration(days: 7)),
        responseType: BannerModel(), converter: (response) {
          var errorCode = response.data['errorCode'];
          /// 请求成功
          if (errorCode == 0) {
            var data = response.data['data'];
            var dataList = List<BannerBean>.from(
                data.map((item) => BannerBean.fromJson(item)).toList());
            return Result.success(dataList);
          } else {
            var errorMsg = response.data['errorMsg'];
            return Result.failure(msg: errorMsg, code: errorCode);
          }
        });
    appResponse.when(success: (List<BannerBean> model) {
      debugPrint("成功返回${model.length}条");
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Dio'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                requestGet();
              },
              child: const Text('Get'),
            ),
            TextButton(
              onPressed: () {
                requestPost();
              },
              child: const Text('Post'),
            ),
            TextButton(
              onPressed: () {
                requestCustomGet();
              },
              child: const Text('requestCustomGet'),
            ),
            TextButton(
              onPressed: () {
                requestCustomDecoderPost();
              },
              child: const Text('requestCustomPost'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("请先打开34行注释,才能测试cookie"),
            TextButton(
              onPressed: () {
                requestCookieGet();
              },
              child: const Text('requestCookieGet'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("请先打开39行注释,才能测试缓存"),
            TextButton(
              onPressed: () {
                requestCacheGet();
              },
              child: const Text('requestCacheGet'),
            ),
            TextButton(
              onPressed: () {
                requestCallBack();
              },
              child: const Text('requestCallBack'),
            ),
          ],
        ));
  }
}
