import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/teacher/teacher_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_state.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/user/user_service.dart';

class RegisterTeacherPageBloc extends Bloc<RegisterTeacherPageEvent, RegisterTeacherPageState> {

  final TeacherService _service = TeacherService();
   final UserService _userService = UserService();

  RegisterTeacherPageBloc() : super(RegisterTeacherPageInitState()) {
    on<RegisterTeacherPageStart>(_onStart);
    on<RegisterTeacherPageGetInfoEvent>(_onGetInfo);
  }

  void _onStart(RegisterTeacherPageStart event, Emitter<RegisterTeacherPageState> emit) {
    emit(RegisterTeacherPageStartState());
  }

  Future<void> _onGetInfo(RegisterTeacherPageGetInfoEvent event, Emitter<RegisterTeacherPageState> emit) async {
    var teachers = await _service.listProfessors();
    emit(RegisterTeachersListLoaded(teachers: teachers));
  }

 Future<void> _onNewStudent(RegisterNewTeacherEvent event, Emitter<RegisterTeacherPageState> emit) async {
    UserDTO newUser = UserDTO(
      nome: event.user.nome,
      matricula: event.user.matricula,
      senha: event.user.senha,
      tipoAcesso: event.user.tipoAcesso,
      ativo: true
    );

    var resp = await _userService.newUser(newUser);
    
    if (resp?.matricula != null && resp!.matricula!.isNotEmpty) {
      emit(NewTeacherRegisteredState(user: resp));
    } else {
      emit(NewStudentCreationErrorState());
    }
  }
  
}