import 'package:blocapps/cubit/weather_cubit/weather_state.dart';
import 'package:blocapps/models/weather_model.dart';
import 'package:blocapps/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this.weatherService,
  ) : super(WeatherInitial());
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      WeatherModel weatherModel =
          await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailure(error: e.toString()));
    }
  }
}
