import 'package:hibiscus_learning/import.dart';

class LibraryCard extends StatelessWidget {
  final bool isPinned;
  final bool? isCardTypePresent;
  final String? cardType;
  final String cardTitle;
  final String image;

  const LibraryCard({
    required this.isPinned,
    this.isCardTypePresent = false,
    this.cardType ="",
    required this.cardTitle,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 175,
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          isPinned ?
          Positioned(
            top: 5,
            right: 5,
            child: Transform.rotate(
              angle: 45* pi/180,
              child: const Icon(Icons.push_pin,color: AppColors.white,size: 20),
            ),
          )
              :const SizedBox(),

          isCardTypePresent !=null && isCardTypePresent! ?
          Positioned(
            bottom: 35,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.kBgColor,
                borderRadius: BorderRadius.circular(5),

              ),
              child:  Text(
                isCardTypePresent != null && isCardTypePresent! && cardType != null ? cardType! : "",
                style: Utils.kSmallText.copyWith(height: 1.2,fontWeight: FontWeight.w500),


              ),
            ),
          )
              :const SizedBox(),

          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              cardTitle,
              style: Utils.kParagraphTextStyle.copyWith(fontSize: 15,color: AppColors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}