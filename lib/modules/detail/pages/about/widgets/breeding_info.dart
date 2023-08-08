import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/models/pokemon.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class BreedingInfoWidget extends StatelessWidget {
  final Pokemon pokemon;

  const BreedingInfoWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppTheme.getColors(context);
    TextTheme textTheme = AppTheme.of(context).textTheme;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Breeding',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 86,
                          child: Text(
                            'Gender',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        ...pokemon.breeding.genders
                            .map(
                              (gender) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Row(
                                  children: [
                                    if (gender.type == GenderType.MALE)
                                      Icon(
                                        Icons.male,
                                        color: appColors.marsIcon,
                                        size: 20,
                                      ),
                                    if (gender.type == GenderType.FEMALE)
                                      Icon(
                                        Icons.female,
                                        color: appColors.venusIcon,
                                        size: 20,
                                      ),
                                    if (gender.type == GenderType.UNKNOWN)
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: Text(
                                          '-',
                                          style: textTheme.bodyLarge,
                                        ),
                                      ),
                                    Text(
                                      gender.type == GenderType.UNKNOWN ? "--%" : "${gender.percentage}",
                                      style: textTheme.bodyLarge,
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 86,
                          child: Text(
                            'Egg Groups',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Text(
                          "${pokemon.breeding.egg?.groups.join(", ")}",
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 86,
                          child: Text(
                            'Egg Cycle',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Text(
                          "${pokemon.breeding.egg?.cycle}",
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
