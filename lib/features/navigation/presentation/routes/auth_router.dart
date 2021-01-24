import 'package:auto_route/auto_route_annotations.dart';
import 'package:testapp/features/auth/presentation/pages/login/login_page.dart';
import 'package:testapp/features/auth/presentation/pages/registration/sign_up_page.dart';
import 'package:testapp/features/authors/presentation/pages/authors_page.dart';
import 'package:testapp/features/onboarding/presentation/pages/onboarding_page.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute<void>(
      page: OnboardingPage,
      initial: true,
    ),
    AdaptiveRoute<void>(
      page: LoginPage,
    ),
    AdaptiveRoute<void>(
      page: SignUpPage,
    ),
    AdaptiveRoute<void>(
      page: AuthorsPage,
    ),
  ],
)
class $AuthRouter {}
