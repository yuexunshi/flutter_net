<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

可能是 Flutter 上最强的网络框架, 基于[dio](https://pub.dev/packages/dio)实现的非侵入式框架(不影响原有功能). 学习成本低、使用简单, 一行代码发起网络请求, 甚至无需初始化。
## Features

- RESTful API 设计
  GET/POST/PUT/HEAH/DELETE/PATCH/DOWNLOAD
- 可取消请求
- **异步解析**，数据量大不再卡顿
- 全局错误处理(减少崩溃率)
- 自定义解析器，支持全局和单个请求
- 自定义解析方法
- 配置请求参数
- 漂亮的日志打印
- 证书快速配置
- 代理配置
- 拦截器配置
- 强制缓存模式/自定义缓存Key/缓存有效期/LRU缓存算法/缓存任何数据
- 监听上传/下载进度

## 
## Getting started

```
dependencies:
  flutter_nb_net: ^0.0.1
```

## Usage
全局配置：
```dart
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
      .addInterceptor(DioCacheManager(CacheConfig(
        baseUrl: "https://www.wanandroid.com/",
      )).interceptor)
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
      .setHttpDecoder(MyHttpDecoder.getInstance())
       //  超时时间
      .setConnectTimeout(const Duration(milliseconds: 3000))
      // 允许打印log，默认未 true
      .enableLogger(true)
      .create();
```
请求：
```
    var appResponse = await get<BannerModel, BannerModel>("banner/json",
        responseType: BannerModel());
    appResponse.when(success: (BannerModel model) {
      var size = model.data?.length;
      debugPrint("成功返回$size条");
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
    });
```
## Additional information

[代码仓库](https://github.com/yuexunshi/flutter_net)
