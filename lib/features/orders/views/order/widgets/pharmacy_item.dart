import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PharmacyItem extends StatelessWidget {
  const PharmacyItem({super.key, required this.pharmacyStatus, required this.pharmacyName, required this.distance, required this.pharmacistID});

  final int pharmacyStatus;
  final String pharmacyName;
  final int distance;
  final int pharmacistID;

  String getText(){
    String name = 'open';
    if(pharmacyStatus == 1){
      name = 'open';
    }else if(pharmacyStatus == 0){
      name = 'closed';
    }
    return name;
  }

  Color getTextColor(){
    Color color = TColors.primary.withOpacity(.2);
    if(getText() == "open"){
      color = TColors.primary;
    } else if(getText() == "closed"){
      color = const Color(0xFFFF6B6B);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      // height: 60.h,
      backgroundColor: dark ? TColors.dark : TColors.light,
      padding: const EdgeInsets.all(TSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pharmacyName.toString(), style: Theme.of(context).textTheme.labelLarge?.copyWith(color: dark ? TColors.softGrey : Colors.black)),
                  Text("${distance.toString()} KM", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: const Color(0xFF707070), fontSize: 10, fontWeight: FontWeight.w400)),
                ],
              ),
              TSizes.md.horizontalSpace,
              TRoundedContainer(
                backgroundColor: getTextColor().withOpacity(.1),
                radius: 100.r,
                height: 30.h,
                padding: const EdgeInsets.all(8),
                child: Center(child: Text(getText().toString(), style: Theme.of(context).textTheme.labelMedium?.copyWith(color: getTextColor(), fontSize: 10, fontWeight: FontWeight.w500))),
              ),
            ],
          ),
          IconButton(
              onPressed: () async{
                await TCacheHelper.saveData(key: 'pharmacist_id', value: pharmacistID);
                Get.toNamed(AppRoutes.home);
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: dark ? TColors.softGrey : const Color(0xFF383838),
              )),
        ],
      ),
    );
  }
}
