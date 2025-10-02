import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_tech_app/bloc/online_database/db_bloc.dart';
import 'package:sports_tech_app/bloc/online_database/db_event.dart';
import 'package:sports_tech_app/pages/skill_page.dart';

import 'AppColors/AppColor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DBBloc(),
      child: MaterialApp(
        title: 'Sports Tech App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            surface: Colors.blue.shade400,
            onSurface: Colors.black,
          ),
          scaffoldBackgroundColor: AppColor.scaffoldBackGroundColor,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DBBloc>().add(FetchOnlineData());
  }

  @override
  Widget build(BuildContext context) {
    return SkillPage();
  }
}
