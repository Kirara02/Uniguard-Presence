import 'package:flutter/material.dart';
import 'package:unipres/domain/entities/presence.dart';
import 'package:unipres/presentation/misc/colors.dart';

class PresenceTile extends StatelessWidget {
  final Presence presenceData;
  const PresenceTile({super.key, required this.presenceData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColors.primaryExtraSoft,
          ),
        ),
        padding: const EdgeInsets.only(left: 24, top: 20, right: 29, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "check in",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      presenceData.checkIn,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "check out",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      presenceData.checkOut,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              presenceData.date,
              style: TextStyle(
                fontSize: 10,
                color: AppColors.secondarySoft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
