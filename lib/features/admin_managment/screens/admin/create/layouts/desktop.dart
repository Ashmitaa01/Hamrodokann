
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_utils/t_utils.dart';

import '../../../../../../routes/routes.dart';
import '../widgets/form.dart';


class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes().defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbsWithHeading(
                returnToPreviousScreen: true,
                heading: 'Create Admin',
                breadcrumbItems: [TRoutes.admin, 'Create Admin'],
              ),
              SizedBox(height: TSizes().spaceBtwSections),

              // Form
              CreateAdminForm(),
            ],
          ),
        ),
      ),
    );
  }
}

