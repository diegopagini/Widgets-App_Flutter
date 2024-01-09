<!-- @format -->

# widgets_app
![image](https://github.com/diegopagini/Widgets-App_Flutter/assets/62857778/e48aaf5e-8ced-4c65-a597-3c5d63828d12)


## Navigation

```dart
      onTap: () {
        /// To make navigations
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ButtonsScreen()));
      },
```

### main.dart

```dart
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },
    );
```

### home_screen.dart

```dart
    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      subtitle: Text(menuItem.subTitle),
      title: Text(menuItem.title),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: () {
        /// To make navigations
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const ButtonsScreen()));
        Navigator.pushNamed(context, menuItem.link);
      },
    );
```

## Recommended way (Go Router)

### app_router.dart

```dart
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  )
]);

```

### main.dart

```dart
import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
```

### home_screen.dart

```dart
class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      subtitle: Text(menuItem.subTitle),
      title: Text(menuItem.title),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
```


