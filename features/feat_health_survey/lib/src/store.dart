import 'dart:async';

import 'package:feat_health_survey/feat_health_survey.dart';
import 'package:lib_di/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

import 'models/rank.dart';

part 'store.g.dart';

class HealthSurveyStore = _HealthSurveyStore with _$HealthSurveyStore;

abstract class _HealthSurveyStore with Store {
  final ErrorStore errorStore;
  final HealthSurveyApi api;

  _HealthSurveyStore(
    this.errorStore,
    this.api,
  );

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @action
  Future sendMoodRank(double value) async {
    api.postRank(Rank(
      value: value,
      type: RankType.mood,
    ));
  }

  @action
  Future sendHealthRank(double value) async {
    api.postRank(Rank(
      value: value,
      type: RankType.health,
    ));
  }

  @action
  Future close() async {}
}
