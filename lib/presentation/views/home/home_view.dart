import 'package:asset_tracker/core/constants/const_app_colors.dart';
import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/constants/const_image_paths.dart';
import 'package:asset_tracker/core/models/websocket_state_model.dart';
import 'package:asset_tracker/core/sizes/app_edge_insets.dart';
import 'package:asset_tracker/core/utils/widgets/custom_form_field.dart';
import 'package:asset_tracker/core/utils/widgets/custom_sized_box.dart';
import 'package:asset_tracker/presentation/views/home/home_view_model.dart';
import 'package:asset_tracker/presentation/views/home/widgets/assets_listview_widget.dart';
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
      body: buildBody(viewModel),
      backgroundColor: Colors.white54,
    );
  }

  Widget buildBody(WebSocketState viewModel) {
    if (viewModel.isLoading) return _onDataLoading();

    if (viewModel.errorMessage != null) return _onError();

    return _onSuccess(viewModel);
  }

  Center _onDataLoading() => const Center(child: CircularProgressIndicator());

  Padding _onSuccess(WebSocketState viewModel) {
    return Padding(
      padding: AppEdgeInsets.mediumHorizontal,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSizedBox.x3largeHeigth(),
            _buildHeadline(viewModel),
            const CustomSizedBox.largeHeigth(),
            _buildSearchForField(viewModel),
            Expanded(child: _buildAssetsAsListView(viewModel))
          ],
        ),
      ),
    );
  }

  Row _buildHeadline(WebSocketState viewModel) {
    return Row(
      children: [
        const Text(
          ConstAppTexts.assetTrackerText,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 25,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        const CustomSizedBox.x3largeWidth(),
        Text(
          viewModel.date,
          style: const TextStyle(
              color: ConstAppColors.defaultGreyColor,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  CustomFormField _buildSearchForField(WebSocketState viewModel) {
    return CustomFormField(
      label: ConstAppTexts.searchHintText,
      textInputType: TextInputType.text,
      textEditingController: notifier.searchBarController,
      //first we provide the current list of assets if the details of assets changes it will be updated at the homeviewmodel
      onChanged: (value) =>
          notifier.getFilteredAssets(viewModel.itemList ?? []),
    );
  }

  AssetsListView _buildAssetsAsListView(WebSocketState viewModel) {
    return AssetsListView(
      viewModel: viewModel,
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
