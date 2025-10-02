import 'package:equatable/equatable.dart';
import 'package:sports_tech_app/model/skill_model.dart';
import 'package:sports_tech_app/utils/enums.dart';

class DBState extends Equatable {
  final ApiStatus? apiStatus;
  final String? errorMessage;
  final List<SkillModel>? dataFetchedOnline;
  final List<SkillModel>? basicSkillData;
  final List<SkillModel>? intermediateSkillData;
  final List<SkillModel>? advanceSkillData;

  const DBState({
    this.apiStatus = ApiStatus.loading,
    this.errorMessage,
    this.dataFetchedOnline = const [],
    this.basicSkillData,
    this.intermediateSkillData,
    this.advanceSkillData,
  });

  DBState copyWith({
    ApiStatus? apiStatus,
    String? errorMessage,
    List<SkillModel>? dataFetchedOnline,
    List<SkillModel>? basicSkillData,
    List<SkillModel>? intermediateSkillData,
    List<SkillModel>? advanceSkillData,
  }) {
    return DBState(
      apiStatus: apiStatus ?? this.apiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      dataFetchedOnline: dataFetchedOnline ?? this.dataFetchedOnline,
      basicSkillData: basicSkillData ?? this.basicSkillData,
      intermediateSkillData:
          intermediateSkillData ?? this.intermediateSkillData,
      advanceSkillData: advanceSkillData ?? this.advanceSkillData,
    );
  }

  @override
  List<Object?> get props => [
    apiStatus,
    errorMessage,
    dataFetchedOnline,
    basicSkillData,
    intermediateSkillData,
    advanceSkillData,
  ];
}
