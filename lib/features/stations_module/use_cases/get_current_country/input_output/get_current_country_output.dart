import 'package:equatable/equatable.dart';

class GetCurrentCountryOutput extends Equatable {
  final String countryCode;

  GetCurrentCountryOutput(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}
