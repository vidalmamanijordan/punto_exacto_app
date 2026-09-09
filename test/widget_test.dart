import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:punto_exacto_app/main.dart';

void main() {
  testWidgets('La app arranca y muestra la pantalla de chat', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: PuntoExactoApp()),
    );

    // Confirma que el título de la barra superior aparece,
    // como prueba mínima de que la app cargó correctamente.
    expect(find.text('Punto Exacto'), findsOneWidget);
  });
}