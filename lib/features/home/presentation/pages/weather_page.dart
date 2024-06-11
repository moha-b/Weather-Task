import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task/features/home/presentation/pages/widgets/widgets.dart';

import '../bloc/weather_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[10],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Weather',
          style: TextStyle(color: Colors.purple[200]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter city name',
                labelText: 'Enter city name',
              ),
              onChanged: (query) {
                context.read<WeatherBloc>().add(OnCityChanged(query));
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const LoadingWidget();
                } else if (state is WeatherHasData) {
                  return Column(
                    key: const Key('weather_data'),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.result.cityName,
                            style: const TextStyle(fontSize: 22),
                          ),
                          CachedNetworkImage(
                              imageUrl:
                                  "https://openweathermap.org/img/wn/${state.result.iconCode}@2x.png"),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${state.result.main} | ${state.result.description}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24.0),
                      TableData(weather: state.result),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
