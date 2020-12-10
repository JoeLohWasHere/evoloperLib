[![N|Solid](https://lh3.googleusercontent.com/proxy/exrBC6q_NpmG-vhZ5BtKEhND4yokZoeOtgC2c-CjrSZuDfReh6v6lm-sPAr66ptDc0Kk7N4vxto_pXpwU5iaTrBwspIgWyJDG7DH)](http://zeoniq.com/files/index.html)

# evo_lib

Evoloper/Evolf Internal Flutter Library.

### Installation

Install the dependencies in pubsepc.yaml.

```yaml
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

import 'package:evo_lib/evo_services/...';
import 'package:evo_lib/evo_components/...';
import 'package:evo_lib/evo_models/...';
```

# evo_components

Display Widgets

| Component | Description |
| ------ | ------ |
| evo_back_manager | Back button controller |
| evo_barchart | Bar chart component |
| evo_color | Default color components |
| evo_dialog | Pop-Up component |
| evo_focus_manager | Widget focus controller |
| evo_piechart | Pie chart component |
| evo_table | Table component |

# evo_services

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

# evo_models

General Models 

| Model | Description |
| ------ | ------ |
| evo_piechart_model | Pie chart data structure |
