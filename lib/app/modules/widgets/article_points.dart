import '../../../import.dart';

class ArticlePoints extends StatelessWidget {
  const ArticlePoints({
    super.key,
    required this.width,
    required this.subheading,
    required this.content,
    this.extraSpaceForSubpoint = false,
  });

  final double width;
  final String subheading;
  final String content;
  final bool extraSpaceForSubpoint;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        extraSpaceForSubpoint ?
        const SizedBox(width: 15)
        :const SizedBox(),
        Utils.assetSVGImage(AppImages.hibiscusFlower,height: 16),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subheading,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Utils.kParagraphTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 5),
            SizedBox(
              width: extraSpaceForSubpoint ? width-85 : width-70,
              child: Text(
                content,
                maxLines: 40,
                overflow: TextOverflow.ellipsis,
                style: Utils.kParagraphTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}