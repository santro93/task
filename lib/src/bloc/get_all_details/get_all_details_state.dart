part of 'get_all_details_bloc.dart';

abstract class GetALlDetailsState extends ScreenState {}

class GetALlDetailsInitial extends GetALlDetailsState {}

class GetALlDetailsFailedState extends GetALlDetailsState {}

class GetALlDetailsProgressState extends GetALlDetailsState {}

class GetALlDetailsDataSucessState extends GetALlDetailsState {
  final GetAllDetailsModel getAllDetailsModel;

  GetALlDetailsDataSucessState(this.getAllDetailsModel);
}

class GetALlDetailsDataFailedState extends GetALlDetailsState {
  final String message;

  GetALlDetailsDataFailedState(this.message);
}
