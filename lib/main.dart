import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:test1/common/utils/app_routes.dart';
import 'package:test1/common/utils/environment.dart';
import 'package:test1/common/utils/kstrings.dart';
import 'package:test1/src/controllers/category_notifier.dart';
import 'package:test1/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:test1/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:test1/src/splahscreen/views/splashscreen_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//load the correct environemnt
  await dotenv.load(fileName: Environment.fileName);

  await GetStorage.init();

  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
      ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
      ChangeNotifierProvider(create: (_) => CategoryNotifier())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        );
      },
      child: const SplashScreen(),
    );
  }
}
