import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_test/app/constants/text_style.dart';
import 'package:machine_test/app/constants/images_constants.dart';
import 'package:machine_test/app/modules/home/controllers/home_controller.dart';

import '../model/books_model.dart';
import 'widgets/appButton.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final HomeController controller = Get.put(HomeController());
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home_outlined),
        title: Kstyles().reg(
          text: 'My Books',
          color: Colors.blueAccent,
          size: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSearchTextField(),
        const Gap(10),
        Expanded(
          child: Obx(() {
            return (controller.isLoading.value)
                ? Center(
                    child: Lottie.asset(AppImages.loading),
                  )
                : _buildBooksGridView();
          }),
        ),
      ],
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          controller.filterBooks(value);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: 'Search Books',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blueAccent,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

//GridView Builder for the card
  Widget _buildBooksGridView() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.books.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.45,
        ),
        itemBuilder: (context, index) {
          final work = controller.books[index].work!;
          final book = controller.books[index];
          return _buildBookItem(
            title: work.title ?? '',
            authors: work.authorNames?.join(', ') ?? '',
            publishYear: work.firstPublishYear?.toString() ?? '',
            coverId: work.coverId.toString(),
            book: book,
          );
        },
      ),
    );
  }

//card items
  Widget _buildBookItem({
    required String title,
    required String authors,
    required String publishYear,
    required String coverId,
    required ReadingLogEntry book,
  }) {
    return Column(
      children: [
        Expanded(
          child: Card(
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: NetworkImage(
                        'https://covers.openlibrary.org/b/id/$coverId-M.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(15),
                Expanded(
                    child: descriptionBody(title, publishYear, authors, book)),
              ],
            ),
          ),
        ),
      ],
    );
  }

//Texts for the Title and body with the button
  Widget descriptionBody(
      String title, String publishYear, String authors, ReadingLogEntry book) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Kstyles().reg(
            text: title,
            size: 18,
            fontWeight: FontWeight.bold,
          ),
          Kstyles().reg(
            text: "Year: $publishYear",
            fontWeight: FontWeight.w400,
            size: 12,
          ),
          const Gap(10),
          Kstyles().reg(
            text: "Author: $authors",
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          const Gap(10),
          AppButton(controller: controller, book: book),
          const Gap(10),
        ],
      ),
    );
  }
}
