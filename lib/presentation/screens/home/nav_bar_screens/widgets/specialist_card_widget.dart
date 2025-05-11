import 'package:appointment_users/core/utils/resources/app_assets.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:appointment_users/presentation/shared/resources/app_colors.dart';
import 'package:appointment_users/presentation/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistCardWidget extends StatelessWidget {
  final SpecialistEntity specialist;
  final VoidCallback onBookPressed;

  const SpecialistCardWidget({
    super.key,
    required this.specialist,
    required this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Remove fixed height and width to prevent overflow
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            Container(
              width: 70.r,
              height: 70.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                  width: 2,
                ),
                image: const DecorationImage(
                  image: AssetImage(AppImages.profileDemoImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    specialist.name,
                    fontSize: 16.sp,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.medical_services_outlined, size: 14.sp),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: AppText(
                          specialist.category,
                          fontSize: 14.sp,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14.sp, color: Colors.amber),
                      SizedBox(width: 4.w),
                      AppText('4.8', fontSize: 14.sp),
                      SizedBox(width: 16.w),
                      Icon(Icons.schedule, size: 14.sp),
                      SizedBox(width: 4.w),
                      // Add available days if needed
                      if (specialist.availableDays != null &&
                          specialist.availableDays.isNotEmpty)
                        Expanded(
                          child: AppText(
                            specialist.availableDays.first,
                            fontSize: 14.sp,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            // Book Button
            SizedBox(
              height: 36.h,
              child: ElevatedButton(
                onPressed: onBookPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('Book', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
