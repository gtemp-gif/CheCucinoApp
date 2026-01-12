import 'package:che_cucino/core/widgets/main_scaffold.dart';
import 'package:che_cucino/features/auth/view/login_page.dart';
import 'package:che_cucino/features/home/view/home_page.dart';
import 'package:che_cucino/features/missions/view/missions_page.dart';
import 'package:che_cucino/features/onboarding/view/onboarding_page.dart';
import 'package:che_cucino/features/planner/view/planner_page.dart';
import 'package:che_cucino/features/profile/view/profile_page.dart';
import 'package:che_cucino/features/recipe/view/blog_page.dart';
import 'package:che_cucino/features/recipe/view/recipe_book_page.dart';
import 'package:che_cucino/features/recipe/view/recipe_details_page.dart';
import 'package:che_cucino/features/settings/view/settings_page.dart';
import 'package:che_cucino/features/shopping_list/view/shopping_list_page.dart';
import 'package:che_cucino/features/smart_fridge/view/smart_fridge_page.dart';
import 'package:che_cucino/features/support/view/support_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/shopping-list',
              pageBuilder: (context, state) => const NoTransitionPage(child: ShoppingListPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(child: ProfilePage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(child: SettingsPage()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/recipe-details',
      builder: (context, state) => const RecipeDetailsPage(),
    ),
    GoRoute(
      path: '/recipe-book',
      builder: (context, state) => const RecipeBookPage(),
    ),
    GoRoute(
      path: '/blog',
      builder: (context, state) => const BlogPage(),
    ),
    GoRoute(
      path: '/missions',
      builder: (context, state) => const MissionsPage(),
    ),
    GoRoute(
      path: '/support',
      builder: (context, state) => const SupportPage(),
    ),
    GoRoute(
      path: '/smart-fridge',
      builder: (context, state) => const SmartFridgePage(),
    ),
    GoRoute(
      path: '/planner',
      builder: (context, state) => const PlannerPage(),
    ),
  ],
);
