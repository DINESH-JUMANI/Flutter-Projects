import 'package:bloc_tutorial/features/cart/ui/cart_screen.dart';
import 'package:bloc_tutorial/features/home/bloc/home_bloc.dart';
import 'package:bloc_tutorial/features/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const CartScreen(),
            ),
          );
        }
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const WishlistScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Grocery App'),
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    HomeWishlistButtonNavigateClickedEvent(),
                  );
                },
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    HomeCartButtonNavigateClickedEvent(),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
