import 'package:flutter/material.dart';
import 'package:wolly_team/utils/constants/constant_colors.dart';

/// specifies size of form and gradients
class AuthFormContainer extends StatelessWidget {
  const AuthFormContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 350.0,
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [
            // TODO: Mudar para ficar conforme tema muda de cor
            ConstantColors.geyser.withOpacity(0.5),
            ConstantColors.ecru_white,
            ConstantColors.geyser.withOpacity(0.5),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        border: Border.all(
          width: 1.5,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: child,
    );
  }
}
