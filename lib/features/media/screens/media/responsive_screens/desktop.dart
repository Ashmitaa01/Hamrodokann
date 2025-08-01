
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:t_utils/t_utils.dart';

import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../role_management/controllers/role/role_controller.dart';
import '../../../controllers/media_controller.dart';
import '../widgets/media_content.dart';
import '../widgets/media_uploader.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    final roleController = RoleController.instance;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: TDeviceUtils.getScreenHeight(context),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes().defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Breadcrumbs
                        Expanded(child:  TBreadcrumbsWithHeading(heading: TTexts.mediaManager.tr, breadcrumbItems: ['Media'])),

                        roleController.checkUserPermission(Permission.createMedia) ?
                        SizedBox(
                          width: TSizes().buttonWidth * 1.5,
                          child: ElevatedButton.icon(
                            label: Text(TTexts.uploadImages.tr),
                            icon: const Icon(Iconsax.image, color: Colors.white),
                            onPressed: () => controller.showImagesUploaderSection.value = !controller.showImagesUploaderSection.value,
                          ),
                        ) : SizedBox.shrink()
                      ],
                    ),
                    SizedBox(height: TSizes().spaceBtwSections),

                    /// Media
                    MediaContent(),
                  ],
                ),
              ),
            ),
          ),

          /// Upload Area
          Obx(
            () => AnimatedPositioned(
              bottom: 0,
              height: TDeviceUtils.getScreenHeight(context),
              right: controller.showImagesUploaderSection.value ? 0 : -500,
              duration: const Duration(milliseconds: 200),
              child: const MediaUploader(isSideBar: true),
            ),
          ),
        ],
      ),
    );
  }
}
