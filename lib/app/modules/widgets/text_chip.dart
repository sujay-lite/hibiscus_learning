import '../../../import.dart';

class TextChip extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onClick;
  const TextChip({
  required this.isSelected,
  required this.title,
    required this.onClick,
    super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected? AppColors.kPrimaryColor :AppColors.white,
          borderRadius: BorderRadius.circular(8),

        ),
        child:  Text(
          title,
          style: Utils.kSmallText.copyWith(color: isSelected? AppColors.white : AppColors.kPrimaryColor,fontWeight: FontWeight.w400)
        ),
      ),
    );
  }
}
