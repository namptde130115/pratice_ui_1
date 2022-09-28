import 'package:flutter/widgets.dart';
import 'package:pratice_ui_1/widget/writing.dart';

List<Map<String, dynamic>> content = [
  {
    'id': 1,
    'title': 'Title 1',
    'subtitle': 'Subtitle 1',
    'description': "Description 1"
  },
  {
    'id': 2,
    'title': 'Title 2',
    'subtitle': 'Subtitle 2',
    'description': "Description 2"
  },
  {
    'id': 3,
    'title': 'Title 3',
    'subtitle': 'Subtitle 3',
    'description': "Description 3"
  },
  {
    'id': 4,
    'title': 'Title 4',
    'subtitle': 'Subtitle 4',
    'description': "Description 4"
  },
];

class WritingProvider extends ChangeNotifier {
  Map<String, dynamic>? _contentSelected;
  Map<String, dynamic>? get contentSelected => _contentSelected;

  int currentId = 0;
  int get writingLength => content.length;

  List<Map<String, dynamic>> get listContent => content;

  setCurrentWriting(int index) {
    currentId = index;
    _contentSelected = content[index - 1];
    notifyListeners();
  }
}
