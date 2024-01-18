import 'package:routefly/routefly.dart';

import 'app/onboarding/onboarding_page.dart' as a0;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/onboarding',
    uri: Uri.parse('/onboarding'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.OnboadingPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  onboarding: '/onboarding',
);
