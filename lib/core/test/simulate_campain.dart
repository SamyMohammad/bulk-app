import 'dart:async';

enum CampaignStatus { pending, running, completed, failed }

class CampaignMocker {
  final Duration duration;
  int _tick = 0;
  late Stream<CampaignStatus> campaignStream;

  CampaignMocker(this.duration) {
    campaignStream = _createCampaignStream();
  }

  Stream<CampaignStatus> _createCampaignStream() async* {
    // Yield initial status (Pending)
    yield CampaignStatus.pending;

    // Periodically update the status
    yield* Stream.periodic(duration, (_) {
      _tick++;

      // Simulate different statuses based on time
      if (_tick == 1) return CampaignStatus.running;
      if (_tick == 3) return CampaignStatus.completed;
      if (_tick > 3) return CampaignStatus.failed;
      return CampaignStatus.pending;
    });
  }
}
