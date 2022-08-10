import 'package:campusprice_flutter/redux/app_state/state.dart';
import 'package:campusprice_flutter/router/router.dart';

import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:oktoast/oktoast.dart';
import 'package:redux/redux.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final store = Store<AppState>(appReducer, initialState: AppState.initialState());//创建 store
  
  @override
  Widget build(BuildContext context) {
    /// 使用StoreProvider 包裹根元素，使其提供store
    return StoreProvider(
        store: store,
        /// 为了能直接在child使用store，我们这里要继续包裹一层StoreBuilder
        child: StoreBuilder<AppState>(
            builder: (context, store) {
              return MaterialApp(
                  builder: (BuildContext context, Widget? widget) {
                    return OKToast(child: widget!);
                  },
                  debugShowCheckedModeBanner: false,
                  title: 'Campus Price',
                  theme: store.state.themeModel.themeData,
                  /// 初始化加载的路由
                  initialRoute: '/',
                  onGenerateRoute: onGenerateRoute
              );
            }
        )
    );
  }
}
