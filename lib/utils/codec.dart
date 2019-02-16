part of permission_handler;

class Codec {
  static PermissionStatus decodePermissionStatus(String value) {
    final String permission = json.decode(value);

    return PermissionStatus.values.firstWhere(
            (PermissionStatus e) => e.toString().split('.').last == permission);
  }

  static ServiceStatus decodeServiceStatus(String value) {
    final String status = json.decode(value);

    return ServiceStatus.values.firstWhere(
            (ServiceStatus s) => s.toString().split('.').last == status);
  }

  static Map<PermissionGroup, PermissionStatus> decodePermissionRequestResult(
      String value) {
    final Map<String, dynamic> jsonObject = json.decode(value);

    final Map<PermissionGroup, PermissionStatus> permissionResults =
    <PermissionGroup, PermissionStatus>{};
    jsonObject.forEach((String key, dynamic value) {
      final PermissionGroup permissionGroup = PermissionGroup.values.firstWhere(
              (PermissionGroup e) =>
          e.toString().split('.').last == key.toString());
      final PermissionStatus permissionStatus = PermissionStatus.values
          .firstWhere((PermissionStatus e) =>
      e.toString().split('.').last == value.toString());

      permissionResults[permissionGroup] = permissionStatus;
    });

    return permissionResults;
  }

  static String encodePermissionGroup(PermissionGroup permissionGroup) =>
      json.encode(_encodeEnum(permissionGroup));

  static String encodePermissionGroups(List<PermissionGroup> permissions) =>
      json.encode(
          permissions.map((PermissionGroup p) => _encodeEnum(p)).toList());

  static String _encodeEnum(dynamic value) {
    return value.toString().split('.').last;
  }
}
