import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../../component/ImageGridItem.dart';
import '../../../component/TransparentInkWell.dart';
import '../../../redux/action/user_action.dart';
import '../../../redux/app_state/state.dart';

class AvatarPage extends StatefulWidget {

  final String avatarName;

  const AvatarPage({
    Key? key,
    required this.avatarName
  }) : super(key: key);

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  final String commonPrefix = 'assets/avatars/';
  final List<String> assetImageNames = [];

  String selectedImageName = '';

  @override
  void initState() {
    super.initState();
    selectedImageName = widget.avatarName;
    assetImageNames.clear();
    for(var i = 0; i < 36; ++i){
      assetImageNames.add('avatar_$i.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () { Navigator.pop(context); },
        ),
        title: const Text('Avatar'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 3,
                child: CircleAvatar(
                  radius: 105,
                  backgroundImage: AssetImage(commonPrefix+selectedImageName),
                ),
            ),

          Expanded(
                flex: 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                          flex: 1,
                          child: SizedBox()
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 5, color: Theme.of(context).primaryColor),
                            ),
                            child: GridView.builder(
                                itemCount: assetImageNames.length,
                                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    //横轴元素个数
                                    crossAxisCount: 5,
                                    //纵轴间距
                                    mainAxisSpacing: 0.0,
                                    //横轴间距
                                    crossAxisSpacing: 0.0,
                                    //子组件宽高长度比例
                                    childAspectRatio: 1.0
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return TransparentInkWell(
                                    onTap: (){
                                      setState(() {
                                        selectedImageName = assetImageNames[index];
                                      });
                                    },
                                    child: selectedImageName == assetImageNames[index]
                                        ? ImageGridItem(assetImageUrl: commonPrefix+assetImageNames[index],borderColor: Colors.greenAccent,)
                                        : ImageGridItem(assetImageUrl: commonPrefix+assetImageNames[index],),
                                  );
                                }),
                          )
                      )
                    ]
                ),

            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 79.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StoreConnector<AppState, VoidCallback>(
                converter: (Store store) {
                  /// 返回的就是下面的 VoidCallback callback
                  return () => {
                    store.dispatch(SetUserDataAction(avatar: selectedImageName))
                  };
                },
                builder: (BuildContext context, VoidCallback callback) {
                  return IconButton(
                    tooltip: 'Verify',
                    icon: const Icon(Icons.check),
                    iconSize: 32.0,
                    color: Colors.green,
                    hoverColor: Colors.greenAccent.shade100,
                    onPressed: () {
                      callback();
                      Navigator.pop(context);
                      },
                  );
                },
            ),
            IconButton(
              tooltip: 'Cancel',
              icon: const Icon(Icons.clear),
              iconSize: 32.0,
              color: Colors.red,
              hoverColor: Colors.redAccent.shade100,
              onPressed: () {
                Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}