import 'package:dio/dio.dart';
import 'package:task/src/bloc/base_bloc/base_bloc.dart';
import 'package:task/src/model/get_all_details_model.dart';
import 'package:task/src/repository/get_all_details_repo.dart';
import '../base_bloc/screen_state.dart';
part 'get_all_details_event.dart';
part 'get_all_details_state.dart';

class GetALlDetailsBloc
    extends BaseBloc<GetALlDetailsEvent, GetALlDetailsState> {
  GetALlDetailsBloc() : super(GetALlDetailsInitial());

  @override
  GetALlDetailsState getErrorState() => GetALlDetailsFailedState();

  @override
  Stream<GetALlDetailsState> handleEvents(GetALlDetailsEvent event) async* {
    if (event is GetALlDetailsDataEvent) {
      yield* _handleGetAllDetailDataEvent(event);
    }
  }

  Stream<GetALlDetailsState> _handleGetAllDetailDataEvent(
      GetALlDetailsDataEvent event) async* {
    yield GetALlDetailsProgressState();
    try {
      Map<String, dynamic> body = {
        "type": event.type,
      };
      final Response response =
          await GetAllDetailsRepository().getAllDetails(body);
      if (response.statusCode == 200) {
        final getAllDetailsModel = GetAllDetailsModel.fromJson(response.data);
        yield GetALlDetailsDataSucessState(getAllDetailsModel);
      }
    } catch (ex) {
      yield GetALlDetailsDataFailedState(ex.toString());
    }
  }
}
