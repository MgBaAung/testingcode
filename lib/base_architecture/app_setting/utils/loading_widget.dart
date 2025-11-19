import 'package:flutter/cupertino.dart';
import 'package:testingapp/base_architecture/app_setting/theme/app_decoration.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            color: themeNotifier.appTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}
