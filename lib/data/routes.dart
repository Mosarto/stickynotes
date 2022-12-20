import 'package:go_router/go_router.dart';
import 'package:stickynotes/screens/home/home_screen.dart';
import 'package:stickynotes/screens/note/note_screen.dart';
import 'package:stickynotes/screens/onboarding/onboarding_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/note/:documentID',
      builder: (context, state) => NoteScreen(
        documentID: state.params['documentID']!,
      ),
    ),
  ],
);
