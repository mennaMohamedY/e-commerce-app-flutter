

import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final void Function(Color) onSizeSelected;

  const ColorSelector(
      {required this.colors, required this.selectedColor, required this.onSizeSelected});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          colors.length,
              (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(3),
                onTap: () => onSizeSelected(colors[index]),
                child: Ink(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color:  colors[index],

                      borderRadius: BorderRadius.circular(3)),
                  child: Align(
                    alignment: Alignment.center,
                    child: (selectedColor == colors[index])?Icon(Icons.check,color: Colors.white,):Icon(Icons.check,color: Colors.transparent,),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}