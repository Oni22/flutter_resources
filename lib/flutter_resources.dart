library flutter_resources;

import 'package:build/build.dart';
import 'package:flutter_resources/src/generator.dart';
export 'src/r_service.dart';
export 'src/r_string.dart';
export 'src/resource_builder_wrapper.dart';
export 'src/fr_parser.dart';
export 'src/generator.dart';

Builder resourceBuilder(BuilderOptions buildStep) => ResourceBuilder();