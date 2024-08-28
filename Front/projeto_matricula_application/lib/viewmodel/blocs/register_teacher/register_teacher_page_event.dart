import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

abstract class RegisterTeacherPageEvent {}

class RegisterTeacherPageStart extends RegisterTeacherPageEvent {}

class RegisterTeacherPageGetInfoEvent extends RegisterTeacherPageEvent {}

class RegisterNewTeacherEvent extends RegisterTeacherPageEvent {
  final UserDTO user;

  RegisterNewTeacherEvent({required this.user});
}