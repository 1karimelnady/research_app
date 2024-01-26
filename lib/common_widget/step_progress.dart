import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_app/app_manager/local_data.dart';

class StepProgress extends StatefulWidget {
  final double currentStep;
  final double steps;
  const StepProgress({Key? key, required this.currentStep, required this.steps})
      : super(key: key);

  @override
  State<StepProgress> createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  double widthProgress = 0;
  @override
  void initState() {
    onSizedWidget();
    super.initState();
  }

  void onSizedWidget() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.size is Size) {
        Size size = context.size!;
        widthProgress = size.width / (widget.steps - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                "${(widget.currentStep + 1).toInt()}/ ${(widget.steps.toInt())}")
          ],
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: 4,
              width: constraints.maxWidth,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Stack(
                children: [
                  AnimatedContainer(
                    width: widthProgress * widget.currentStep,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Get.theme.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        ),
      ],
    );
  }
}
