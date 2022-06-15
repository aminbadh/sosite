/// Created by Amin BADH on 14 Jun, 2022

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sosite/screens/create_account/c_a_assistant.dart';
import 'package:sosite/screens/create_account/c_a_disable.dart';
import 'package:sosite/widgets/create_account_text.dart';

// GestureDetector(
//
//   child: Container(
//     height: 57,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(4),
//       border: Border.all(
//         color: Theme.of(context).colorScheme.onSurface.withOpacity(.6),
//         width: 1,
//       ),
//       color: Colors.white,
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const SizedBox(width: 12),
//         hasChanged ? Text(
//           ,
//           style: Theme.of(context).textTheme.bodyText1?.copyWith(
//             color: Colors.grey[900],
//           ),
//         ) : Text(
//           "",
//           style: Theme.of(context).textTheme.bodyText1?.copyWith(
//             color: Colors.grey[900]?.withOpacity(0.7),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  static const routeName = '/create_account';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FirebaseAuth.instance.signOut();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreateAccountTopWidget(des: "Who Are You?"),
                    const SizedBox(height: 72),
                    Card(
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushNamed(CreateAccountDisabledScreen.routeName),
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Column(
                            children: [
                              const SizedBox(height: 18),
                              Opacity(
                                opacity: 0.9,
                                child: Text(
                                  "Disabled",
                                  style: Theme.of(context).textTheme.headline5?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: ClipRect(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Align(
                                          alignment: const Alignment(0.4, 0),
                                          child: SizedBox(
                                            height: 130,
                                            child: Image.asset('assets/images/disabled-girl.png'),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Align(
                                          alignment: const Alignment(-0.4, 0),
                                          child: SizedBox(
                                            height: 130,
                                            child: Image.asset('assets/images/disabled-boy.png'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 46),
                    Card(
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushNamed(CreateAccountAssistantScreen.routeName),
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Column(
                            children: [
                              const SizedBox(height: 18),
                              Opacity(
                                opacity: 0.9,
                                child: Text(
                                  "Assistant",
                                  style: Theme.of(context).textTheme.headline5?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: ClipRect(
                                  child: Align(
                                    alignment: const Alignment(0, 0.5),
                                    child: SizedBox(
                                      width: 160,
                                      child: Image.asset('assets/images/helping-disabled-woman.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

