import 'package:flutter/material.dart';

import '../../data/models/place_model.dart';

class PlaceResultCard extends StatelessWidget {
  final PlaceModel place;

  const PlaceResultCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.place, size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    place.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            if (place.building != null ||
                place.floor != null ||
                place.room != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  [
                    if (place.building != null) place.building,
                    if (place.floor != null) 'Piso ${place.floor}',
                    if (place.room != null) 'Sala ${place.room}',
                  ].join(' · '),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Placeholder: aquí conectaremos /api/directions
                  // cuando construyamos el módulo de navegación.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('La navegación se conectará próximamente'),
                    ),
                  );
                },
                icon: const Icon(Icons.directions_walk, size: 18),
                label: const Text('Iniciar recorrido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
