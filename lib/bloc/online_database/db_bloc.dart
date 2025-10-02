import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_tech_app/Database/onlineDatabase.dart';
import 'package:sports_tech_app/bloc/online_database/db_event.dart';
import 'package:sports_tech_app/bloc/online_database/db_state.dart';
import 'package:sports_tech_app/utils/enums.dart';

import '../../model/skill_model.dart';

class DBBloc extends Bloc<DBEvent, DBState> {
  DBHelper dbHelper = DBHelper();
  List<SkillModel> tempList = [];
  DBBloc() : super(DBState()) {
    on<FetchOnlineData>(fetchOnlineDate);
    on<GetBasicSkillData>(getBasicSkillData);
    on<GetIntermediateSkillData>(getIntermediateSkillData);
    on<GetAdvanceSkillData>(getAdvanceSkillData);
  }

  FutureOr<void> fetchOnlineDate(
    FetchOnlineData event,
    Emitter<DBState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    await dbHelper
        .getResponse()
        .then((value) {
          tempList = List.from(value);
          emit(
            state.copyWith(
              apiStatus: ApiStatus.success,
              dataFetchedOnline: tempList,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              errorMessage: error.toString(),
              apiStatus: ApiStatus.error,
            ),
          );
        });
  }

  FutureOr<void> getBasicSkillData(
    GetBasicSkillData event,
    Emitter<DBState> emit,
  ) {
    final basicSkills = state.dataFetchedOnline!
        .where((s) => s.level == "Basic")
        .toList();
    emit(state.copyWith(basicSkillData: basicSkills));
  }

  FutureOr<void> getIntermediateSkillData(
    GetIntermediateSkillData event,
    Emitter<DBState> emit,
  ) {
    final intermediateSkills = state.dataFetchedOnline!
        .where((s) => s.level == "Intermediate")
        .toList();
    emit(state.copyWith(intermediateSkillData: intermediateSkills));
  }

  FutureOr<void> getAdvanceSkillData(
    GetAdvanceSkillData event,
    Emitter<DBState> emit,
  ) {
    final advancedSkills = state.dataFetchedOnline!
        .where((s) => s.level == "Advanced")
        .toList();
    emit(state.copyWith(advanceSkillData: advancedSkills));
  }
}
