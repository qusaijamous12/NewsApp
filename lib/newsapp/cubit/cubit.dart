import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newsapp/DioHelper/dio.dart';
import 'package:newsapp/newsapp/cashehelper/CasheHelper.dart';
import 'package:newsapp/newsapp/cubit/state.dart';
import 'package:newsapp/newsapp/moduels/ScienceScreen.dart';
import 'package:newsapp/newsapp/moduels/SportScreen.dart';
import 'package:newsapp/newsapp/moduels/buisnessScreen.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(InitialNewsState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> ChangeScreen=[
    BusinessScreen(),
    SportScreen(),
    ScienceScreen()

  ];
  List<String> ChangeTitle=[
    'Business News',
    'Sports News',
    'Science News'
  ];
  List<dynamic> Business=[];
  List<dynamic> Sport=[];
  List<dynamic> Scinece=[];
  bool isDark=false;
  List<dynamic> Serach=[];

  void ChangeCurrentIndex(int Index){
    currentIndex=Index;
    emit(ChangeCurrnetIndexState());
  }
  void GetBusinessData(){
    DioHelper.GetData(
        Path: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'7857d908aca74a29ac0f3d7059d58e25'
        }).then((value) {
          Business=value.data['articles'];
          emit(GetBusinessDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(GetBusinessDataErrorState());
    });
  }
  void GetSportsData(){
    DioHelper.GetData(
        Path: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sport',
          'apiKey':'7857d908aca74a29ac0f3d7059d58e25'
        }).then((value) {
      Sport=value.data['articles'];
      emit(GetSportDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(GetSportDataErrorState());
    });
  }
  void GetScienceData(){
    DioHelper.GetData(
        Path: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'7857d908aca74a29ac0f3d7059d58e25'
        }).then((value) {
      Scinece=value.data['articles'];
      emit(GetScineceDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(GetScineceDataErrorState());
    });
  }
  void ChangeThemeMode({var fromShared}){
    if(fromShared!=null){
      isDark=fromShared;
    }
    else
    isDark=!isDark;
    CasheHelper.setData(key: 'isDark', value: isDark).then((value) {
    emit(ChangeThemeModeSuccess());
    });

  }
  void GetSerachData({
    required String value
}){
    Serach=[];
    DioHelper.GetData(
        Path: 'v2/top-headlines',
        query: {
          'q':'${value}',
          'from':'2024-04-28',
          'sortBy':'publishedAt',
          'apiKey':'7857d908aca74a29ac0f3d7059d58e25'
        }).then((value) {
      Serach=value.data['articles'];
      emit(GetSerachDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(GetSerachDataErrorState());
    });
  }
}