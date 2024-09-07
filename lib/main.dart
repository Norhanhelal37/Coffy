import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/screens/splash_screen.dart';
import 'package:coffy/service/api_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {

 runApp( DevicePreview(
    isToolbarVisible: true,
    enabled: !kReleaseMode,
    tools: const [
        ...DevicePreview.defaultTools,
        
      ],
    builder: (context) =>const MyApp(), 
  ));
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemCubit>(
      create: (context) => ItemCubit(ApiService.api),
      child: MaterialApp(
        
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
            textTheme:
                const TextTheme(bodyMedium: TextStyle(fontFamily: "Pacifico"))),
        debugShowCheckedModeBanner: false,
        home:const SplashScreen(),
      ),
    );
  }
}
