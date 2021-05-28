import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/blocs/authen_bloc.dart';
import 'package:homeworkout_app/blocs/remote/api_response.dart';
import 'package:homeworkout_app/model/user/MemberData.dart';
import 'package:homeworkout_app/splash_view_page.dart';
import 'package:homeworkout_app/utils/app_utils.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/view/user/signin_view.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient client = super.createHttpClient(context); //<<--- notice 'super'
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    if (message.containsKey('notification')) {
      // Handle notification message
      final notification = message['notification'] as Map<dynamic, dynamic>;
      if (notification.containsKey('title') &&
          notification.containsKey('body')) {
        // handleShowNotification(
        //     notification['title'] as String, notification['body'] as String);
        // if (data.containsKey('DepartmentLogo')) {
        //   handleShowNotification(
        //       notification['title'] as String, notification['body'] as String);
        //   showDialog(
        //       context: _scaffoldKey.currentContext,
        //       builder: (context) => DialogInvite());
        // }
      }
    }
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }
  // Or do other work.
}

// NotificationAppLaunchDetails notificationAppLaunchDetails;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppUtils.sharedF();
  HttpOverrides.global = new MyHttpOverrides();
  var appDocDirectory = await getApplicationDocumentsDirectory();
  Hive..init(appDocDirectory.path);
  // CartBloc().init();
  // // Upgrader().clearSavedSettings();
  // final appcastURL =
  //     'https://raw.githubusercontent.com/larryaasen/upgrader/master/test/testappcast.xml';
  // final cfg = AppcastConfiguration(url: appcastURL, supportedOS: ['android']);
  // showDialog(
  //     context: UpdateStatisticBloc().mainContext,
  //     builder: (context) => UpgradeAlert(
  //           appcastConfig: cfg,
  //           debugLogging: true,showLater: true,showIgnore: true,
  //         ));
//  init notification
  await Hive.openBox(AppConstants.HIVE_USER_BOX);
  await Hive.openBox(AppConstants.HIVE_HOME_FEED);
  await Hive.openBox(AppConstants.HIVE_CACHE_BOX);
//   notificationAppLaunchDetails =
//   await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//   var initializationSettingsAndroid =
//   AndroidInitializationSettings('mipmap/app_icon');
//   // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
//   // of the `IOSFlutterLocalNotificationsPlugin` class
//   var initializationSettingsIOS = IOSInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification: null);
//   var initializationSettings = InitializationSettings(
//       initializationSettingsAndroid, initializationSettingsIOS);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String payload) async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         String employeeIdStr = prefs.getString('EmployeeIdStr');
// //           String logo=prefs.getString('DepartmentLogo');
//         String content = prefs.getString('content');
//         String type = prefs.getString('Type');
//         if (payload != null && payload.isNotEmpty) {
//           ApiService(ApiConstants.GET_POST, {"IdStr": payload}, null)
//               .getResponse()
//               .then((response) async {
//             if (response.status == Status.SUCCESS) {
//               JDIResponse jdiResponse = response.data;
//               if (jdiResponse != null &&
//                   jdiResponse.ErrorCode == "000000" &&
//                   jdiResponse.Data != null &&
//                   jdiResponse.Data.length > 0) {
//                 List<PostFeedData> result =
//                 jdiResponse.Data.map((e) => PostFeedData.fromJson(e)).toList();
//                 AppUtils.shared.pushWidget(
//                     UpdateStatisticBloc().mainContext,
//                     PostCommentView(
//                         AppCache().memberData.SessionId, result[0], false));
//               }
//             }
//           });
//         } else {
//           showDialog(
//               context: UpdateStatisticBloc().mainContext,
//               builder: (context) => DialogInvite(
//                 logo: int.parse(type) ==
//                     AppConstants.NTFY_ACTION_TYPE_INVITE_OWNER
//                     ? IconUtils.shared.IC_INVITE_OWNER
//                     : IconUtils.shared.IC_INVITE_EMPLOYEE,
//                 type: type ?? '0',
//                 content: content ?? '',
//                 employeeIdStr: employeeIdStr ?? '',
//               ));
//         }
//       });
  //
  // try {
  //   // Wait for Firebase to initialize and set `_initialized` state to true
  //   await Firebase.initializeApp();
  //   initializeDateFormatting().then((_) => runApp(MyApp()));
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  //   Isolate.current.addErrorListener(RawReceivePort((pair) async {
  //     final List<dynamic> errorAndStacktrace = pair;
  //     await FirebaseCrashlytics.instance.recordError(
  //       errorAndStacktrace.first,
  //       errorAndStacktrace.last,
  //     );
  //   }).sendPort);
  //   runZonedGuarded<Future<void>>(() async {
  //     // ...
  //   }, FirebaseCrashlytics.instance.recordError);
  //   if (kDebugMode)
  //     FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  // } catch (e) {
  //   // Set `_error` state to true if Firebase initialization fails
  //
  // }
  initializeDateFormatting().then((_) => runApp(MyApp()));
  authenBloc.loadData();
}

final authenBloc = AuthenBloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorUtils.MAIN_GRADIENT_1,
        statusBarBrightness: Brightness.light));

//     firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         prefs = await SharedPreferences.getInstance();
//         print("onMessage: $message");
//
// //        Utilites.showToast(UpdateStatisticBloc().mainContext, "ok nheeee");
//         if (message.containsKey('notification')) {
//           // Handle notification message
//           final notification = message['notification'] as Map<dynamic, dynamic>;
//
//           if (notification.containsKey('title') &&
//               notification.containsKey('body')) {
//             final notificationData = message['data'] as Map<dynamic, dynamic>;
//             prefs.setString('content', notification['body']);
            // if (notificationData.containsKey('postIdStr')) {
            //   handleShowNotification(notification['title'] as String,
            //       notification['body'] as String,
            //       payload: notificationData['postIdStr']);
            // }
            // else if (notificationData.containsKey('DepartmentLogo')) {
            //   handleShowNotification(notification['title'] as String,
            //       notification['body'] as String);
            //   prefs.setString(
            //       'DepartmentLogo', notificationData['DepartmentLogo']);
            //   prefs.setString(
            //       'EmployeeIdStr', notificationData['EmployeeIdStr']);
            //   prefs.setString('Type', notificationData['Type']);
      //         showDialog(
      //             context: UpdateStatisticBloc().mainContext,
      //             builder: (context) => DialogInvite(
      //               logo: int.parse(notificationData['Type']) ==
      //                   AppConstants.NTFY_ACTION_TYPE_INVITE_OWNER
      //                   ? IconUtils.shared.IC_INVITE_OWNER
      //                   : IconUtils.shared.IC_INVITE_EMPLOYEE,
      //               type: notificationData['Type'] ?? '0',
      //               content: notification['body'] ?? '',
      //               employeeIdStr: notificationData['EmployeeIdStr'] ?? '',
      //             ));
      //       } else
      //         handleShowNotification(notification['title'] as String,
      //             notification['body'] as String);
      //     }
      //   }
      // },
      // onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
      // onLaunch: (Map<String, dynamic> message) async {
      //   print("onLaunch: $message");
      //   if (message.containsKey('notification')) {
      //     // Handle notification message
      //     final notification = message['notification'] as Map<dynamic, dynamic>;
      //     if (notification.containsKey('title') &&
      //         notification.containsKey('body')) {
      //       handleShowNotification(notification['title'] as String,
      //           notification['body'] as String);
      //     }
      //   }
      // },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //     if (message.containsKey('notification')) {
    //       // Handle notification message
    //       final notification = message['notification'] as Map<dynamic, dynamic>;
    //       if (notification.containsKey('title') &&
    //           notification.containsKey('body')) {
    //         handleShowNotification(notification['title'] as String,
    //             notification['body'] as String);
    //       }
    //     }
    //   },
    // );

    // firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(
    //         sound: true, badge: true, alert: true, provisional: true));
    // firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });

    return MaterialApp(
      title: 'Belife',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SFUIText', primarySwatch: Colors.blue),
      builder: (BuildContext context, Widget child) {
        final data = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);
        return MediaQuery(data: data, child: child);
      },
      home: Scaffold(
        body: StreamBuilder<ApiResponse<MemberData>>(
          stream: authenBloc.subjectAuthenData.stream,
          builder: (context, snapshot) {
            final response = snapshot.data;
            if (response != null && response.status == Status.SUCCESS) {
//            authenBloc.dispose();
              if (response.data != null) {
                return SigninView(
                  hasRemember: true,
                );
              }
              return SigninView();
            }
            return SplashView();
          },
        ),
      ),
    );
  }
}

final userBox = Hive.box(AppConstants.HIVE_USER_BOX);

//class TransferMainScreen extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => _TransferMainScreenState();
//
//}
//
//class _TransferMainScreenState extends State<TransferMainScreen>{
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: ColorUtils.blueAccent,
//      body: Container(),
//    );
//  }
//
//  @override
//  void initState() {
//    AppUtils.shared.pushReplacementWidget(context, MainView(),routeName: "MainScreen");
//  }
//}
