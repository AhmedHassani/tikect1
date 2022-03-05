import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationController extends GetxController {
  final String _appId = "1af2e12c-31e8-4f52-bc0e-16bcb5571756";

  @override
  Future<void> onInit() async {
    await OneSignal.shared.setAppId(_appId);
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print(result.notification.body);
    });
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      addNotificationEvent(event);
      event.complete(event.notification);
      print(event.notification.body);
      print(event.notification.additionalData!['xxx']);
    });
  }

  addNotificationEvent(OSNotificationReceivedEvent event) async {
    print("Save data ${event.notification.body}");
    print("Save data ${event.notification.title}");
    print("Save data ${event.notification}");
  }
}
