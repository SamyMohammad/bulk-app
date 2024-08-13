import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_screen_state.dart';

class ContactScreenCubit extends Cubit<ContactScreenState> {
  ContactScreenCubit() : super(ContactScreenInitial());
}
