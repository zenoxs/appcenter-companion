import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_dto.freezed.dart';
part 'build_dto.g.dart';

@freezed
abstract class BuildDto with _$BuildDto {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory BuildDto(
    int id,
    String buildNumber,
    DateTime queueTime,
    @JsonKey(nullable: true) DateTime? startTime,
    @JsonKey(nullable: true) DateTime? finishTime,
    DateTime lastChangedDate,
    BuildStatus status,
    @JsonKey(nullable: true) BuildResult? result,
    String reason,
    String sourceBranch,
    String sourceVersion,
    List<String> tags,
  ) = _BuildDto;

  factory BuildDto.fromJson(Map<String, dynamic> json) =>
      _$BuildDtoFromJson(json);
}

enum BuildStatus { completed, notStarted, inProgress, unknown }
enum BuildResult { failed, canceled, succeeded, unknown }
