// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// abstract class DioManager {
//   static Dio get getDio {
//     final dio = Dio();
//     dio.interceptors.addAll([
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         compact: true,
//       ),
//     ]);

//     dio.options.followRedirects = true;
//     dio.options.maxRedirects = 5;
//     dio.options.contentType = 'application/json';
//     dio.options.headers['Authorization'] = 'Bearer token';
//     dio.options.headers.addAll({
//       "Accept": "application/json",
//       "Authorization":
//           "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzM2MDc2ODc2LCJleHAiOjE3MzY5NDA4NzZ9.xKc0_Mjvx6fNhRxXlnTr-42nGQyK6xQk0q55J_v2W0A"
//     });

//     return dio;
//   }
// }
