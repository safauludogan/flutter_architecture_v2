part of '../home_view.dart';

final class _UserBlocList extends StatelessWidget {
  const _UserBlocList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {},
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
