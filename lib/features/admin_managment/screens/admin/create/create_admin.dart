import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../controller/create_admin_controller.dart';
import 'layouts/desktop.dart';
import 'layouts/mobile.dart';



class CreateAdminScreen extends StatelessWidget {
  const CreateAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateAdminController());
    return const TSiteTemplate(desktop: Desktop(), mobile: Mobile());
  }
}
