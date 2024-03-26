import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';
import 'package:test_flutter/resources/widgets/base_screen/loading_view.dart';
import 'package:test_flutter/services/app_setting_service.dart';

mixin BaseScreen {
  LoadingView? loadingView;

  Future setupBase() async {
    loadingView = LoadingView();
  }

  void showLoading(BuildContext context, bool show) {
    loadingView ??= LoadingView();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (show) {
        loadingView!.show(context);
      } else {
        loadingView!.hide();
      }
    });
  }

  void showLoadingWithDuration(BuildContext context, Duration duration) {
    loadingView ??= LoadingView();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        loadingView!.show(context);
        Future.delayed(duration, () {
          loadingView!.hide();
        });
    });
  }

  void pushedName(BuildContext context, String routeName) {
    showLoading(context, true);
    context.pushNamed(routeName);
    showLoading(context, false);
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  Widget loadingCenter(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }

  void dismissLoading(BuildContext context, String? isback) {
    if (loadingView != null) {
      loadingView!.hide();
    }
    if (isback != null) {
      backToScreen(context);
    }
  }

  backToScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> modalBottomSheetMenu({required BuildContext context, required Widget child, bool isDrag = true}) {
    return showModalBottomSheet(
        context: context,
        enableDrag: isDrag,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        builder: (builder) {
          return child;
        });
  }

  void showSuccessToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showErrorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.deepOrangeAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void showAlertDialog(BuildContext context, WidgetRef ref, String content) {
    final appSetting = ref.read(appSettingServiceProvider.notifier);
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(content,
            style: TextStyle(fontSize: appSetting.fontSize)),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('OK', style: TextStyle(fontSize: appSetting.fontSize)),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}
