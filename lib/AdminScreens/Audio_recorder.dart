import 'package:audioplayers/audioplayers.dart';
import 'package:microphone/microphone.dart';

class AudioRecorder {
  AudioPlayer audioPlayer = AudioPlayer();
  MicrophoneRecorder microphoneRecorder = MicrophoneRecorder();

  Future<void> startRecording(String filePath) async {
    await microphoneRecorder.start(
      // filePath: filePath,
      // audioSource: AudioSource.microphone,
      // sampleRate: 44100,
    );
  }

  Future<void> stopRecording() async {
    await microphoneRecorder.stop();
  }

  Future<void> playRecording(String filePath) async {
    await audioPlayer.play(filePath, isLocal: true);
  }

  Future<void> stopPlayback() async {
    await audioPlayer.stop();
  }

  void dispose() {
    audioPlayer.dispose();
    microphoneRecorder.dispose();
  }
}
