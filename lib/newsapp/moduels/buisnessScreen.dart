import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newsapp/cubit/cubit.dart';
import 'package:newsapp/newsapp/cubit/state.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,NewsState){

      },
      builder: (context,NewsState){
        var cubit=NewsCubit.get(context);
        return  ConditionalBuilder(
          condition:cubit.Business.length>0 ,
          builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>BuildNewsItem(context,cubit.Business[index]),
              separatorBuilder: (context,index)=>Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 10
                ),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              itemCount: cubit.Business.length),
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
  Widget BuildNewsItem(context,dynamic x)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      decoration: BoxDecoration(

          borderRadius: BorderRadiusDirectional.circular(20)
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Row(
            children: [
              Image(
                  height: 170,
                  width: 170,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      '${x['urlToImage']??'https://tse1.mm.bing.net/th?id=OIP.nYGx1VSPxY0EHT-LDdpXVQHaE8&pid=Api&P=0&h=220'}'
                  )

              ),
              SizedBox(
                width: 10,
              ),

              Expanded(
                child: Container(
                  height: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${x['title']}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Spacer(),
                      Text(
                        '${x['publishedAt']}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.grey
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );

}