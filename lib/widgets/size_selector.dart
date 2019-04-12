import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  SizeSelector({
    @required this.sizes,
    @required this.selectedSize,
    @required this.onSizeSelected,
  })  : assert(sizes != null),
        assert(selectedSize != null),
        assert(onSizeSelected != null);

  final List<int> sizes;
  final int selectedSize;
  final void Function(int size) onSizeSelected;

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sizes.map((size) {
        return SizeButton(
          size: size,
          isEnabled: size == selectedSize,
          onPressed: () => onSizeSelected(size),
        );
      }).toList(),
    );
  }
}

class SizeButton extends StatelessWidget {
  const SizeButton({
    @required this.size,
    @required this.isEnabled,
    @required this.onPressed,
  });

  final int size;
  final bool isEnabled;
  final VoidCallback onPressed;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        elevation: isEnabled ? 2 : 0,
        borderRadius: BorderRadius.circular(16),
        color: isEnabled ? Colors.white : Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onPressed,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(
                color: isEnabled ? Colors.transparent : Colors.black,
                width: isEnabled ? 0 : 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            width: 48,
            height: 48,
            alignment: Alignment.center,
            child: Text('${size}x$size'),
          ),
        ),
      ),
    );
  }
}