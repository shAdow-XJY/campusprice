import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void ShowToast(String message){
  showToast(
    message,
    textPadding: const EdgeInsets.all(20.0),
    dismissOtherToast: true,
  );
}