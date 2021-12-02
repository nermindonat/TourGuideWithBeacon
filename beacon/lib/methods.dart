import 'dart:math' as math;

double calculateAccuracy(int txPower, double rssi) {
  if (rssi == 0) {
    return -1.0; // if we cannot determine accuracy, return -1.
  }
  double ratio = rssi * 1.0 / txPower;
  if (ratio < 1.0) {
    return math.pow(ratio, 10);
  } else {
    double accuracy = (0.89976) * math.pow(ratio, 7.7095) + 0.111;
    return accuracy;
  }
}
