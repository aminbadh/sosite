/// Created by Amin BADH on 16 Jun, 2022 *

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sosite/utils/constants.dart';
import 'package:sosite/utils/locale_provider.dart';
import 'package:sosite/widgets/app_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsAssistantScreen extends StatefulWidget {
  const SettingsAssistantScreen({Key? key}) : super(key: key);

  @override
  State<SettingsAssistantScreen> createState() => _SettingsAssistantScreenState();
}

class _SettingsAssistantScreenState extends State<SettingsAssistantScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;

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
                  tooltip: appLocal.menu,
                ),
                const SizedBox(width: 16),
                Text(
                  appLocal.settings,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Divider(color: Theme
                .of(context)
                .colorScheme
                .onBackground
                .withOpacity(0.3), height: 1),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 6),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocal.language,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                    subtitle: Text(
                      appLocal.changeTheAppsLanguage,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                        color: Colors.grey[900]?.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            String? selectedRadio = Localizations.localeOf(context).toString();
                            return AlertDialog(
                              title: Text(appLocal.selectLanguage),
                              contentPadding: EdgeInsets.zero,
                              content: StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  final languages = [
                                    {'name': "English", 'code': 'en'},
                                    {'name': "French", 'code': 'fr'},
                                  ];

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 18),
                                      Divider(
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.3),
                                        height: 1,
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          itemCount: languages.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return ListTile(
                                              title: Text(
                                                languages[index]['name']!,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText2,
                                              ),
                                              leading: Radio<String>(
                                                value: languages[index]['code']!,
                                                groupValue: selectedRadio,
                                                onChanged: (String? val) {
                                                  setState(() => selectedRadio = val);
                                                },
                                              ),
                                              onTap: () {
                                                setState(() => selectedRadio = languages[index]['code']!);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Divider(
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.3),
                                        height: 1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(appLocal.cancelUpper),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
                                    Navigator.pop(context);
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    if (selectedRadio == 'en') {
                                      prefs.setString(Constants.localeKey, 'en');
                                      localeProvider.setLocale(const Locale('en'));
                                    } else if (selectedRadio == 'fr') {
                                      prefs.setString(Constants.localeKey, 'fr');
                                      localeProvider.setLocale(const Locale('fr'));
                                    }
                                  },
                                  child: Text(appLocal.applyUpper),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  Divider(color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.2)),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocal.help,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                    subtitle: Text(
                      appLocal.visitHelp,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                        color: Colors.grey[900]?.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(Icons.open_in_new),
                    onTap: () {},
                  ),
                  Divider(color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.2)),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(selected: 'settings'),
    );
  }
}
