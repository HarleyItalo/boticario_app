import 'package:get/get.dart';
import '../enuns/controller_state.dart';

abstract class BaseController extends GetxController {
  BaseController() {
    init();
  }

  final _state = ControllerState.done.obs;

  changeState(ControllerState newState) {
    _state.value = newState;
  }

  init();

  stateEqualsTo(ControllerState state) => currentState.index == state.index;

  ControllerState get currentState => _state.value;

  succeedState() {
    changeState(ControllerState.done);
  }

  loadingState() {
    changeState(ControllerState.loading);
  }

  errorState() {
    changeState(ControllerState.error);
  }
}
