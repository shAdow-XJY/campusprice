# campusprice

A new flutter project designed myself for look price of goods in school store.
一个新的项目——基于之前的想法开始迭代开发。

## steps record
1. 添加flutter-redux,实现黑白模式的切换(Theme Model)
2. 拓展redux，实现用户学校，校区，头像信息的切换(User Model)
3. 实现应用启动页动画展示loading
4. 拓展Device Model，在loading时候异步实现初始化存储设备信息——经度和纬度和当前日期时间
5. Device Model大修改，适配协调后端Spring Boot 项目
6. 配置DIO网络，实现前后端连通，实现地址显示功能
7. 抽离可复用性弹出框和下拉选项框，实现基础的省份选择框

## reference
1. [Flutter Redux详细基础使用教程](https://blog.csdn.net/yhy1315/article/details/102471140)
2. [如何在Flutter中简单的使用redux](https://juejin.cn/post/6969178306667085854) 
3. [通过context获取当前主题颜色](https://www.cnblogs.com/z45281625/p/10796621.html)
> 注： 新方式为 Theme.of(context).colorScheme.background 
4. [flutter 启动屏幕使用 Lottie 动画](https://zhuanlan.zhihu.com/p/376077465)

## support
1. [lottie](https://lottiefiles.com/)
2. [各城市经纬度整理](https://zhuanlan.zhihu.com/p/28653697)

## support packages
see the [dependencies:] in file: [pubspec.yaml]

