[![N|Solid](https://lh3.googleusercontent.com/proxy/exrBC6q_NpmG-vhZ5BtKEhND4yokZoeOtgC2c-CjrSZuDfReh6v6lm-sPAr66ptDc0Kk7N4vxto_pXpwU5iaTrBwspIgWyJDG7DH)](http://zeoniq.com/files/index.html)

# evo_lib

Evoloper/Evolf Internal Flutter Library

### Installation

Install the dependencies in pubsepc.yaml

```dart
  evo_lib:
    git:
      url: https://github.com/JoeLohWasHere/evoloperLib.git
      ref: main
```

### Importing

```dart
import 'package:evo_lib/evo.dart';

or

import 'package:evo_lib/evo_services.dart';
import 'package:evo_lib/evo_components.dart';
import 'package:evo_lib/evo_models.dart';

or

import 'package:evo_lib/evo_services/...'
import 'package:evo_lib/evo_components/...'
import 'package:evo_lib/evo_models/...'
```

### evo_components

Display Widgets

| Component | Description |
| ------ | ------ |
| evo_back_manager | Back button controller |
| evo_barchart | Bar chart component |
| evo_color | Default color components |
| evo_dialog | Pop-Up component |
| evo_focus_manager | Widget focus controller |
| evo_piechart | Pie chart component |
| evo_table | Table componenent |

### evo_services

General Services 

| Service | Description |
| ------ | ------ |
| evo_address_format | Formats lines of address |
| evo_alice_interceptor | API inspector/debugger |
| evo_date_range |  Date ranges |
| evo_datetime_format | Formats general date/time |
| evo_dio | API firing and interceptor |
| evo_firebase_messaging_config | Configure general firebase notifications |
| evo_http | API firing |
| evo_image_process | Encodes and decodes images to/from base-64 String |
| evo_map_list_format | Converts Lists to Map, vice versa |
| evo_oauth | Configure oAuth and provide uri |
| evo_replacer | Replacing value within String |
| evo_string_format | Formats String values |
| evo_value_format | Formats numeric values |

### evo_models

General Models 

| Model | Description |
| ------ | ------ |
| evo_piechart_model | Pie chart data structure |

## Examples
### evo_components

evo_back_manager
```dart
Scaffold(
      body: BackMod(
        child: ...
      )
)
```
evo_barchart
```dart
EvoBarChartTemplate(
    title: 'Test Bar Chart',
    subtitle: 'Test',
    xAxis: ['A', 'B', 'C'],
    data: ['10', '20', '30'],
    isReverse: true,
    isXAxisDisplay: true,
    isDarkMode: true,
)
```

evo_focus_manager
```dart
EvoFocusManager(
    child: Scaffold(
        body: ...
    )
)
```

evo_table
```dart
EvoTable(
    titleFontColor: Colors.white,
    titleRowColor: Colors.black,
    oddBarColor: Colors.black.withOpacity(0.5),
    contentColor: Colors.grey,
    titleFontSize: 14,
    titleList: ['Parent', 'Child', 'Total'],
    rowsList: [
      ['A', 'B', '100'],
      ['C', 'D', '200'],
      ['E', 'F', '300'],
    ],
)
```

### evo_services

evo_map_list_format
```dart
//Map to Lists
Map<String, String> apple = {'apple': '90%', 'orange': '50%'};

MapListFormat convertedFormat = MapListFormat(inputMap: apple);

convertedFormat.getListFromMap();

List<String> fruit =  convertedFormat.outputTitleList;
List<String> sweetness = convertedFormat.outputContentList;
```
```dart
//Lists to Map
List<String> fruit = ['apple', 'orange'];
List<String> sweetness = ['90%', '80%'];

MapListFormat convertedFormat = MapListFormat(inputTitleList: fruit, inputContentList: sweetness);

convertedFormat.getMapFromLists();

Map<String, String> apple = convertedFormat.outputMap;
```