//
// import 'package:worker_manager/worker_manager.dart';
// import 'notification_service.dart';
//
// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   workerManager().executeTask((task, inputData) async {
//     await NotificationService.scheduleNotification(
//       1,
//       "Nhắc nhở công việc",
//       "Bạn có task sắp đến hạn!",
//       DateTime.now().add(Duration(minutes: 1)),
//     );
//     return Future.value(true);
//   });
// }
//
// class WorkManagerService {
//   static void init() {
//     workerManager().initialize(callbackDispatcher, isInDebugMode: true);
//     workerManager().registerPeriodicTask("task_reminder", "task_check",
//         frequency: Duration(minutes: 15));
//   }
// }
