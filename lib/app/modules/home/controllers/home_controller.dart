import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:machine_test/app/modules/home/model/books_model.dart';
import 'package:machine_test/app/constants/Strings.dart';
import 'package:machine_test/app/data/dio_service.dart';

class HomeController extends GetxController {
  final Dio _dio = DioBaseService.dio;

  RxList<ReadingLogEntry> books = <ReadingLogEntry>[].obs;
  var isLoading = true.obs;

  void toggleRead(ReadingLogEntry book) {
    book.isRead.value = !book.isRead.value;
  }

  // !------- filter books by title
  void filterBooks(String query) async {
    if (query.isEmpty) {
      isLoading.value = false;
      await fetchBooks();
    } else {
      final filteredBooks = books
          .where((book) =>
              book.work?.title?.toLowerCase().contains(query.toLowerCase()) ??
              false)
          .toList();
      books.assignAll(filteredBooks);
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchBooks();
  }

//!------[Api Call]--------
  Future<void> fetchBooks() async {
    try {
      final response = await _dio.get(Strings.readEndPoint);

      if (response.statusCode == 200) {
        final booksData = Books.fromJson(response.data);
        books.assignAll(booksData.readingLogEntries!);
        isLoading.value = false;
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load books');
    }
  }
}
