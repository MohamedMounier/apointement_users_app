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
enum UserAppointmentsSteps {
  none,
  gettingUserAppointmentsLoading,
  gettingUserAppointmentsSuccess,
  gettingUserAppointmentsError,
}
enum EditAppointmentSteps {
  none,
  isGettingAppointmentActivitiesLoading,
  isGettingAppointmentActivitiesSuccess,
  isGettingAppointmentActivitiesError,
  isCancellingUserAppointmentsLoading,
  isCancellingUserAppointmentsSuccess,
  isCancellingUserAppointmentsError,
  isGettingSpecialistAvailableTimeLoading,
  isGettingSpecialistAvailableTimeSuccess,
  isGettingSpecialistAvailableTimeError,
  isReschedulingAppointmentTimeLoading,
  isReschedulingAppointmentTimeSuccess,
  isReschedulingAppointmentTimeError,
  isTestGoBackAndRefresh,
}
enum AppointmentStatus {
  pending,
  confirmed,
  cancelled,
  pendingAvailability,
  underReview,
  rescheduled,
  done,
  noShow
}