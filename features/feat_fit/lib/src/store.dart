import 'dart:collection';

import 'package:fit_kit/fit_kit.dart';
import 'package:intl/intl.dart';
import 'package:lib_di/lib_di.dart';
import 'package:mobx/mobx.dart';

import 'models/fit.dart';
import 'models/fit_list.dart';

part 'store.g.dart';

class FitStore = _FitStore with _$FitStore;

abstract class _FitStore with Store {
  final errorStore = ErrorStore();

  @observable
  FitsList fits;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @action
  Future getFits() async {
    if (await FitKit.requestPermissions(DataType.values)) {
      try {
        loading = true;
        final stepsData = await readFitData(DataType.STEP_COUNT);
        final distanceData = await readFitData(DataType.DISTANCE);
        fits = _generateDataFromFits(stepsData, distanceData);
        loading = false;
        success = true;
        errorStore.showError = false;
      } catch (e) {
        loading = false;
        success = false;
        errorStore.showError = true;
        errorStore.errorMessage = DioErrorUtil.handleError(e);
        print(e);
      }
    }
  }

  Future<List<FitData>> readFitData(DataType type) async => await FitKit.read(
        type,
        // dateFrom: DateTime(now.year, now.month),
        dateFrom: DateTime.now().subtract(Duration(days: 30)),
        dateTo: DateTime.now(),
      );

  FitsList _generateDataFromFits(
    List<FitData> stepsData,
    List<FitData> distanceData,
  ) {
    final stepsMap = _mapFitData(stepsData);
    final distanceMap = _mapFitData(distanceData);
    final dailies = [];
    for (var key in distanceMap.keys) {
      final list = distanceMap[key];
      final stepsList = stepsMap[key];
      final distance = list.fold(0, (previous, element) {
        return previous + element.value;
      });
      final steps = stepsList.fold(0, (previous, element) {
        return previous + element.value;
      });
      final time = list.fold<Duration>(Duration.zero, (previous, element) {
        return previous + element.dateTo.difference(element.dateFrom);
      });
      final points = time.inMinutes.toDouble();
      dailies.add(
        FitDaily(
          userId: 0,
          steps: steps,
          points: points,
          distance: distance,
          date: DateFormat.yMMMMd().parse(key),
        ),
      );
    }
    dailies.sort((a, b) => b.date.compareTo(a.date));
    return FitsList(
      points: dailies.fold(
        0,
        (previous, element) => previous + element.points,
      ),
      fitDailies: dailies,
    );
  }

  HashMap<String, List<FitData>> _mapFitData(List<FitData> data) {
    final result = HashMap();
    data.sort((a, b) => b.dateFrom.compareTo(a.dateFrom));
    for (var single in data) {
      final key = DateFormat.yMMMMd().format(single.dateFrom);
      if (result.containsKey(key)) {
        final list = result[key];
        list.add(single);
      } else {
        result[key] = [single];
      }
    }
    return result;
  }
}
