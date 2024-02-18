import 'package:blocapps/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccess({
    required this.weatherModel,
  });
}

class WeatherFailure extends WeatherState {
  final String error;

  WeatherFailure({required this.error});
}
