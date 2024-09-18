import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/holiday_model.dart';
import 'package:appadsgp1/core/constants.dart';

class HolidayRepository {
  final Uri url = Uri.parse('$urlHoliday');

  Future<List<HolidayEntity>> getAll() async {
    List<HolidayEntity> holidayList = [];

    final response = await http.get(url as Uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      for (var holiday in json) {
        holidayList.add(HolidayEntity.fromJson(holiday));
      }
    } else {
      throw Exception(
          'Falha ao carregar os feriados. Código de status: ${response.statusCode}');
    }
    return holidayList;
  }
}
