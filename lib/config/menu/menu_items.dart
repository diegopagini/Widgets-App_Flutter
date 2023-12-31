import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const List<MenuItem> appMenuItems = [
  MenuItem(
      title: 'Counter',
      subTitle: 'Counter with Riverpod',
      link: '/counter',
      icon: Icons.numbers_outlined),
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars and dialogs',
      subTitle: 'Snackbars and dialogs',
      link: '/snackbar',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Animated container',
      link: '/animated',
      icon: Icons.animation_outlined),
  MenuItem(
      title: 'Ui Controls',
      subTitle: 'Checkbox, radios, etc...',
      link: '/ui-controls',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'Tutorial',
      subTitle: 'app tutorial',
      link: '/tutorial',
      icon: Icons.accessibility_rounded),
  MenuItem(
      title: 'Infinite',
      subTitle: 'Infinite Scroll and Pull',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: 'Theme Changer',
      subTitle: 'Theme changer with Riverpod',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
];
