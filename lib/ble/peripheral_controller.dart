import 'dart:typed_data';

import 'package:blemulator/blemulator.dart';
import 'package:get/get.dart';
import 'package:sociable/config/constants/ble/ble_constants.dart';

const _defaultUuid = '168B35A4-28EA-44A2-9D99-A0FF23DCC42B';
const _defaultAdvertisementInterval = Duration(milliseconds: 800);

class PeripheralController extends GetxController {
  final blemulator = Blemulator();
  SociablePeripheral peripheral;
  SimulatedService service;
  SimulatedCharacteristic characteristic;

  void initialize(String name) {
    characteristic =
        SimulatedCharacteristic(uuid: _defaultUuid,
            value: Uint8List(1)
        );

    service = SimulatedService(
        uuid: _defaultUuid,
        isAdvertised: true,
        characteristics: [characteristic]);

    peripheral = SociablePeripheral(
      name: name,
      id: BleConstants.uuid,
      advertisementInterval: Duration(milliseconds: 800),
      serviceList: [service],
    );

    blemulator.addSimulatedPeripheral(peripheral);
    blemulator.simulate();
  }

  void startAdvertising() {}
}

class SociablePeripheral extends SimulatedPeripheral {
  final String name;
  final String id;
  final Duration advertisementInterval;
  final List<SimulatedService> serviceList;

  SociablePeripheral({
    this.name,
    this.id = _defaultUuid,
    this.advertisementInterval = _defaultAdvertisementInterval,
    this.serviceList,
  }) : super(
            name: name,
            id: id,
            advertisementInterval: advertisementInterval,
            services: serviceList);
}
