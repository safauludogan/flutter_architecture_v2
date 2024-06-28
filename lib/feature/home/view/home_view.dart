import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weefit/feature/home/view/mixin/home_view_mixin.dart';
import 'package:flutter_weefit/product/widget/project_network_image.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await SuccessDialog.show(
            context: context,
            title: 'Onaylıyor musun',
          );
          print(response);
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AdaptAllView(
                phone: Text(''.ext.version),
                tablet: Text(''.ext.version),
                desktop: Text(''.ext.version),
              ),
              Image.network(''.ext.randomImage),
              Text(
                'Safa',
                style: context.general.textTheme.titleLarge?.copyWith(
                  color: 'FCB103'.ext.color,
                ),
              ),
              /*Future<String>().ext.toBuild(
                    onSuccess: onSuccess,
                    loadingWidget: loadingWidget,
                    notFoundWidget: notFoundWidget,
                    onError: onError,
                  ),*/
              FloatingActionButton(
                onPressed: () {
                  'Safa'.ext.launchMaps();
                },
                child: const Text('EN'),
              ),
              const ProjectNetworkImage(
                url: 'https://picsum.photos/200/300',
                size: Size(100, 100),
              ),
              Assets.icons.icCheck.svg(
                package: 'gen',
              ),
              Assets.images.imgBottle.image(package: 'gen'),
              /*ElevatedButton(
                onPressed: () {
                  final response = context.router.push<bool?>(
                    HomeDetailRoute(id: '1'),
                  );
                },
                child: Text(
                  AppEnvironmentItems.baseUrl.value,
                  style: context.general.textTheme.bodyLarge,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ProductLocalization.updateLanguage(
                    context: context,
                    value: Locales.tr,
                  );
                },
                child: Center(
                  child: const Text(LocaleKeys.general_button_save).tr(
                    args: ['Safa'],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
