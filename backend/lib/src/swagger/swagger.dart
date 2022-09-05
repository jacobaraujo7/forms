import 'package:shelf/shelf.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

Handler swaggerHandler() {
  final swagger = SwaggerUI(
    'specs/swagger.yaml',
    deepLink: true,
    title: 'Form',
  );
  return swagger;
}
