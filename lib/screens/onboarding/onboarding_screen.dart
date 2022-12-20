import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:stickynotes/widget/backgourd_controller.dart';
import 'package:stickynotes/widget/background.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  BackgourdController backgourdController = Get.find<BackgourdController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'background',
        child: Background(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Stickily',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Outfit',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color(0xff35B67F),
                            fontFamily: 'Outfit',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/png/document.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        left: 36,
                        right: 36,
                        bottom: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 34),
                            child: const Text(
                              'Create & Design Your Notes Easily',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 12),
                            child: const Text(
                              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 36),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 7,
                                  width: 26,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffD4D4D4),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 7,
                                  width: 36,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff233E36),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 7,
                                  width: 26,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffD4D4D4),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              backgourdController.changeHome(true);
                              context.go('/home');
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 30),
                              alignment: Alignment.center,
                              height: 50,
                              width: 222,
                              decoration: const BoxDecoration(
                                color: Color(0xff35B67F),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(46),
                                ),
                              ),
                              child: const Text(
                                'Let’s Start Stickily',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: -20,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/png/planta_esquerda.png',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: -50,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/png/planta_direita.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
