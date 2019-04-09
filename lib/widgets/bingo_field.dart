import 'package:flutter/material.dart';

import '../bloc/models.dart';
import 'bingo_tile.dart';

class BingoFieldView extends StatelessWidget {
  BingoFieldView({
    @required this.field,
    @required this.onTilePressed,
  })  : assert(field != null),
        assert(onTilePressed != null);

  final BingoField field;
  final void Function(BingoTile tile) onTilePressed;

  @override
  Widget build(BuildContext context) {
    return FittedBox(child: _buildGrid());
  }

  Widget _buildGrid() {
    var width = field.width;
    var height = field.height;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(width, (x) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(height, (y) => _buildTile(field[x][y])),
        );
      }),
    );
  }

  Widget _buildTile(BingoTile tile) {
    return BingoTileView(tile: tile, onPressed: () => onTilePressed(tile));
  }
}