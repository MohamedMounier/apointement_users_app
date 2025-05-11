import 'package:appointment_users/core/network/error/local_error_model.dart';
import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/extensions/enums_extensions.dart';
import 'package:appointment_users/data/data_source/remote/const_collections.dart';
import 'package:appointment_users/data/models/appointment/appointment_activity_model.dart';
import 'package:appointment_users/data/models/appointment/appointment_model.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

abstract class AppointmentsDataSource {
  Future<ResponseWrapper<List<AppointmentModel>>>
  fetchAppointmentsForUser({required String userId});
  Future<ResponseWrapper<List<AppointmentModel>>>
  fetchAvailableAppointmentsForSpecialist({required String specialistId});
  Future<ResponseWrapper<List<AppointmentActivityModel>>>
  fetchAppointmentActivitiesByAppointmentId({required String appointmentId});
  Future<ResponseWrapper<void>> bookAppointment({
    required AppointmentModel appointment,
  });
  Future<ResponseWrapper<void>> updateAppointmentStatus({
    required String appointmentId,
    DateTime? newBookedDate,
    required String newAppointmentStatus
  });
  Future<ResponseWrapper<void>> addAppointmentActivity({
    required AppointmentActivityModel appointmentActivityModel,
  });
}

@LazySingleton(as: AppointmentsDataSource)
class AppointmentsDataSourceImpl implements AppointmentsDataSource {
  final FirebaseFirestore _firestore;

  AppointmentsDataSourceImpl(this._firestore);

  @override
  Future<ResponseWrapper<List<AppointmentModel>>>
  fetchAvailableAppointmentsForSpecialist({required String specialistId}) async {
    try {
      final querySnapshot =
          await _firestore
              .collection(ConstFirebaseData.appointmentsCollection)
              .where('specialistId', isEqualTo: specialistId).where('status', isNotEqualTo: AppointmentStatus.cancelled.statusName)
              .get();
      List<AppointmentModel> appointments = [];

      if (querySnapshot.docs.isNotEmpty) {
        appointments =
            querySnapshot.docs
                .map((doc) => AppointmentModel.fromJson(doc.data()))
                .toList();
      }
      return ResponseWrapper.success(appointments);
    } catch (e) {
      debugPrint(
        'Current Fetched Appointments Data source error ${e.toString()} ',
      );
      rethrow;
      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }
  @override
  Future<ResponseWrapper<List<AppointmentActivityModel>>>
  fetchAppointmentActivitiesByAppointmentId({required String appointmentId}) async {
    try {
      final querySnapshot =
      await _firestore
          .collection(ConstFirebaseData.appointmentsCollection)
          .doc(appointmentId).collection(ConstFirebaseData.appointmentsActivityCollection)
          .get();
      List<AppointmentActivityModel> appointmentsActivities = [];

      if (querySnapshot.docs.isNotEmpty) {
        appointmentsActivities =
            querySnapshot.docs
                .map((doc) => AppointmentActivityModel.fromJson(doc.data()))
                .toList();
      }
      return ResponseWrapper.success(appointmentsActivities);
    } catch (e) {
      debugPrint(
        'Current Fetched Appointments Activities Data source error ${e.toString()} ',
      );

      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }
  @override
  Future<ResponseWrapper<List<AppointmentModel>>>
  fetchAppointmentsForUser({required String userId}) async {
    try {
      final querySnapshot =
      await _firestore
          .collection(ConstFirebaseData.appointmentsCollection)
          .where('userId', isEqualTo: userId)
          .get();
      List<AppointmentModel> appointments = [];

      if (querySnapshot.docs.isNotEmpty) {
        appointments =
            querySnapshot.docs
                .map((doc) => AppointmentModel.fromJson(doc.data()))
                .toList();
      }
      return ResponseWrapper.success(appointments);
    } catch (e) {
      debugPrint(
        'Current Fetched Appointments Data source error ${e.toString()} ',
      );
      rethrow;
      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }
  @override
  Future<ResponseWrapper<void>> bookAppointment({
    required AppointmentModel appointment,
  }) async {
    try {
      await _firestore
          .collection(ConstFirebaseData.appointmentsCollection)
          .doc(appointment.id)
          .set(appointment.toJson());

      return const ResponseWrapper.success(null);
    } catch (e) {
      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }
  @override
  Future<ResponseWrapper<void>>updateAppointmentStatus({
    required String appointmentId,
    DateTime? newBookedDate,
    required String newAppointmentStatus
  }) async {
    try {
      if(newBookedDate==null){
        await _firestore
            .collection(ConstFirebaseData.appointmentsCollection)
            .doc(appointmentId)
            .update({"status":newAppointmentStatus});
      }else{
        await _firestore
            .collection(ConstFirebaseData.appointmentsCollection)
            .doc(appointmentId)
            .update({"status":newAppointmentStatus,"current_booked_date":newBookedDate});
      }


      return const ResponseWrapper.success(null);
    } catch (e) {
      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }
  @override
  Future<ResponseWrapper<void>> addAppointmentActivity({
    required AppointmentActivityModel appointmentActivityModel,
  }) async {
    try {
      final activitiesRef = _firestore
          .collection(ConstFirebaseData.appointmentsCollection)
          .doc(appointmentActivityModel.appointmentId)
          .collection(
            ConstFirebaseData.appointmentsActivityCollection,
          ); // subcollection

      await activitiesRef.add(appointmentActivityModel.toJson());

      return const ResponseWrapper.success(null);
    } catch (e) {
      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }
}
