import 'package:auto_route/auto_route_annotations.dart';
import 'package:testapp/features/authors/presentation/pages/author_books_page.dart';
import 'package:testapp/features/authors/presentation/pages/authors_page.dart';
import 'package:testapp/features/books/presentation/pages/books_page.dart';
import 'package:testapp/features/favorites/presentation/pages/favorites_page.dart';
import 'package:testapp/features/settings/presentation/pages/settings_page.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    /// Страница со списком авторов
    CustomRoute<void>(
      page: AuthorsPage,
      initial: true,
    ),

    /// Страница со списком книг
    CustomRoute<void>(
      page: BooksPage,
    ),

    /// Страница избранных
    CustomRoute<void>(
      page: FavoritesPage,
    ),

    /// Страница настроек
    CustomRoute<void>(
      page: SettingsPage,
    ),

    /// Страница настроек
    CustomRoute<void>(
      page: AuthorBooksPage,
    ),
  ],
)
class $AppRouter {}
