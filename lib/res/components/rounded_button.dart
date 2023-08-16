import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/res/colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;

  const RoundedButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(color: AppColors.blackColor, borderRadius: BorderRadius.circular(10)),
        child: Center(child: isLoading ? CircularProgressIndicator(color: AppColors.whiteColor) : Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
