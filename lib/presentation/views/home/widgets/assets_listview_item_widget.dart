import 'package:asset_tracker/core/constants/const_app_colors.dart';
import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/models/websocket_state_model.dart';
import 'package:asset_tracker/core/utils/extensions/determine_color_extension.dart';
import 'package:asset_tracker/core/utils/extensions/number_shortener_extension.dart';
import 'package:flutter/material.dart';

class AssetsListViewItem extends StatelessWidget {
  const AssetsListViewItem(
      {super.key, required this.viewModel, required this.index});

  final WebSocketState viewModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Row(
        children: [
          Expanded(
              flex: 5,
              child: Text(
                ConstAppTexts.currencies[viewModel.itemList?[index].code] ??
                    viewModel.itemList?[index].code ??
                    "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Text(
                  ConstAppTexts.buyingText,
                ),
                Text(
                  viewModel.itemList?[index].alis.toShortVersion() ?? "",
                  style: TextStyle(
                      color: viewModel.itemList?[index].dir?.alisDir.toColor(),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Text(
                  ConstAppTexts.sellingText,
                ),
                Text(
                  viewModel.itemList?[index].satis.toShortVersion() ?? '',
                  style: TextStyle(
                      color: viewModel.itemList?[index].dir?.satisDir.toColor(),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      subtitle: Text(
        viewModel.itemList?[index].code ?? "",
        style: const TextStyle(
            fontStyle: FontStyle.italic,
            color: ConstAppColors.defaultGreyColor),
      ),
    );
  }
}
