import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../ai_chat/presentation/providers/ai_chat_providers.dart';
import '../../data/datasources/directions_remote_datasource.dart';
import '../../data/repositories/directions_repository_impl.dart';
import '../../domain/repositories/directions_repository.dart';

final directionsRemoteDataSourceProvider = Provider<DirectionsRemoteDataSource>(
  (ref) {
    return DirectionsRemoteDataSource(ref.watch(apiClientProvider));
  },
);

final directionsRepositoryProvider = Provider<DirectionsRepository>((ref) {
  return DirectionsRepositoryImpl(
    ref.watch(directionsRemoteDataSourceProvider),
  );
});
