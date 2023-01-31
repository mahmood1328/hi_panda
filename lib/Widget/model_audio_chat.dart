import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:record/record.dart';
import '../utils/const.dart';
import '../utils/res/colors.dart';
import '../utils/size_config.dart';


class ModelAudioChat extends StatefulWidget {
  final void Function(String path) onStop;
  final void Function(File file) onStopFile;
  final  Function callBack;

  const ModelAudioChat({Key? key, required this.onStop,required this.callBack,required this.onStopFile}) : super(key: key);



  @override
  _ModelAudioChatState createState() => _ModelAudioChatState();

}

class _ModelAudioChatState extends State<ModelAudioChat> {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;
  Timer? _timer;
  Timer? _ampTimer;
  final _audioRecorder = Record();
  Amplitude? _amplitude;

  @override
  void dispose() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // We don't do anything with this but printing
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }

        // final devs = await _audioRecorder.listInputDevices();

        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  String? path="";
  Future<void> _stop() async {
    _timer?.cancel();
    _ampTimer?.cancel();
     path = await _audioRecorder.stop();
     File file = File(path!);

    widget.onStopFile(file);
    widget.onStop(path!);

    setState(() => _isRecording = false);
  }

  Future<void> _pause() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    await _audioRecorder.pause();

    setState(() => _isPaused = true);
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();

    setState(() => _isPaused = false);
  }
  Widget _buildText() {
    if (_isRecording || _isPaused) {
      return _buildTimer();
    }

    return const Text("Waiting to record");
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color:ColorsApp.primaryLight2),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });

    _ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
          _amplitude = await _audioRecorder.getAmplitude();
          setState(() {});
        });
  }
  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_isRecording || _isPaused) {
      icon = const Icon(Icons.stop, color:ColorsApp.primaryLight, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon =const Icon(Icons.mic, color: ColorsApp.primary, size: 40);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            child: SizedBox(width: 56, height: 56, child: icon),
            onTap: () {
              _isRecording ? _stop() : _start();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (!_isRecording && !_isPaused) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (!_isPaused) {
      icon = const Icon(Icons.pause, color: ColorsApp.primaryLight, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color:ColorsApp.primaryLight, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            _isPaused ? _resume() : _pause();
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Container(
                margin: const EdgeInsets.only(bottom: 4,top: 8),
                width: 80,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16)
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // const Text("12:30" , style:
                    // TextStyle(fontSize: 15 , fontWeight: FontWeight.w600 ,
                    //     color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                    Lottie.asset(ConstAddress.lottie + "record1.json",height: 50,width: 90),
                    _buildText(),
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildRecordStopControl(),
                  const SizedBox(width: 20),
                  _buildPauseResumeControl(),

                 // _buildText(),
                ],
              ),

              Container(
                padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    path==""?SizedBox() :  Directionality(
                      textDirection: TextDirection.rtl,
                      child: GestureDetector(
                        onTap: (){
                          widget.callBack();
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 22,
                          child: Image.asset(
                            "${ConstAddress.image}sendM.png",
                            color: ColorsApp.white,
                            matchTextDirection: true,
                            height: 22,
                            width: 22,
                          ),
                          backgroundColor: ColorsApp.primary,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                         Navigator.pop(context);
                        },
                        child: SvgPicture.asset("${ConstAddress.icon}delete3.svg",color: ColorsApp.red,matchTextDirection: true,height: 30,width: 30,)),
                  ],
                ),
              ),

              // if (_amplitude != null) ...[
              //   const SizedBox(height: 40),
              //   Text('Current: ${_amplitude?.current ?? 0.0}',style: TextStyle(color: Colors.black),),
              //   Text('Max: ${_amplitude?.max ?? 0.0}',style: TextStyle(color: Colors.black)),
              // ],
            ],
          ),
        ));
  }

}
