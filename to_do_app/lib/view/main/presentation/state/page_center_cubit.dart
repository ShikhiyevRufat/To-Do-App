import 'package:flutter_bloc/flutter_bloc.dart';

class PageCenterCubit extends Cubit<int> {
  PageCenterCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }
}
