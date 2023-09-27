import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class DashboardCubit extends Cubit<DashboardStates>{
  DashboardCubit():super(DashboardInitialState());
  static DashboardCubit get(context)=>BlocProvider.of(context);
}