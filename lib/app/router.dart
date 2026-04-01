import 'package:go_router/go_router.dart';
import '../features/auth/presentation/views/login_page.dart';
import '../features/home/presentation/views/home_page.dart';
import '../features/products/presentation/views/product_search_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/login',
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(path: '/home',
    builder: (context,state) => const HomePage(),
    ),
    GoRoute(
      path: '/products/search',
      builder: (context, state) => const ProductSearchPage(),
    ),
  ],
);