import 'package:flutter/material.dart';
import 'package:kalkulator_kredit/utils/constant/sizes.dart';

import '../constant/colors.dart';
import 'button_radius_eight.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.selectedOption,
    required this.bottomSheet,
    this.label,
    required this.textTheme,
  });

  final String? selectedOption;
  final Widget bottomSheet;
  final String? label;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(label!,
              style:
                  textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: TSizes.smallSpace / 2,
        ),
        SizedBox(
            width: double.infinity,
            child: ButtonRadiusEight(textTheme,
                bgColor: TColors.primaryColor.withOpacity(0.7),
                textColor: Colors.white,
                child: selectedOption == null
                    ? Text(
                        'Pilih',
                        style: textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        selectedOption!,
                        style: textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ), onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => bottomSheet);
            })),
      ],
    );
  }
}
