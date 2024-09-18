import 'package:appadsgp1/model/holiday_repository.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../model/holiday_model.dart';
import 'package:intl/intl.dart';

class HolidayController {
  HolidayRepository repository = HolidayRepository();

  Future<List<HolidayEntity>> getHolidayList() async {
    initializeDateFormatting();

    
    List<HolidayEntity> list = await repository.getAll();
    for (var holiday in list) {
     holiday.formattedDate = formatDate(holiday.date);
     holiday.weekday = getWeekday(holiday.date);
    }
    return list;
  }

  // Método para formatar data
  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  // Método para obter o dia da semana
  String getWeekday(String date) {
    DateTime dateTime = DateTime.parse(date);
    String weekday = DateFormat('EEEE', 'pt_BR').format(dateTime);
    return weekday;
  }
}
