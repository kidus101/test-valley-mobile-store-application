import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:async';

import 'package:task1/task1/data/repository/banner_repository.dart';
import 'task1/presentation/home/bloc/home_bloc.dart';
import 'task1/presentation/home/colors.dart';
import 'task1/presentation/home/main_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => HomeBloc(
        BannerRepository(),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
     
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          // Locale('en', ''),
          Locale('ko', ''),
        ],

        
        home: MainScreen(),
      ),
    );
  }
}


