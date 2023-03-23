// ignore_for_file: always_use_package_imports

import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/common/domain/router/router_delegate.dart';

final baseRouterProvider = Provider<BeamerDelegate>(
  (ref) => routerDelegate,
);
