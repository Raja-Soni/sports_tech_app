import 'package:equatable/equatable.dart';

abstract class DBEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchOnlineData extends DBEvent {}

class GetBasicSkillData extends DBEvent {}

class GetIntermediateSkillData extends DBEvent {}

class GetAdvanceSkillData extends DBEvent {}
