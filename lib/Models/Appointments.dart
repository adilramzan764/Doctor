// class AppointmentsList {
//   final Map<String, List<String>>? online;
//   final Map<String, List<String>>? inClinic;
//
//   AppointmentsList( {
//      this.online,
//      this.inClinic,
//   });
//
//   factory AppointmentsList.fromJson(Map<String, dynamic> json) {
//     final Map<String, dynamic> onlineData = json['online'];
//     final Map<String, dynamic> inClinicData = json['inclinic'];
//
//     print("onlineData" + onlineData.toString());
//     final Map<String, List<String>> onlineAppointments = {};
//     final Map<String, List<String>> inClinicAppointments = {};
//
//     onlineData.forEach((day, appointments) {
//       onlineAppointments[day] = List<String>.from(appointments);
//     });
//
//     inClinicData.forEach((day, appointments) {
//       inClinicAppointments[day] = List<String>.from(appointments);
//     });
//
//     return AppointmentsList(
//       online: onlineAppointments,
//       inClinic: inClinicAppointments,
//     );
//   }
// }
class AppointmentsData {
  final Map<String, Map<String, List<String>>> appointments;

  AppointmentsData({
    required this.appointments,
  });

  factory AppointmentsData.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> onlineData = json['online'];
    final Map<String, dynamic> inClinicData = json['inclinic'];

    final Map<String, Map<String, List<String>>> appointmentsMap = {};

    onlineData.forEach((day, appointments) {
      final Map<String, List<String>> dayAppointments = {};
      (appointments as Map<String, dynamic>).forEach((key, value) {
        dayAppointments[key] = List<String>.from(value);
      });
      appointmentsMap['online'] = appointmentsMap['online'] ?? {};
      appointmentsMap['online']?[day] = dayAppointments as List<String>;
    });

    inClinicData.forEach((day, appointments) {
      final Map<String, List<String>> dayAppointments = {};
      (appointments as Map<String, dynamic>).forEach((key, value) {
        dayAppointments[key] = List<String>.from(value);
      });
      appointmentsMap['inclinic'] = appointmentsMap['inclinic'] ?? {};
      appointmentsMap['inclinic']?[day] = dayAppointments as List<String>;
    });

    return AppointmentsData(
      appointments: appointmentsMap,
    );
  }
}
