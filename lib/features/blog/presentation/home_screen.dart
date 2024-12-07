import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/nav_cubit.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/home_view.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          BlocBuilder<NavbarCubit, int>(
            builder: (context, state) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: context.read<NavbarCubit>().controller,
                  children: const <Widget>[
                    HomeView(),
                    HomeView(),
                    HomeView(),
                    HomeView(),
                  ],
                ),
              );
            },
          ),
          Positioned(
              bottom: 10,
              left: 18,
              right: 18,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: BlocBuilder<NavbarCubit, int>(
                  builder: (context, state) {
                    return SnakeNavigationBar.color(
                      behaviour: SnakeBarBehaviour.floating,
                      snakeShape: SnakeShape.indicator,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(48)),
                      ),
                      backgroundColor: Colors.black87,
                      snakeViewColor: Colors.black87,
                      height: 68,
                      elevation: 4,
                      selectedItemColor: SnakeShape.circle == SnakeShape.indicator ? Colors.black87 : null,
                      unselectedItemColor: Colors.white,
                      selectedLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      ),
                      showUnselectedLabels: false,
                      showSelectedLabels: true,
                      currentIndex: state,
                      onTap: (index) => setState(() {
                        context
                            .read<NavbarCubit>()
                            .controller
                            .animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.linear);
                        context.read<NavbarCubit>().update(index);
                      }),
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                            activeIcon: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                maxRadius: 4,
                              ),
                            ),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.filter_list_outlined, color: Colors.white, size: 26),
                            activeIcon: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                maxRadius: 4,
                              ),
                            ),
                            label: 'Category'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
                            activeIcon: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                maxRadius: 4,
                              ),
                            ),
                            label: 'Cart'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person, color: Colors.white, size: 26),
                            activeIcon: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                maxRadius: 4,
                              ),
                            ),
                            label: 'Other'),
                        // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
                      ],
                    );
                  },
                ),
              )),
        ],
      )),
      // bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 25, height: 2, color: Colors.black),
                const SizedBox(height: 6),
                Container(width: 15, height: 2, color: Colors.black),
              ],
            ),
            onPressed: () {
              // Action for the menu icon
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black.withOpacity(0.1),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: BlocBuilder<NavbarCubit, int>(
        builder: (context, state) {
          return SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.indicator,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48)),
            ),
            backgroundColor: Colors.black87,
            snakeViewColor: Colors.black87,
            height: 68,
            elevation: 4,
            selectedItemColor: SnakeShape.circle == SnakeShape.indicator ? Colors.black87 : null,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
            showUnselectedLabels: false,
            showSelectedLabels: true,
            currentIndex: state,
            onTap: (index) => setState(() {
              context.read<NavbarCubit>().controller.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.linear);
              context.read<NavbarCubit>().update(index);
            }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.filter_list_outlined, color: Colors.white, size: 26),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white, size: 26),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Other'),
              // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
            ],
          );
        },
      ),
    );
  }
}
