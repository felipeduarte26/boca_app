import 'package:flutter/material.dart';
import 'BottomNavItem.dart';

class AnimatedBottomNav extends StatelessWidget {
  const AnimatedBottomNav({Key key, this.currentIndex, this.onChange}) : super(key: key);

  final int currentIndex;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(color: Colors.white                                                                                                                                                                                                        ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onChange(0),
              child: BottomNavItem(
                icon: Icons.search,
                title: "Buscar",
                isActive: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(1),
              child: BottomNavItem(
                icon: Icons.power_settings_new,
                title: "Logar",
                isActive: currentIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(2),
              child: BottomNavItem(
                icon: Icons.info,
                title: "Informações",
                isActive: currentIndex == 2,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(3),
              child: BottomNavItem(
                icon: Icons.account_circle,
                title: "administrador",
                isActive: currentIndex == 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

