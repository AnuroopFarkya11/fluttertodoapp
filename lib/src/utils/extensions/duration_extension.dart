extension DurationExtensions on Duration {
  /// Convert the duration to total seconds
  double get inTotalSeconds => this.inMilliseconds / 1000.0;

  /// Convert the duration to total minutes
  double get inTotalMinutes => this.inMilliseconds / (1000.0 * 60);

  /// Convert the duration to total hours
  double get inTotalHours => this.inMilliseconds / (1000.0 * 60 * 60);

  /// Convert the duration to total days
  double get inTotalDays => this.inMilliseconds / (1000.0 * 60 * 60 * 24);


  /// Format the duration as a string in HH:mm:ss format
  String get formatted {
    final hours = this.inHours.toString().padLeft(2, '0');
    final minutes = (this.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (this.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}

extension IntToDuration on int {
  /// Convert an integer to a Duration in milliseconds
  Duration get milliseconds => Duration(milliseconds: this);

  /// Convert an integer to a Duration in seconds
  Duration get seconds => Duration(seconds: this);

  /// Convert an integer to a Duration in minutes
  Duration get minutes => Duration(minutes: this);

  /// Convert an integer to a Duration in hours
  Duration get hours => Duration(hours: this);

  /// Convert an integer to a Duration in days
  Duration get days => Duration(days: this);
}

