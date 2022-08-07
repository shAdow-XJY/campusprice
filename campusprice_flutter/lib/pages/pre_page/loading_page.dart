import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:redux/redux.dart';

import '../../functions/device_class.dart';
import '../../redux/action/device_action.dart';
import '../../redux/app_state/state.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {

  late final AnimationController _controller;

  /// 需要预先存储的数据
  late final String ip;
  late final double longitude;
  late final double latitude;
  late final DateTime dateTime;
  late final Position position;
  Device device = Device();

  void initPrint(){
    print(ip);
    print(longitude);
    print(latitude);
    print(dateTime);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2500),
        vsync: this
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AsyncCallback>(
      converter: (Store store) {
        return () async => {
          ip = await device.getIp(),
          position = await device.getPosition(),
          longitude = position.longitude,
          latitude = position.latitude,
          dateTime = position.timestamp ?? DateTime(2001,8,1),
          initPrint(),
          store.dispatch(SetDeviceDataAction(ip: ip,longitude: longitude,latitude: latitude,dateTime: dateTime)),
        };
      },
      builder: (BuildContext context, AsyncCallback callback) {
        return
          Container(
            decoration: (
                BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp,
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Theme.of(context).primaryColor,
                        ]
                    )
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                    flex: 2,
                    child: SizedBox()
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      'CampusPrice',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.none,
                          shadows: [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.white.withOpacity(0.54)),
                          ]),
                    )
                ),
                Expanded(
                  flex: 2,
                  child: Lottie.asset(
                    'assets/animations/animation_loading.json',
                    controller: _controller,
                    onLoaded: (composition) {
                      // Configure the AnimationController with the duration of the
                      // Lottie file and start the animation.
                      _controller.forward().whenComplete(() => {
                        callback(),
                        Navigator.popAndPushNamed(context, '/home_page'),
                      });
                    },
                  ),
                ),
                const Expanded(
                    flex: 2,
                    child: SizedBox()
                ),
              ],
            ),
          );
      },
    );
  }
  
}