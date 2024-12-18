import 'package:dish_it/core/utils/app_assets.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ChefHomePage extends StatelessWidget {
  const ChefHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: StylishChefBackgroundPainter(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
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
                const SizedBox(height: 30),

                // Welcome Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ' Dish it',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [
                              AppColors.primaryColor,
                              AppColors.secondaryWhiteColor,
                            ],
                          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                        shadows: const [
                          Shadow(
                            color: Colors.black38,
                            blurRadius: 8,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                const Text(
                  'Please choose your language',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLanguageButton(
                      text: 'English',
                      onPressed: () {
                        print("English Selected");
                        // Add navigation or localization logic
                      },
                    ),
                    const SizedBox(width: 20),
                    _buildLanguageButton(
                      text: 'العَرَبيَّة',
                      onPressed: () {
                        print("العَرَبيَّة Selected");
                        // Add navigation or localization logic
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
        backgroundColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: Colors.black26,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
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

    // Draw the gradient background
    final gradient = LinearGradient(
      colors: [AppColors.primaryColor.withOpacity(0.2), Colors.white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // Top wave - Gradient Orange
    paint.shader = null;
    paint.color = AppColors.primaryColor;
    final path1 = Path();
    path1.moveTo(0, size.height * 0.1);
    path1.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.0,
      size.width * 0.5,
      size.height * 0.15,
    );
    path1.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.3,
      size.width,
      size.height * 0.15,
    );
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();
    canvas.drawShadow(path1, Colors.black.withOpacity(0.2), 6, false);
    canvas.drawPath(path1, paint);

    // Middle wave - White Overlay
    paint.color = Colors.white.withOpacity(0.8);
    final path2 = Path();
    path2.moveTo(0, size.height * 0.25);
    path2.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.2,
      size.width * 0.6,
      size.height * 0.35,
    );
    path2.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.5,
      size.width,
      size.height * 0.4,
    );
    path2.lineTo(size.width, size.height * 0.25);
    path2.lineTo(0, size.height * 0.1);
    path2.close();
    canvas.drawShadow(path2, Colors.black.withOpacity(0.2), 6, false);
    canvas.drawPath(path2, paint);

    // Bottom wave - Deep Orange
    paint.color = AppColors.primaryColor.withOpacity(0.8);
    final path3 = Path();
    path3.moveTo(0, size.height * 0.8);
    path3.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.75,
      size.width * 0.5,
      size.height * 0.85,
    );
    path3.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.95,
      size.width,
      size.height * 0.85,
    );
    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);
    path3.close();
    canvas.drawShadow(path3, Colors.black.withOpacity(0.2), 6, false);
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
