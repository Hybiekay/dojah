import 'package:flutter/material.dart';
import './webview_screen.dart';

class DojahKYC {
  final String appId;
  final String publicKey;
  final String type;
  final int? amount;
  final String? referenceId;
  final Map<String, dynamic>? userData;
  final Map<String, dynamic>? metaData;
  final Map<String, dynamic>? govData;
  final Map<String, dynamic>? config;
  final Function(dynamic)? onCloseCallback;

  DojahKYC({
    required this.appId,
    required this.publicKey,
    required this.type,
    this.userData,
    this.config,
    this.metaData,
    this.govData,
    this.amount,
    this.referenceId,
    this.onCloseCallback,
  });

  Future<void> open(
    BuildContext context, {
    Function(dynamic result)? onSuccess,
    Function(dynamic close)? onClose,
    Function(dynamic error)? onError,
    Color? icBackgroundColor,
    Color? iconColor,
  }) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              content: WebviewScreen(
                icBackgroundColor: icBackgroundColor,
                iconColor: iconColor,
                appId: appId,
                publicKey: publicKey,
                type: type,
                userData: userData,
                metaData: metaData,
                govData: govData,
                config: config,
                amount: amount,
                referenceId: referenceId,
                success: (result) {
                  onSuccess!(result);
                },
                close: (close) {
                  onClose!(close);
                },
                error: (error) {
                  onError!(error);
                },
              ),
            ));
  }
}
