import 'package:flutter/material.dart';

import '../../data/models/directions_response.dart';
import '../providers/navigation_state.dart';

class NavigationStepsPanel extends StatelessWidget {
  final DirectionsData route;
  final NavigationStatus status;
  final DraggableScrollableController sheetController;

  const NavigationStepsPanel({
    super.key,
    required this.route,
    required this.status,
    required this.sheetController,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: 0.22,
      minChildSize: 0.12,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              // ── Tirador fijo — siempre visible, nunca se scrollea ──────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),

              // ── Contenido scrollable ───────────────────────────────────────
              Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          _SummaryRow(route: route, status: status),
                          const Divider(height: 24),
                          ...route.steps.map(
                            (step) => ListTile(
                              dense: true,
                              leading: const Icon(
                                Icons.directions_walk,
                                size: 20,
                              ),
                              title: Text(step.instruction),
                              trailing: step.distance > 0
                                  ? Text('${step.distance.round()}m')
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ]),
                      ),
                    ),

                    // Imagen que llena TODO el espacio restante
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: _PlaceImage(imageUrl: route.place.image),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final DirectionsData route;
  final NavigationStatus status;

  const _SummaryRow({required this.route, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PlaceThumbnail(imageUrl: route.place.image),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                route.place.name,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                status == NavigationStatus.arrived
                    ? 'Has llegado'
                    : '${route.distanceMeters.round()}m · ${route.durationMinutes.round()} min caminando',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),

        Icon(
          status == NavigationStatus.arrived
              ? Icons.check_circle
              : Icons.directions_walk,
          color: status == NavigationStatus.arrived ? Colors.green : null,
        ),
      ],
    );
  }
}

/// Miniatura del lugar. Si no hay imagen cargada (o falla al
/// descargarla), muestra un ícono genérico en su lugar, nunca
/// un espacio roto o vacío.
class _PlaceThumbnail extends StatelessWidget {
  final String? imageUrl;

  const _PlaceThumbnail({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 56,
        height: 56,
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? _placeholder(context)
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _placeholder(context, loading: true);
                },
                errorBuilder: (context, error, stackTrace) {
                  return _placeholder(context);
                },
              ),
      ),
    );
  }

  Widget _placeholder(BuildContext context, {bool loading = false}) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: loading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(
              Icons.apartment,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
    );
  }
}

/// Imagen grande del lugar destino que ocupa el ancho completo del panel.
/// Permite al usuario confirmar visualmente que es el lugar correcto.
class _PlaceImage extends StatelessWidget {
  final String? imageUrl;

  const _PlaceImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? _placeholder(context)
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _placeholder(context, loading: true);
                },
                errorBuilder: (context, error, stackTrace) {
                  return _placeholder(context);
                },
              ),
      ),
    );
  }

  Widget _placeholder(BuildContext context, {bool loading = false}) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: loading
          ? const CircularProgressIndicator()
          : Icon(
              Icons.image_not_supported_outlined,
              size: 48,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
    );
  }
}
