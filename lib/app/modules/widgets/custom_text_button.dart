import '../../../import.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final double height;
  final double? buttonWidth, textFontSize;
  final Widget? child;
  final Color buttonColor;
  final bool addBorder;

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.height = 52,
    this.child,
    this.buttonColor = AppColors.kPrimaryColor,
    this.buttonWidth,
    this.textFontSize,
    this.addBorder = false,
  })  : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child ??
          Text(
            title!,
          ),
    );
  }
}
