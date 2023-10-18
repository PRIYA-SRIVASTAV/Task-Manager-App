// import 'package:flutter/material.dart';
//
// import 'Audio_recorder.dart';
//
// class RecordingScreen extends StatefulWidget {
//   @override
//   _RecordingScreenState createState() => _RecordingScreenState();
// }
//
// class _RecordingScreenState extends State<RecordingScreen> {
//   AudioRecorder audioRecorder = AudioRecorder();
//   String filePath = "your_audio_file_path.wav"; // Change this to your desired file path
//
//   @override
//   void dispose() {
//     audioRecorder.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Audio Recorder"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 await audioRecorder.startRecording(filePath);
//                 setState(() {});
//               },
//               child: Text("Start Recording"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await audioRecorder.stopRecording();
//                 setState(() {});
//               },
//               child: Text("Stop Recording"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await audioRecorder.playRecording(filePath);
//               },
//               child: Text("Play Recording"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await audioRecorder.stopPlayback();
//               },
//               child: Text("Stop Playback"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }