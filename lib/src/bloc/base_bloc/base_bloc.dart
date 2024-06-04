import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/bloc/base_bloc/screen_state.dart';
import 'exceptions/exceptions.dart';

abstract class BaseBloc<E, S extends ScreenState> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState) {
    on((E event, Emitter<S> emit) => mapEventToState(event).forEach((element) {
          emit(element);
        }));
  }

  Stream<S> mapEventToState(E event) async* {
    try {
      final Stream<S> _stream = handleEvents(event);

      await for (final S screenState in _stream) {
        yield screenState;
      }
    } on ServiceException catch (ex) {
      yield getErrorState()
        ..errorCode = ex.code
        ..errorMsg = ex.msg;
    } on InvalidException catch (ex) {
      yield getErrorState()
        ..isInvalidException = true
        ..errorCode = ex.code
        ..errorMsg = ex.msg;
    } on FailedException catch (ex) {
      yield getErrorState()
        ..errorCode = ex.code
        ..errorMsg = ex.msg;
    }
  }

  Stream<S> handleEvents(E event);

  S getErrorState();
}
