import 'package:provider/single_child_widget.dart';
import '../providers/language_provider.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => LanguageProvider()),
];
