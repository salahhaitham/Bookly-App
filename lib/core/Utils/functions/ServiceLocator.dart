import 'package:bookly_app/core/Utils/ApiService.dart';
import 'package:bookly_app/features/Home/data/Home_LocalData/HomeLocalData.dart';
import 'package:bookly_app/features/Home/data/Home_RemoteData/HomeRemoteData.dart';
import 'package:bookly_app/features/Home/data/repos/HomeRepoImplementation.dart';
import 'package:bookly_app/main.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final getit=GetIt.instance;

void ServiceLocator() {

  getit.registerSingleton<HomeRepoImplementaion>( HomeRepoImplementaion(
    homeLocalData: HomeLocalData_Implemntation(),
    homeRemoteData: HomeRemoteData_Implmentation(),
  ),);
  getit.registerSingleton<ApiService>(ApiService(Dio()));

}