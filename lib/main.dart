import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newsapp/DioHelper/dio.dart';
import 'package:newsapp/newsapp/cashehelper/CasheHelper.dart';
import 'package:newsapp/newsapp/cubit/cubit.dart';
import 'package:newsapp/newsapp/cubit/state.dart';
import 'package:newsapp/newsapp/moduels/homeScreen.dart';
import 'package:newsapp/newsapp/shared/themes/theme.dart';

import 'newsapp/blocObserver.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.Init();
  await CasheHelper.init();
  Bloc.observer = MyBlocObserver();
  var isDark=CasheHelper.getData(key: 'isDark');
  print(isDark);

  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget{
  @override
  var isDark;
  MyApp(this.isDark);
  //nnnmn
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context) =>NewsCubit()..GetBusinessData()..GetScienceData()..GetSportsData()..ChangeThemeMode(fromShared: isDark),
     child: BlocConsumer<NewsCubit,NewsState>(
       listener: (context,NewsState){

       },
       builder: (context,NewsState){
         var cubit=NewsCubit.get(context);
         return MaterialApp(
           debugShowCheckedModeBanner: false,

           theme: lightTheme(),

            themeMode: cubit.isDark?ThemeMode.dark:ThemeMode.light,

           darkTheme: darkTheme(),

           home: NewsHomeScreen(),

         );
       },

     ),
   );
  }

}