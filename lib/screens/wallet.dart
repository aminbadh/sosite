/// Created by Amin BADH on 15 Jun, 2022

import 'package:flutter/material.dart';
import 'package:sosite/utils/Utils.dart';
import 'package:sosite/widgets/app_drawer.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);
  static const routeName = '/wallet';

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () => _key.currentState!.openDrawer(),
                  icon: const Icon(Icons.menu, size: 32),
                  splashRadius: 28,
                  tooltip: 'Menu',
                ),
                const SizedBox(width: 16),
                Text(
                  "Wallet",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Divider(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3), height: 1),
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehaviour(),
                child: ListView(
                  children: [
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(selected: 'wallet'),
    );
  }
}
