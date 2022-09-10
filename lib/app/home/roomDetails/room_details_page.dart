import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/app/home/roomDetails/room_details_viewmodel.dart';
import 'package:ARQMS/models/room/room_history.dart';
import 'package:ARQMS/services/room_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final roomDetailsModelProvider = ChangeNotifierProvider<RoomDetailsViewModel>(
  (ref) => RoomDetailsViewModel(roomService: ref.read(roomService)),
);

class RoomDetailsPage extends ConsumerStatefulWidget {
  final String roomId;

  const RoomDetailsPage(this.roomId, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends ConsumerState<RoomDetailsPage> {
  late ZoomPanBehavior _zoomPanBehavior;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    super.initState();

    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
    );
    _trackballBehavior = TrackballBehavior(
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
      tooltipSettings: const InteractiveTooltip(enable: true),
    );

    final viewModel = ref.read(roomDetailsModelProvider);
    viewModel.loadRoom(widget.roomId);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(roomDetailsModelProvider);
    final detailsProvider = ref.watch(roomDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("roomDetails.title".i18n(context)),
        leading: BackButton(onPressed: viewModel.onBack),
      ),
      body: _buildContent(viewModel, detailsProvider),
    );
  }

  Widget _buildContent(
    RoomDetailsViewModel viewModel,
    AsyncValue<List<RoomHistory>?> detailsProvider,
  ) {
    return detailsProvider.when(
      data: (history) => _data(history ?? <RoomHistory>[]),
      error: (err, __) => _error(err),
      loading: () => _loading(),
    );
  }

  Widget _data(List<RoomHistory> history) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            primaryYAxis: NumericAxis(
              name: "Temperature",
              decimalPlaces: 0,
              labelFormat: '{value}°C',
            ),
            series: [
              FastLineSeries(
                dataSource: history,
                xValueMapper: (RoomHistory data, _) =>
                    data.createdAt!.toLocal(),
                yValueMapper: (RoomHistory data, _) => data.temperature,
                emptyPointSettings:
                    EmptyPointSettings(mode: EmptyPointMode.gap),
              )
            ],
            zoomPanBehavior: _zoomPanBehavior,
            trackballBehavior: _trackballBehavior,
          ),
          SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            primaryYAxis: NumericAxis(
              name: "Humidity",
              decimalPlaces: 1,
              labelFormat: '{value} %',
            ),
            series: [
              FastLineSeries(
                dataSource: history,
                xValueMapper: (RoomHistory data, _) =>
                    data.createdAt!.toLocal(),
                yValueMapper: (RoomHistory data, _) => data.relativeHumidity,
                emptyPointSettings:
                    EmptyPointSettings(mode: EmptyPointMode.gap),
              )
            ],
            zoomPanBehavior: _zoomPanBehavior,
            trackballBehavior: _trackballBehavior,
          ),
          SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            primaryYAxis: NumericAxis(
              name: "Pressure",
              decimalPlaces: 1,
              labelFormat: '{value} hPa',
            ),
            series: [
              FastLineSeries(
                dataSource: history,
                xValueMapper: (RoomHistory data, _) =>
                    data.createdAt!.toLocal(),
                yValueMapper: (RoomHistory data, _) => data.pressure / 10,
                emptyPointSettings:
                    EmptyPointSettings(mode: EmptyPointMode.gap),
              )
            ],
            zoomPanBehavior: _zoomPanBehavior,
            trackballBehavior: _trackballBehavior,
          ),
        ],
      ),
    );
  }

  Widget _error(Object err) {
    return Center(child: Text("Something went wrong. " + err.toString()));
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }
}
