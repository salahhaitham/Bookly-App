import 'package:bookly_app/core/Utils/functions/ServiceLocator.dart';
import 'package:bookly_app/features/Home/Domain/UseCases/Fetch_SearchedBooks_UseCase.dart';
import 'package:bookly_app/features/Home/Domain/UseCases/Fetch_SimilarBooks_UseCaSE.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/data/repos/HomeRepoImplementation.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_SearchedBooks/fetch_searched_books_cubit.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Similar_Books/fetch_similar_cubit.dart';
import 'package:bookly_app/features/Home/presntation/views/BookDetails_view.dart';
import 'package:bookly_app/features/Home/presntation/views/Home_view.dart' show HomeView;
import 'package:bookly_app/features/Home/presntation/widgets/SearchView.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String khomeview = "/HomeView";
  static const String kbookdetails = "/BookDetails";
  static const String ksearchview = "/SearchView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Splash_View(),
      ),
      GoRoute(
        path: khomeview,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/bookDetails',
        builder: (context, state) {
          final book = state.extra as BookEntity;
          return BlocProvider(
            create: (context) => FetchSimilarCubit(
             FetchSimilarBooks_Use_Case(getit.get<HomeRepoImplementaion>())
            ),
            child: BookDetails(book: book),
          );
        },
      ),

      GoRoute(
        path: ksearchview,
        builder: (context, state) => BlocProvider(
            create: (context) {
              return FetchSearchedBooksCubit(Fetch_SeachedBooks_UseCase(
                getit.get<HomeRepoImplementaion>()
              ));
            }
            ,child: SearchView()),
      ),
    ],
  );
}
