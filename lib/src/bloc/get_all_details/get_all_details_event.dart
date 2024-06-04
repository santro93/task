part of 'get_all_details_bloc.dart';

abstract class GetALlDetailsEvent {}

class GetALlDetailsDataEvent extends GetALlDetailsEvent {
  String type;
  GetALlDetailsDataEvent({required this.type});
}
