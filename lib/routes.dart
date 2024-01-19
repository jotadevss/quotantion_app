import 'package:routefly/routefly.dart';

import 'app/home/home_page.dart' as a0;
import 'app/onboarding/onboarding_page.dart' as a1;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/onboarding',
    uri: Uri.parse('/onboarding'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.OnboadingPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  home: '/home',
  onboarding: '/onboarding',
);
