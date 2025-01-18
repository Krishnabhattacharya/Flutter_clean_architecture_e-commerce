import 'package:clean_architecture/core/bindings.dart';
import 'package:clean_architecture/core/shared_services/Preferences.dart';
import 'package:clean_architecture/domain/repositories/fetch_product.dart';
import 'package:clean_architecture/presentation/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import flutter_screenutil

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   preferences = await SharedPreferences.getInstance();

//   // First, register FetchProductRepositories (or FetchProductRepoImp) before ProductController
//   Get.lazyPut<FetchProductRepositories>(
//       () => FetchProductRepoImp(Get.find())); // Register FetchProductRepoImp
//   Get.lazyPut(() => FetchDataFromApi()); // Register FetchDataFromApi
//   Get.lazyPut(() => ExicuteApicall(Get.find())); // Register ExicuteApicall
//   Get.lazyPut(
//       () => ProductController(Get.find())); // Register ProductController

//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set your design size (width, height)
      minTextAdapt: true, // Optional: Adapt text scaling
      splitScreenMode: true, // Optional: Split screen mode for tablet devices
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialBinding: DataBindings(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
