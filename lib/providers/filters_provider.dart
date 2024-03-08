

import 'package:flutter_application_tutorial_namer_app/screens/filters.dart';
import 'package:flutter_application_tutorial_namer_app/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super(kInitialFilters);

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void toggleFilter(Filter filter) {
    state = Map.from(state)..update(filter, (value) => !value);
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref){
    return FiltersNotifier();
});