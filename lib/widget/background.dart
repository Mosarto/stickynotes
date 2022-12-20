import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stickynotes/widget/backgourd_controller.dart';
import 'package:stickynotes/widget/blur.dart';

// ignore: must_be_immutable
class Background extends StatefulWidget {
  Widget? child;
  Background({Key? key, this.child}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  BackgourdController backgourdController = Get.find<BackgourdController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xff1B1D1F),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.01,
                right: backgourdController.home.value ? 0 : 25,
                left: backgourdController.home.value ? -300 : 0,
                child: Container(
                  height: 233,
                  width: 233,
                  decoration: const BoxDecoration(
                    color: Color(0xff005933),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: backgourdController.home.value
                    ? (MediaQuery.of(context).size.height * 0.01)
                    : (MediaQuery.of(context).size.height * 0.02),
                right: -35,
                child: Container(
                  height: 190,
                  width: 190,
                  decoration: const BoxDecoration(
                    color: Color(0xff316BA0),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: backgourdController.home.value
                    ? (MediaQuery.of(context).size.height * 0.25)
                    : (MediaQuery.of(context).size.height * 0.34),
                right: backgourdController.home.value ? -50 : -115,
                child: Container(
                  height: backgourdController.home.value ? 150 : 228,
                  width: backgourdController.home.value ? 150 : 288,
                  decoration: BoxDecoration(
                    color: backgourdController.home.value
                        ? const Color(0xff35B67F)
                        : const Color(0xff82FFE1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: -150,
                bottom: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  height: backgourdController.home.value ? 0 : 238,
                  width: backgourdController.home.value ? 0 : 238,
                  decoration: const BoxDecoration(
                    color: Color(0xff51FBDC),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: -100,
                top: MediaQuery.of(context).size.height * 0.70,
                child: Container(
                  height: backgourdController.home.value ? 0 : 238,
                  width: backgourdController.home.value ? 0 : 238,
                  decoration: const BoxDecoration(
                    color: Color(0xff35B67F),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: -117,
                top: MediaQuery.of(context).size.height * 0.08,
                child: Container(
                  height: backgourdController.home.value ? 0 : 233,
                  width: backgourdController.home.value ? 0 : 233,
                  decoration: BoxDecoration(
                    color: const Color(0xff35B67F).withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned.fill(
                child: Blur(
                  blurlevel: backgourdController.home.value ? 100 : 180.0,
                ),
              ),
              Positioned.fill(
                child: widget.child ?? Container(),
              ),
              Positioned(
                top: 96,
                right: 0,
                child: SizedBox(
                  child: Image.asset(
                    'assets/png/planta_esquerda.png',
                    height: backgourdController.home.value ? 0 : 104,
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 2.5,
                left: 0,
                child: SizedBox(
                  child: Image.asset(
                    'assets/png/planta_direita.png',
                    height: backgourdController.home.value ? 0 : 104,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
