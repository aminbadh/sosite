/// Created by Amin BADH on 16 Jun, 2022

import 'package:flutter/material.dart';
import 'package:sosite/screens/edit_account/edit_account_assistant.dart';
import 'package:sosite/screens/edit_account/edit_account_disabled.dart';
import 'package:sosite/screens/wallet/wallet_disabled.dart';
import 'package:sosite/screens/wallet/wallet_assistant.dart';
import 'package:sosite/utils/Data.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);
  static const routeName = '/wallet';

  @override
  Widget build(BuildContext context) {
    if (DataSingleton.userDoc?.get('role') == "Disabled") {
      return const WalletDisabledScreen();
    } else if (DataSingleton.userDoc?.get('role') == "Assistant") {
      return const WalletAssistantScreen();
    } else {
      /// TODO error screen.
      return const Scaffold();
    }
  }
}