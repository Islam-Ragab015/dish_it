import 'dart:math';

import 'package:dish_it/core/bloc/cubit/global_cubit.dart';
import 'package:dish_it/core/bloc/cubit/global_state.dart';
import 'package:dish_it/core/locale/app_locale.dart';
import 'package:dish_it/core/utils/app_assets.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChefHomePage extends StatelessWidget {
  const ChefHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              size: Size.infinite,
              painter: StylishChefBackgroundPainter(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.h), // Adjust the top padding as needed
                child: Text(
                  AppStrings.welcomeToDishit.tr(context),
                  style: TextStyle(
                    fontSize: 30.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor, // You can change this color
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.logo),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 100.h),
                  BlocBuilder<GlobalCubit, GlobalState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLanguageButton(
                            text: 'English',
                            onPressed: () {
                              // Toggle language to English only if it's not already English
                              BlocProvider.of<GlobalCubit>(context)
                                  .toggleLanguage('en');
                              print("English Selected");
                            },
                          ),
                          SizedBox(width: 20.w),
                          _buildLanguageButton(
                            text: 'العَرَبيَّة',
                            onPressed: () {
                              // Toggle language to Arabic only if it's not already Arabic
                              BlocProvider.of<GlobalCubit>(context)
                                  .toggleLanguage('ar');
                              print("العَرَبيَّة Selected");
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Language Button Builder
  Widget _buildLanguageButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryWhiteColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        shadowColor: Colors.black26,
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 15.h,
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

class StylishChefBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw the lower half of the soup bowl
    paint.color = Colors.orangeAccent.withAlpha((0.9 * 255).toInt());
    paint.style = PaintingStyle.fill;

    // Create a path for the wavy soup surface
    final wavyPath = Path();
    wavyPath.moveTo(0, size.height * 0.7);
    for (double i = 0; i < size.width; i += 10) {
      double offset = sin(i / 25) * 25; // Smoother, slower wave
      wavyPath.quadraticBezierTo(
          i + 5, size.height * 0.7 + offset, i + 10, size.height * 0.7);
    }
    wavyPath.lineTo(size.width, size.height);
    wavyPath.lineTo(0, size.height);

    canvas.drawPath(wavyPath, paint);

    // Add soup texture (subtle gradient to simulate depth)
    paint.shader = RadialGradient(
      colors: [
        Colors.orange.shade300.withAlpha((0.7 * 255).toInt()),
        Colors.orangeAccent.withAlpha((0.8 * 255).toInt()),
      ],
      center: Alignment.center,
      radius: 0.5,
    ).createShader(
        Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.6));
    canvas.drawPath(wavyPath, paint);

    // Add steam effect (subtle wisps of white lines)
    paint.color = Colors.white.withAlpha(100);
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;
    final steamPath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.6)
      ..cubicTo(size.width * 0.45, size.height * 0.5, size.width * 0.55,
          size.height * 0.4, size.width * 0.5, size.height * 0.3);
    canvas.drawPath(steamPath, paint);

    final steamPath2 = Path()
      ..moveTo(size.width * 0.6, size.height * 0.7)
      ..cubicTo(size.width * 0.55, size.height * 0.6, size.width * 0.65,
          size.height * 0.5, size.width * 0.6, size.height * 0.4);
    canvas.drawPath(steamPath2, paint);

    // Add ingredients (floating veggies or spices)
    _drawFloatingIngredient(canvas, size, paint, 0.35, 0.5, Colors.green, 12);
    _drawFloatingIngredient(canvas, size, paint, 0.6, 0.55, Colors.red, 15);
    _drawFloatingIngredient(canvas, size, paint, 0.75, 0.65, Colors.brown, 10);

    // Add extra details like herbs or spices on the surface
    paint.color = Colors.green.shade700;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width * 0.4, size.height * 0.5),
      8,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.6),
      10,
      paint,
    );
  }

  void _drawFloatingIngredient(Canvas canvas, Size size, Paint paint,
      double xFactor, double yFactor, Color color, double radius) {
    paint.color = color;
    canvas.drawCircle(
      Offset(size.width * xFactor, size.height * yFactor),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
