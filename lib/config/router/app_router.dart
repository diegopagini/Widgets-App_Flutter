import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.name,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    name: ButtonsScreen.name,
    path: '/buttons',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    name: CardsScreen.name,
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    name: ProgressScreen.name,
    path: '/progress',
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    name: SnackbarScreen.name,
    path: '/snackbar',
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    name: AnimatedScreen.name,
    path: '/animated',
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    name: UiControlsScreen.name,
    path: '/ui-controls',
    builder: (context, state) => const UiControlsScreen(),
  ),
  GoRoute(
    name: AppTutorial.name,
    path: '/tutorial',
    builder: (context, state) => const AppTutorial(),
  )
]);
