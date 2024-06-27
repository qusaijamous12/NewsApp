import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newsapp/cubit/cubit.dart';
import 'package:newsapp/newsapp/cubit/state.dart';
import 'package:newsapp/newsapp/moduels/serahscreen.dart';

class NewsHomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,NewsState){

      },
      builder: (context,NewsState){
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${cubit.ChangeTitle[cubit.currentIndex]}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 25,
                color: cubit.isDark?Colors.white:Colors.black
              ),
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    cubit.ChangeThemeMode();

                  },
                  icon: Icon(
                    Icons.brightness_2,
                    color: cubit.isDark?Colors.white:Colors.black,
                  )),
              IconButton(
                  onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder:(context)=>SerachScreen()));

                  },
                  icon: Icon(
                    Icons.search_rounded,
                    color: cubit.isDark?Colors.white:Colors.black,
                  ))

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.ChangeCurrentIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.business
                  ),
                  label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.sports
                  ),
                  label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.science
                  ),
                  label: 'Science')

            ],
          ),
          body: cubit.ChangeScreen[cubit.currentIndex],
        );
      },

    );
  }

}