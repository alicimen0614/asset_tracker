import 'package:asset_tracker/core/models/websocket_state_model.dart';
import 'package:asset_tracker/core/utils/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'assets_listview_item_widget.dart';

class AssetsListView extends StatelessWidget {
  final WebSocketState viewModel;
  const AssetsListView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => AssetsListViewItem(
              viewModel: viewModel,
              index: index,
            ),
        separatorBuilder: (context, index) =>
            const CustomSizedBox.largeHeigth(),
        itemCount: viewModel.itemList?.length ?? 0);
  }
}
