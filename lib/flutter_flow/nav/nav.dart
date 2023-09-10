import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => RolesWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RolesWidget(),
        ),
        FFRoute(
          name: 'Financial_Tracker',
          path: '/financialTracker',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Financial_Tracker')
              : FinancialTrackerWidget(),
        ),
        FFRoute(
          name: 'Set_Limit',
          path: '/setLimit',
          builder: (context, params) => SetLimitWidget(),
        ),
        FFRoute(
          name: 'Financial_Graph',
          path: '/financialGraph',
          builder: (context, params) => FinancialGraphWidget(),
        ),
        FFRoute(
          name: 'Congratulations',
          path: '/congratulations',
          builder: (context, params) => CongratulationsWidget(),
        ),
        FFRoute(
          name: 'Roles',
          path: '/roles',
          builder: (context, params) => RolesWidget(),
        ),
        FFRoute(
          name: 'Reload_Complete',
          path: '/reloadComplete',
          builder: (context, params) => ReloadCompleteWidget(),
        ),
        FFRoute(
          name: 'Card_Info',
          path: '/cardInfo',
          builder: (context, params) => CardInfoWidget(),
        ),
        FFRoute(
          name: 'Payment_Card',
          path: '/paymentCard',
          builder: (context, params) => PaymentCardWidget(),
        ),
        FFRoute(
          name: 'QR_Scan',
          path: '/qRScan',
          builder: (context, params) => QRScanWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Home') : HomeWidget(),
        ),
        FFRoute(
          name: 'Family_Verification',
          path: '/familyVerification',
          builder: (context, params) => FamilyVerificationWidget(),
        ),
        FFRoute(
          name: 'Challenge_Preset',
          path: '/challengePreset',
          builder: (context, params) => ChallengePresetWidget(),
        ),
        FFRoute(
          name: 'Challenge_Complete',
          path: '/challengeComplete',
          builder: (context, params) => ChallengeCompleteWidget(),
        ),
        FFRoute(
          name: 'ArticlePageMedia',
          path: '/articlePageMedia',
          builder: (context, params) => ArticlePageMediaWidget(),
        ),
        FFRoute(
          name: 'ArticlePageDetail',
          path: '/articlePageDetail',
          builder: (context, params) => ArticlePageDetailWidget(),
        ),
        FFRoute(
          name: 'ArticlePage',
          path: '/articlePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ArticlePage')
              : ArticlePageWidget(),
        ),
        FFRoute(
          name: 'QRCodePage',
          path: '/qRCodePage',
          builder: (context, params) => QRCodePageWidget(),
        ),
        FFRoute(
          name: 'PaymentSuccessfulPage',
          path: '/paymentSuccessfulPage',
          builder: (context, params) => PaymentSuccessfulPageWidget(),
        ),
        FFRoute(
          name: 'PaymentPage',
          path: '/paymentPage',
          builder: (context, params) => PaymentPageWidget(),
        ),
        FFRoute(
          name: 'ArticlePageCopy',
          path: '/articlePageCopy',
          builder: (context, params) => ArticlePageCopyWidget(),
        ),
        FFRoute(
          name: 'ArticlePageMediaCopy',
          path: '/articlePageMediaCopy',
          builder: (context, params) => ArticlePageMediaCopyWidget(),
        ),
        FFRoute(
          name: 'ArticlePageDetailCopy',
          path: '/articlePageDetailCopy',
          builder: (context, params) => ArticlePageDetailCopyWidget(),
        ),
        FFRoute(
          name: 'Challenge_CompleteChild',
          path: '/challengeCompleteChild',
          builder: (context, params) => ChallengeCompleteChildWidget(),
        ),
        FFRoute(
          name: 'Challenge_ToDo',
          path: '/challengeToDo',
          builder: (context, params) => ChallengeToDoWidget(),
        ),
        FFRoute(
          name: 'Challenge_History',
          path: '/challengeHistory',
          builder: (context, params) => ChallengeHistoryWidget(),
        ),
        FFRoute(
          name: 'Challenge_Current',
          path: '/challengeCurrent',
          builder: (context, params) => ChallengeCurrentWidget(),
        ),
        FFRoute(
          name: 'Challenge_Main2',
          path: '/challengeMain2',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Challenge_Main2')
              : ChallengeMain2Widget(),
        ),
        FFRoute(
          name: 'Transfer',
          path: '/transfer',
          builder: (context, params) => TransferWidget(),
        ),
        FFRoute(
          name: 'Transfer_Verification',
          path: '/transferVerification',
          builder: (context, params) => TransferVerificationWidget(),
        ),
        FFRoute(
          name: 'TransferSuccessful',
          path: '/transferSuccessful',
          builder: (context, params) => TransferSuccessfulWidget(),
        ),
        FFRoute(
          name: 'Reload',
          path: '/reload',
          builder: (context, params) => ReloadWidget(),
        ),
        FFRoute(
          name: 'Reload_Verification',
          path: '/reloadVerification',
          builder: (context, params) => ReloadVerificationWidget(),
        ),
        FFRoute(
          name: 'Financial_TrackerCopy',
          path: '/financialTrackerCopy',
          builder: (context, params) => FinancialTrackerCopyWidget(),
        ),
        FFRoute(
          name: 'Financial_GraphCopy',
          path: '/financialGraphCopy',
          builder: (context, params) => FinancialGraphCopyWidget(),
        ),
        FFRoute(
          name: 'Challenge_SetCopy',
          path: '/challengeSetCopy',
          builder: (context, params) => ChallengeSetCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
