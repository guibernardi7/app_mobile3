class HolidayEntity {
  final String name;
  final String date;
  String? formattedDate; // Campo para armazenar a data formatada
  String? weekday; // Campo para armazenar o dia da semana

  HolidayEntity({
    required this.name,
    required this.date,
    this.formattedDate,
    this.weekday,
  });

  static HolidayEntity fromJson(Map<String, dynamic> map) {
    return HolidayEntity(
      name: map['name'], 
      date: map['date']);
  }
}
