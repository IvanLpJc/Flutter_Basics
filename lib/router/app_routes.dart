import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'package:fl_components/models/models.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static final menuOption = <MenuOption>[
    // MenuOption(
    //   route: '/home',
    //   name: 'Home Screen',
    //   screen: const HomeScreen(),
    //   icon: Icons.home,
    // ),
    MenuOption(
        route: '/listview1',
        name: 'List View 1',
        screen: const Listview1Screen(),
        icon: Icons.list),
    MenuOption(
        route: '/listview2',
        name: 'List View 2',
        screen: const Listview2Screen(),
        icon: Icons.list_alt),
    MenuOption(
        route: '/alert',
        name: 'Alert',
        screen: const AlertScreen(),
        icon: Icons.add_alert_outlined),
    MenuOption(
        route: '/card',
        name: 'Card',
        screen: const CardScreen(),
        icon: Icons.card_membership),
    MenuOption(
        route: "/avatar",
        name: "Avatar",
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    MenuOption(
        route: "/animated",
        name: "Animated Container",
        screen: const AnimatedScreen(),
        icon: Icons.play_circle_outline_outlined),
    MenuOption(
        route: "/input",
        name: "Text Inputs",
        screen: const InputsScreen(),
        icon: Icons.input_rounded),
    MenuOption(
        route: "/slider",
        name: "Slider",
        screen: const SliderScreen(),
        icon: Icons.slideshow_outlined),
    MenuOption(
        route: "/listviewbuilder",
        name: "ListView Builder",
        screen: const ListViewBuilderScreen(),
        icon: Icons.build),
    MenuOption(
        route: "/listviewinfinitescroll",
        name: "ListView Infinite Scroll",
        screen: const ListViewInfinitScrollScreen(),
        icon: Icons.low_priority_outlined),
    MenuOption(
        route: "/infinitescrollwith futures",
        name: "Infinite Scroll with Futures",
        screen: const InfiniteScrollWithFuturesScreen(),
        icon: Icons.share_arrival_time_rounded),
    MenuOption(
        route: "/pokemonlist",
        name: "Pokemones",
        screen: const PokemonListScreen(),
        icon: Icons.remove_circle),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'/home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   '/home': (context) => const HomeScreen(),
  //   '/listview1': (context) => const Listview1Screen(),
  //   '/listview2': (context) => const Listview2Screen(),
  //   '/alert': (context) => const AlertScreen(),
  //   '/card': (context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
