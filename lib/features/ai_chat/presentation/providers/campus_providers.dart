import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/campus_model.dart';
import 'ai_chat_providers.dart';

final campusListProvider = FutureProvider<List<CampusModel>>((ref) async {
  final apiClient = ref.watch(apiClientProvider);
  try {
    final response = await apiClient.dio.get('/campuses');
    final data = response.data['data'] ?? response.data;
    return (data as List)
        .map((json) => CampusModel.fromJson(json as Map<String, dynamic>))
        .toList();
  } on DioException catch (e) {
    throw apiClient.handleError(e);
  }
});
