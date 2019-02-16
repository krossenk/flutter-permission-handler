part of permission_handler;

/// Defines the state of a permission group
enum PermissionStatus {
  /// Permission to access the requested feature is denied by the user.
  denied,

  /// The feature is disabled (or not available) on the device.
  disabled,

  /// Permission to access the requested feature is granted by the user.
  granted,

  /// The user granted restricted access to the requested feature (only on iOS).
  restricted,

  /// Permission is in an unknown state
  unknown
}

/// Defines the state of a service related to the permission group
enum ServiceStatus {
  /// The unknown service status indicates the state of the service could not be determined.
  unknown,

  /// There is no service for the supplied permission group.
  notApplicable,

  /// The service for the supplied permission group is disabled.
  disabled,

  /// The service for the supplied permission group is enabled.
  enabled
}

/// Defines the permission groups for which permissions can be checked or requested.
enum PermissionGroup {
  /// The unknown permission only used for return type, never requested
  unknown,

  /// Android: Microphone
  /// iOS: Microphone
  microphone,

  /// Android: External Storage
  /// iOS: Nothing
  storage,
}
