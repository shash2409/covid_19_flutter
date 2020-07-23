import 'package:flutter/material.dart';

var columnHeadingStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.grey[700],
  fontSize: 14.0,
);

var cityNameStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontSize: 17.0,
);

var numberStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.grey[700],
  fontSize: 17.0,
);

var deltaConfirmed = TextStyle(
  fontSize: 12.0,
  color: Colors.red.withOpacity(0.8),
  fontWeight: FontWeight.bold,
);

var deltaRecovered = TextStyle(
  fontSize: 12.0,
  color: Colors.teal[700],
  fontWeight: FontWeight.bold,
);

var deltaDeceased = TextStyle(
  fontSize: 12.0,
  color: Colors.grey[600],
  fontWeight: FontWeight.bold,
);

List districtData = [
  {
    "district": "Anantapur",
    "notes": "",
    "active": 65,
    "confirmed": 118,
    "deceased": 4,
    "recovered": 49,
    "delta": {"confirmed": 3, "deceased": 0, "recovered": 1}
  },
  {
    "district": "Chittoor",
    "notes": "",
    "active": 68,
    "confirmed": 142,
    "deceased": 0,
    "recovered": 74,
    "delta": {"confirmed": 11, "deceased": 0, "recovered": 0}
  },
  {
    "district": "East Godavari",
    "notes": "",
    "active": 16,
    "confirmed": 51,
    "deceased": 0,
    "recovered": 35,
    "delta": {"confirmed": 4, "deceased": 0, "recovered": 4}
  },
  {
    "district": "Guntur",
    "notes": "",
    "active": 166,
    "confirmed": 399,
    "deceased": 8,
    "recovered": 225,
    "delta": {"confirmed": 12, "deceased": 0, "recovered": 27}
  },
  {
    "district": "Krishna",
    "notes": "",
    "active": 133,
    "confirmed": 349,
    "deceased": 14,
    "recovered": 202,
    "delta": {"confirmed": 3, "deceased": 0, "recovered": 25}
  },
  {
    "district": "Kurnool",
    "notes": "",
    "active": 277,
    "confirmed": 591,
    "deceased": 17,
    "recovered": 297,
    "delta": {"confirmed": 7, "deceased": 1, "recovered": 13}
  }
];

var stateIndexes = {
  'an': 0,
  'ap': 1,
  'ar': 2,
  'as': 3,
  'br': 4,
  'ch': 5,
  'ct': 6,
  'dl': 7,
  'dn': 8,
  'ga': 9,
  'gj': 10,
  'hp': 11,
  'hr': 12,
  'jh': 13,
  'jk': 14,
  'ka': 15,
  'kl': 16,
  'la': 17,
  'ld': 18,
  'mh': 19,
  'ml': 20,
  'mn': 21,
  'mp': 22,
  'mz': 23,
  'nl': 24,
  'or': 25,
  'pb': 26,
  'py': 27,
  'rj': 28,
  'sk': 29,
  'tg': 30,
  'tn': 31,
  'tr': 32,
  'up': 33,
  'ut': 34,
  'wb': 35,
};
