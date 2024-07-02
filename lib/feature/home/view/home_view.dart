import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weefit/feature/home/view/mixin/home_view_mixin.dart';
import 'package:flutter_weefit/feature/home/view_model/home_view_model.dart';
import 'package:flutter_weefit/feature/home/view_model/state/base/base_state.dart';
import 'package:flutter_weefit/feature/home/view_model/state/home_state.dart';
import 'package:gen/gen.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        appBar: const _HomeAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            productViewModel.changeThemeMode(ThemeMode.dark);
            await homeViewModel.fetchUsers();
          },
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _UserList()),
            ],
          ),
        ),
      ),
    );
  }
}

final class _UserList extends StatelessWidget {
  const _UserList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {
      },
      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        selector: (state) => state.users ?? [],
        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: Text(state[index].userId.toString()),
                title: Text(state[index].title ?? ''),
                subtitle: Text(state[index].body ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
