  import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/Utils/functions/DeleteAllBooks.dart';
  import 'package:bookly_app/core/Utils/functions/ServiceLocator.dart';
  import 'package:bookly_app/core/Utils/functions/SimpleBlockObserver.dart';
  import 'package:bookly_app/features/Home/Domain/UseCases/FetchFeaturedBooks_Use_Case.dart';
  import 'package:bookly_app/features/Home/Domain/UseCases/Fetch_NewstBooks_UseCase.dart';
  import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
  import 'package:bookly_app/features/Home/data/Home_LocalData/HomeLocalData.dart';
  import 'package:bookly_app/features/Home/data/Home_RemoteData/HomeRemoteData.dart';
  import 'package:bookly_app/features/Home/data/repos/HomeRepoImplementation.dart';
  import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/Fetch_FeaturedBooks_Cubit.dart';
  import 'package:bookly_app/features/Home/manager/cubit/Fetch_newst_Books/Fetch_NewstBooks_Cubit.dart';
  import 'package:bookly_app/features/Home/presntation/views/Home_view.dart';
  import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
  import 'package:bookly_app/main.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:get/get.dart';
  import 'package:get_it/get_it.dart';
  import 'package:go_router/go_router.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:bookly_app/core/Utils/AppRouter.dart';
  import 'package:hive/hive.dart';
  import 'package:bookly_app/constants.dart';
  import 'package:hive_flutter/adapters.dart';

  void main() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BookEntityAdapter());
    await Hive.openBox<BookEntity>(Kfeaturedbooks);
    await Hive.openBox<BookEntity>(Knewstbooks);
    ServiceLocator();
    Bloc.observer=SimpleBlockObserver();
   // await DeleteAllBooks();

    runApp(const MyApp());
  }





  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return FeaturedBooksCubit(
                FetchFeaturedBooks_Use_Case(
                    getit.get<HomeRepoImplementaion>()
                ),
              )..FetchFeaturedBooks();
            },
          ),
          BlocProvider(
            create: (context) {
              return NewstBooksCubit(
                FetchNewstBooks_Use_Case(
                    getit.get<HomeRepoImplementaion>()
                ),
              )..fetchNewstBooks(pagenumber: 0);
            },
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData.dark().copyWith(
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            ),

            scaffoldBackgroundColor: kprimarycolor,
          ),
          debugShowCheckedModeBanner: false,
        ),
      );
    }
  }
