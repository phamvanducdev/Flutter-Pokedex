import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/theme/app_theme.dart';

class TrainingInfoWidget extends StatelessWidget {
  final Pokemon pokemon;

  const TrainingInfoWidget({
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
                'Training',
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
                            'EV yield',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Text(
                          pokemon.training.evYield,
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
                            'Catch rate',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Text(
                          pokemon.training.catchRate,
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
                            'Base Friendship',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Text(
                          pokemon.training.baseFriendship,
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
                            'Base Exp',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Text(
                          pokemon.training.baseExp,
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
                            'Growth Rate',
                            style: textTheme.bodyLarge?.copyWith(
                              color: appColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Text(
                          pokemon.training.growthRate,
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
