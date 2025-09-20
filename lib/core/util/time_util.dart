class TimeUtil {
  static String formatDuration(int? totalMinutes) {
    if (totalMinutes == null || totalMinutes <= 0) return '0min';

    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}min';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${minutes}min';
    }
  }
}
