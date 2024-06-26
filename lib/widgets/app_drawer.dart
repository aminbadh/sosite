/// Created by Amin BADH on 15 Jun, 2022 *

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sosite/screens/edit_account.dart';
import 'package:sosite/screens/history.dart';
import 'package:sosite/screens/home.dart';
import 'package:sosite/screens/settings.dart';
import 'package:sosite/screens/wallet.dart';
import 'package:sosite/utils/data.dart';
import 'package:sosite/utils/utils.dart';
import 'package:sosite/widgets/drawer_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, required this.selected, this.rebuild}) : super(key: key);

  final String selected;
  final Function? rebuild;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehaviour(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 12),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.amber,
                        ),
                      ),
                      title: Text(
                        "${DataSingleton.userDoc!.get('firstName')} ${DataSingleton.userDoc!.get('lastName')}",
                      ),
                      subtitle: Text(
                        DataSingleton.userDoc!.get('phoneNum'),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12,
                              letterSpacing: 1,
                              color: Colors.grey[900]?.withOpacity(0.8),
                            ),
                      ),
                      trailing: IconButton(
                        tooltip: appLocal.editAccount,
                        icon: const Icon(Icons.edit),
                        splashRadius: 24,
                        onPressed: () {
                          Navigator.pop(context);
                          if (selected != 'edit') {
                            Navigator.pushNamed(context, EditAccountScreen.routeName).then((value) {
                              if (rebuild != null) {
                                rebuild!();
                              }
                            });
                          }
                        },
                      ),
                    ),
                    Divider(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3)),
                    DrawerListTile(
                      icon: Icons.home_outlined,
                      title: appLocal.home,
                      selected: selected == 'home',
                      onTap: () {
                        Navigator.pop(context);
                        if (selected != 'home') {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        }
                      },
                    ),
                    DrawerListTile(
                      icon: Icons.wallet_outlined,
                      title: appLocal.wallet,
                      selected: selected == 'wallet',
                      onTap: () {
                        Navigator.pop(context);
                        if (selected != 'wallet') {
                          Navigator.pushNamed(context, WalletScreen.routeName);
                        }
                      },
                    ),
                    DrawerListTile(
                      icon: Icons.history,
                      title: appLocal.history,
                      selected: selected == 'history',
                      onTap: () {
                        Navigator.pop(context);
                        if (selected != 'history') {
                          Navigator.pushNamed(context, HistoryScreen.routeName);
                        }
                      },
                    ),
                    DrawerListTile(
                      icon: Icons.settings_outlined,
                      title: appLocal.settings,
                      selected: selected == 'settings',
                      onTap: () {
                        Navigator.pop(context);
                        if (selected != 'settings') {
                          Navigator.pushNamed(context, SettingsScreen.routeName).then((value) {
                            if (selected == 'home' && rebuild != null) {
                              rebuild!();
                            }
                          });
                        }
                      },
                    ),
                    DrawerListTile(
                      icon: Icons.logout,
                      title: appLocal.logout,
                      selected: false,
                      onTap: () => FirebaseAuth.instance.signOut(),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                    child: Text(
                      "V ${snapshot.data?.version} | © SOSITE.org",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 12,
                            color: Colors.grey[900]?.withOpacity(0.5),
                          ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  if (kDebugMode) {
                    print(snapshot.error.toString());
                  }
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
