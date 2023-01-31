import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Repository/dictionary.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../Models/dictioary_list_model.dart';
import '../Models/dictioary_model.dart';

class DictionaryController extends GetxController{
  final box = GetStorage();
  var isLoading = true.obs;
  var texrget = "".obs;
  var isLoadingTranslat = false.obs;
  late final DictionaryRepository _repository;
  DictionaryListModel? dictionaryListModel;
  DictionaryModel? dictionaryModel;
  final TextEditingController controllerTranslate = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    _repository = DictionaryRepository();
    dictionaryList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player?.dispose();
  }
  late OverlayEntry overlayEntry;
  showProgress(BuildContext context){
    overlayEntry = OverlayEntry(builder: (c) {
      return const FunkyOverlay();
    });
    Overlay.of(context)!.insert(overlayEntry);
  }
  removeProgress(){
    overlayEntry.remove();
  }
  var indexId=0.obs;
  var url="".obs;
  getIdList(String index){
    for(int i=0;i<dictionaryListModel!.onlineDictionaries.length;i++){
      if(dictionaryListModel!.onlineDictionaries[i].title==index){
        indexId.value=dictionaryListModel!.onlineDictionaries[i].id;
        url.value=dictionaryListModel!.onlineDictionaries[i].baseUrl;
        print(indexId.value);
      }
    }
  }


  clearDictionary(){
    indexId.value=0;
  }
  AudioPlayer? _player;
  void _play() {
    _player?.dispose();
    final player = _player = AudioPlayer();
    //player.play(AssetSource('click.mp3'));
  }

  dictionary(String text,BuildContext context) async {
    if(indexId.value!=0){
      isLoadingTranslat.value=false;
      showProgress(context);
      texrget.value=text;
      await _repository.dictionary(indexId.value,text).then((value) {
        try {
          isLoadingTranslat.value=true;
          dictionaryModel=value;
          //controllerTranslate.text="";
          removeProgress();
        } catch (e) {
          removeProgress();
          isLoadingTranslat.value=false;
        }
      }).catchError((value) {
        removeProgress();
        isLoadingTranslat.value=false;
        if (kDebugMode) {
          print(value);
        }
      });
    }else{
      ShowSnackBar().showSnackBar(
        context,
        "دیکشنری را انتخاب کنید",duration: const Duration(seconds: 5),
      );
    }


  }


  dictionaryList() async {
    isLoading.value=false;
    await _repository.listDictionary().then((value) {
      try {
          isLoading.value=true;
          dictionaryListModel=value;
      } catch (e) {
        isLoading.value=false;
      }
    }).catchError((value) {
      isLoading.value=false;
      //print(value);
    });

  }
}