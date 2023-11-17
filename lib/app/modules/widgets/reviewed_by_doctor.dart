import '../../../import.dart';

class ReviewedByDoctor extends StatelessWidget {
  const ReviewedByDoctor({
    super.key,
    this.isReviewedByPresent = true,
    required this.doctorImage,
    required this.doctorName,
    required this.doctorQualification,
    this.qualificationWidth = 300,
    this.fontColor = AppColors.kTierColor,
  });

  final bool isReviewedByPresent;
  final String doctorImage;
  final String doctorName;
  final String doctorQualification;
  final double qualificationWidth;
  final Color fontColor;


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(doctorImage),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Utils.assetSVGImage(AppImages.greenVerified),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isReviewedByPresent ?
            Text(
              Strings.reviewedBy,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: AppColors.kGreyText,
                  fontSize: 12,
                ),
              ),
            ) : const SizedBox(),
            Text(
              doctorName,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),

            SizedBox(
              width: qualificationWidth,
              child: Text(
                doctorQualification,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  textStyle:  TextStyle(
                      color: fontColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}