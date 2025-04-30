import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart'; 
import 'package:xiphone/config/theme/theme_provider.dart';
import 'config/theme/theme_settings.dart';
import 'routes/web.dart'; 
import 'package:xiphone/extras/artifacts/home.dart';
import 'package:xiphone/config/theme/theme.dart'; 
import 'resources/widgets/kustom_painter.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return themeModeAsync.when(
        data: (themeMode) {
          final flutterThemeMode = _getFlutterThemeMode(themeMode);

          return MaterialApp.router(
            themeMode: flutterThemeMode,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            // theme: AppTheme.lightTheme(),
            // darkTheme: AppTheme.darkTheme(),
            // theme: FlexThemeData.dark(),
            debugShowCheckedModeBanner: false,
            routeInformationParser: const RoutemasterParser(),
            routerDelegate: routerDelegate,
          );
        },
        error: (err, stack) => MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Error $err'),
                ),
              ),
            ),
        loading: () => const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ));
  }

  ThemeMode _getFlutterThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}

// class MyApp extends StatelessWidget {
//   const0 MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Consumer(builder: (ctx, ref, _){
//       final theme = ref.watch(themeProvider);

//       return MaterialApp.router(
//       theme: theme.themeData,
//       debugShowCheckedModeBanner: false,
//       routerDelegate: RoutemasterDelegate(
//         routesBuilder: (context) {
//           return loggedInRoute;
//         },
//       ),
//       routeInformationParser: const RoutemasterParser(),

//       // Localization setup

//       // locale: appLocale,
//       // supportedLocales: const [
//       //  Locale("en", ''),
//       //  Locale("fr", ''),
//       // ],

//       // localizationsDelegates: const [

//       // ],
//     );
//     });
//   }
// }

class StudynautzLoginPage extends ConsumerWidget {
  const StudynautzLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: KustomPainter(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 20,
                  //     bottom: 25,
                  //   ),
                  //   child: Image.asset(
                  //     "assets/images/youtube-signin.jpg",
                  //     height: 150,
                  //   ),
                  // ),
                  SizedBox(height: 150),
                  const Text(
                    "Rocket your way to academic excellence.",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Aspira',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      // await ref.read(authServiceProvider).signInWithGoogle();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudynautzHomePage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.jpg",
                            height: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Aspira'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
