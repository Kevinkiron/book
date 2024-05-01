import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../constants/text_style.dart';
import '../../controllers/home_controller.dart';
import '../../model/books_model.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.controller,
    required this.book,
  });

  final HomeController controller;
  final ReadingLogEntry book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toggleRead(book);
      },
      child: Obx(() {
        return Container(
          alignment: Alignment.center,
          width: Get.width,
          height: 30,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.grey,
                  offset: Offset(4, 4),
                ),
              ],
              color: book.isRead.value ? Colors.green : Colors.white,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Kstyles().reg(
              size: 18,
              color: book.isRead.value ? Colors.white : Colors.blueAccent,
              text: book.isRead.value ? "UNREAD" : "READ",
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }),
    );
  }
}
