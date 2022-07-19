import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PageData pageDataEntity = PageData(
    page: 1,
    results: [],
    totalPages: 2,
    totalResults: 3,
  );
  test('Expect entity dont be null', () {
    // var a = 10;
    // expect(a, 10);
    expect(pageDataEntity, isNotNull);
  });
}
