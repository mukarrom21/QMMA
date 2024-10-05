class AcademicYearModel {
  final int id;
  final String academicYear;
  final String startDate;
  final String endDate;
  final String status;

  AcademicYearModel({
    required this.id,
    required this.academicYear,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory AcademicYearModel.fromJson(Map<String, dynamic> json) {
    return AcademicYearModel(
      id: json['id'],
      academicYear: json['academic_year'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['academic_year'] = academicYear;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    return data;
  }



}