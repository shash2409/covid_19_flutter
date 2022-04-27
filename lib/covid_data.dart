import 'networking.dart';

class CovidModel {
  Future<dynamic> getIndiaData() async {
    var url = 'https://data.covid19india.org/data.json';
    NetworkHelper networkHelper = NetworkHelper(url);
    var indiaData = await networkHelper.getData();
    return indiaData;
  }

  Future<dynamic> getGlobalData() async {
    var url = 'https://corona-api.com/timeline';
    NetworkHelper networkHelper = NetworkHelper(url);
    var worldData = await networkHelper.getData();
    return worldData;
  }

  Future<dynamic> getAllCountriesData() async {
    var url = 'https://corona-api.com/countries';
    NetworkHelper networkHelper = NetworkHelper(url);
    var countryData = await networkHelper.getData();
    return countryData['data'];
  }

  Future<dynamic> getCountryData(String country) async {
    var url = 'https://corona-api.com/countries/$country';
    NetworkHelper networkHelper = NetworkHelper(url);
    var countryData = await networkHelper.getData();
    return countryData['data']['timeline'];
  }

  Future<dynamic> getDistrictData() async {
    var url = 'https://data.covid19india.org/data.json';
    //var url = 'https://api.covid19india.org/v2/state_district_wise.json';
    NetworkHelper networkHelper = NetworkHelper(url);
    var districtData = await networkHelper.getData();
    return districtData;
  }

  Future<dynamic> getZoneData() async {
    var url = 'https://data.covid19india.org/data.json';
    //var url = 'https://api.covid19india.org/v2/state_district_wise.json';
    NetworkHelper networkHelper = NetworkHelper(url);
    var zoneData = await networkHelper.getData();
    return zoneData['zones'];
  }
}
