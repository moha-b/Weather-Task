part of 'widgets.dart';

class TableData extends StatelessWidget {
  const TableData({
    super.key,
    required this.weather,
  });
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const FixedColumnWidth(150.0),
      border: TableBorder.all(
        color: Colors.grey,
        style: BorderStyle.solid,
        width: 1,
      ),
      children: [
        TableRow(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                weather.temperature.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Pressure',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                weather.pressure.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Humidity',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                weather.humidity.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
