import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/core/constants/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:html/parser.dart'; // Import the HTML parser

class ClassicSnackBar {
  // Function to strip HTML tags
  static String stripHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ??
        htmlString; // Return plain text or original string
  }

  // Show success SnackBar
  static success({required BuildContext context, required String msg}) {
    // Remove HTML tags from the message if present
    final plainMessage = stripHtmlTags(msg);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.hardEdge,
        content: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/icons/success.json',
                      height: 60, width: 60, repeat: false),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Success',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.white),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          plainMessage, // Show parsed message
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
                          // overflow: TextOverflow.ellipsis,
                          maxLines: null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 1500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  // Show error SnackBar
  static error({required BuildContext context, required String msg}) {
    // Remove HTML tags from the message if present
    final plainMessage = stripHtmlTags(msg);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/icons/error.json',
              height: 70, width: 70, repeat: false),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Error',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                plainMessage, // Show parsed message
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                // overflow: TextOverflow.ellipsis,
                maxLines: null,
              ),
            ],
          ))
        ],
      ),
      duration: const Duration(milliseconds: 2500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }
}
