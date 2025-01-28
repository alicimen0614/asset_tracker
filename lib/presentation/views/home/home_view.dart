import 'package:asset_tracker/core/constants/const_app_colors.dart';
import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/constants/const_image_paths.dart';
import 'package:asset_tracker/core/models/websocket_state_model.dart';
import 'package:asset_tracker/core/sizes/app_edge_insets.dart';
import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:asset_tracker/core/utils/extensions/determine_color_extension.dart';
import 'package:asset_tracker/core/utils/widgets/custom_sized_box.dart';
import 'package:asset_tracker/presentation/views/home/home_view_model.dart';
import 'package:asset_tracker/providers/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late HomePageViewModel notifier;
  @override
  void initState() {
    super.initState();

    notifier = ref.read(homePageViewModelProvider.notifier);

    notifier.connectAndFetch();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homePageViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            ConstAppTexts.liveMarketDataText,
            style: TextStyle(fontSize: AppSize.largeText),
          ),
          centerTitle: true,
        ),
        body: buildBody(viewModel));
  }

  Widget buildBody(WebSocketState viewModel) {
    if (viewModel.isLoading) return _onDataLoading();

    if (viewModel.errorMessage != null) return _onError();

    return _onSuccess(viewModel);
  }

  Center _onDataLoading() => const Center(child: CircularProgressIndicator());

  Center _onSuccess(WebSocketState viewModel) {
    return Center(
      child: SingleChildScrollView(
        padding: AppEdgeInsets.medium,
        child: Column(
          children: [
            const CustomSizedBox.smallHeigth(),
            Text(
              viewModel.date,
              style: const TextStyle(
                  color: ConstAppColors.defaultGreyColor,
                  fontStyle: FontStyle.italic),
            ),
            DataTable(
              columnSpacing: AppSize.xLargeSize,
              columns: const [
                DataColumn(label: Text('')),
                DataColumn(label: Text(ConstAppTexts.buyingText)),
                DataColumn(label: Text(ConstAppTexts.sellingText)),
              ],
              rows: viewModel.itemList!.map((entry) {
                return DataRow(
                  cells: [
                    DataCell(Text(
                        ConstAppTexts.currencies[entry.code] ?? entry.code)),
                    DataCell(Text(
                      entry.alis.toString(),
                      style: TextStyle(color: entry.dir?.alisDir.toColor()),
                    )),
                    DataCell(Text(entry.satis.toString(),
                        style:
                            TextStyle(color: entry.dir?.satisDir.toColor()))),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Center _onError() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ConstImagePaths.networkErrorPath),
        const CustomSizedBox.xlargeHeigth(),
        const Text(
          ConstAppTexts.connectionErrorText,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const CustomSizedBox.xlargeHeigth(),
        ElevatedButton(
          onPressed: () {
            ref.read(homePageViewModelProvider.notifier).connectAndFetch();
          },
          child: const Text(ConstAppTexts.tryAgainText),
        )
      ],
    ));
  }
}
