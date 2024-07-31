// import 'dart:io';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:bulk_app/core/helpers/media.dart';
// import 'package:bulk_app/core/networking/api_error_model.dart';
// import 'package:bulk_app/core/networking/api_result.dart';
// import 'package:bulk_app/core/networking/base_response.dart';
// import 'package:bulk_app/features/templates/data/repos/templates_repo.dart';
// import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mockito/mockito.dart';

// import 'package:mockito/annotations.dart';

// // Mock classes
// class MockTemplatesRepo extends Mock implements TemplatesRepo {}
// class MockFile extends Mock implements File {}
// class MockAppMedia extends Mock implements AppMedia {}
// void main() {
//   late AddTemplateCubit cubit;
//   late MockTemplatesRepo mockTemplatesRepo;
//   late MockAppMedia mockAppMedia;

//   setUp(() {
//     mockTemplatesRepo = MockTemplatesRepo();
//     mockAppMedia = MockAppMedia();
//     cubit = AddTemplateCubit(mockTemplatesRepo);
//   });

//   group('AddTemplateCubit', () {
//     test('initial state is correct', () {
//       expect(cubit.state, const AddTemplateState.initial());
//     });

//     blocTest<AddTemplateCubit, AddTemplateState>(
//       'emits [AddTemplateState.stateOfButton] when validateTemplate is called',
//       build: () => cubit,
//       act: (cubit) {
//         cubit.templateNameController.text = 'Test Template';
//         cubit.validateTemplate();
//       },
//       expect: () => [ AddTemplateState.stateOfButton(isValid: true)],
//     );

//     blocTest<AddTemplateCubit, AddTemplateState>(
//       'emits [AddTemplateState.loading, AddTemplateState.success] when emitAddTemplateStates succeeds',
//       build: () {
//         when(mockTemplatesRepo.login(any))
//             .thenAnswer((_) async => const ApiResult.success('Success'));
//         return cubit;
//       },
//       act: (cubit) => cubit.emitAddTemplateStates(),
//       expect: () => [
//         const AddTemplateState.loading(),
//         AddTemplateState.success(BaseResponse(data: 'Success')),
//       ],
//     );

//     blocTest<AddTemplateCubit, AddTemplateState>(
//       'emits [AddTemplateState.loading, AddTemplateState.error] when emitAddTemplateStates fails',
//       build: () {
//         when(mockTemplatesRepo.login(any)).thenAnswer((_) async =>
//             ApiResult.failure(
//                 ApiErrorModel(error: ErrorData(details: ['Error']))));
//         return cubit;
//       },
//       act: (cubit) => cubit.emitAddTemplateStates(),
//       expect: () => [
//         const AddTemplateState.loading(),
//         const AddTemplateState.error(error: ['Error']),
//       ],
//     );

//     blocTest<AddTemplateCubit, AddTemplateState>(
//       'emits [AddTemplateState.pickedMultiMediaAndFiles] when pickMultipleMedia succeeds',
//       build: () {
//         when(mockAppMedia.pickImage())
//             .thenAnswer((_) async => XFile('test_path'));
//         return cubit;
//       },
//       act: (cubit) => cubit.pickMultipleMedia(),
//       expect: () => [isA<AddTemplateState>()],
//       verify: (cubit) {
//         expect(cubit.pickedFile, isNotNull);
//       },
//     );

//     test('addCurrentTimeInMessage adds current time to message', () {
//       cubit.messageController.text = 'Test message ';
//       cubit.addCurrentTimeInMessage();
//       expect(cubit.messageController.text, contains('Test message '));
//       expect(
//           cubit.messageController.text, matches(r'Test message \d{2}:\d{2}'));
//     });

//     test('addCurrentDateInMessage adds current date to message', () {
//       cubit.messageController.text = 'Test message ';
//       cubit.addCurrentDateInMessage();
//       expect(cubit.messageController.text, contains('Test message '));
//       expect(cubit.messageController.text,
//           matches(r'Test message \d{4}-\d{2}-\d{2}'));
//     });

//     test('addMessageIDInMessage adds Message ID to message', () {
//       cubit.messageController.text = 'Test message ';
//       cubit.addMessageIDInMessage();
//       expect(cubit.messageController.text, 'Test message #Message ID ');
//     });
//   });
// }
