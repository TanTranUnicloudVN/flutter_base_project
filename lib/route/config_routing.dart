import 'package:base/domain/sample/router/router.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',

  /// If we want error page 404
  // errorPageBuilder: (context, state) {
  //   return buildPageWithDefaultTransition(
  //     state: state,
  //     context: context,
  //     child: const PageNotFoundScreen(),
  //   );
  // },
  routes: [
    ...routerSample,
  ],
);
