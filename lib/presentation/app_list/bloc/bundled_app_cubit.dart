import 'package:appcenter_companion/repositories/bundled_application_repository.dart';
import 'package:appcenter_companion/repositories/entities/bundled_application.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundled_app_cubit.freezed.dart';

part 'bundled_app_state.dart';

class BundledAppCubit extends Cubit<BundledAppState> {
  BundledAppCubit(BundledApplicationRepository bundledApplicationRepository)
      : _bundledApplicationRepository = bundledApplicationRepository,
        super(BundledAppState()) {
    bundledApplicationRepository.bundledApplications.listen((event) {
      emit(state.copyWith(bundledApplications: event.find()));
    });
  }

  final BundledApplicationRepository _bundledApplicationRepository;

  void addBundleApp(BundledApplication bundledApplication) {
    _bundledApplicationRepository.addBundledApplication(bundledApplication);
  }
}
