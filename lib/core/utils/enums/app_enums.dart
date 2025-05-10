enum RequestState { none, loading, success, error }
enum UserSteps { none, isResettingUser, isFetchedUser,isUserLoggedOut,isFetchedCategories,isChangedCategory,isLoadingCategories,isLoadedSpecialists,isLoadingSpecialists }
enum UserTypes { admin,user}
enum BookAppointmentSteps {
  none,
  loadingAvailableTimes,
  loadedAvailableTimes,
  bookingAppointment,
  appointmentBooked,
  error,
}
enum AppointmentStatus {
  pending,
  confirmed,
  cancelled,
  pendingAvailability,
  underReview,
  requestedReschedule,
}