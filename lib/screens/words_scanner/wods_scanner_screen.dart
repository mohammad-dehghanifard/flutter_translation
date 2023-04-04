// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/core/service/translate_api.dart';
import 'package:flutter_translation_demo/core/style/text_style.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WordsScannerScreen extends StatefulWidget {

  const WordsScannerScreen({Key? key}) : super(key: key);

  @override
  State<WordsScannerScreen> createState() => _WordsScannerScreenState();
}

class _WordsScannerScreenState extends State<WordsScannerScreen> {
  // تشخیص این که کاربر در حال اسکن هست یا خیر
   bool scanning = false;

  // نگهداری مقدار اسکن شده
   String scanningValue = '';
   String scanningTranslationValue = '';

  // فایل عکس کاربر
  XFile? imageFile;

  // کلمات اسکن شده برای ترجمه
   Map<String,String> scanningWords = {};

   // تابع دریافت تصویر از کاربر
  void getImage({required ImageSource imageSource}) async {
    try{
      final imagePicker = await ImagePicker().pickImage(source: imageSource);
      if(imagePicker != null){
        setState(() {
          scanning = true;
          imageFile = imagePicker;
        });
        scanImage(userInputImage: imageFile!);
      }
    }catch(e){
      setState(() {
        scanning = false;
        imageFile = null;
        scanningValue = 'در زمان اسکن تصویر خطایی رخ داده لطفا مجددا امتحان کنید';
      });
    }
  }
  // اسکن تصویر و تشخیص کلمات داخل عکس
  void scanImage({required XFile userInputImage}) async {
    scanningWords.clear();
    scanningValue = '';
    scanningTranslationValue = '';

    //دریافت عکس برای پردازش
    final inputImage = InputImage.fromFilePath(userInputImage.path);
    // مشخص کردن نوع پردازش
    final textDetector = GoogleMlKit.vision.textDetector();
    // پردازش تصویر و جدا کردن کلمات
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    // قرار دادن کلمات پردازش شده به همراه معنی داخل {map}
    for(TextBlock block in recognisedText.blocks){
      for(TextLine line in block.lines){
        scanningWords.addAll({line.text : 'none'});
        scanningValue += "${line.text}\n";
      }
    }
    await translateWords();
    scanning = false;
    setState(() {});
  }
  Future<void> translateWords() async {
    for(var wordKey in scanningWords.keys){
      final translatedWord = await TranslateApiService.translatorApi(txt: wordKey, fromLnCode: "en", toLnCode: "fa");
      scanningWords.update(wordKey, (value) => translatedWord);
    }

    for(var value in scanningWords.values) {
      scanningTranslationValue += "$value\n";
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.fromLTRB(12, 16, 24, 0),
        decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 20)
    ]
    ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(imageFile == null)
            Text("تشخیص کلمات(OCR)",style: AppTextStyle.title.apply(color: Colors.black)),

            if(imageFile == null)
            Text("با کمک این بخش از برنامه میتونید به راحتی لغات موجود داخل تصاویر رو از گالری یا دوربین گوشی خودتون اسکن و ترجمه کنید.",style: AppTextStyle.subTitle),

            SizedBox(height: size.height * 0.04,),

            // image
            imageFile == null? Center(child: Image.asset("assets/gifs/scanning.gif",height: 132,))
            :Center(child: Image.file(File(imageFile!.path),height: 260)),

            //نمایش نتیجه اسکن
            scanning?
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 4),
              child: LoadingAnimationWidget.discreteCircle(color: Colors.blueAccent, size: 32),
            )) :
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 8),
              width: size.width,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
              decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 20)
                    ]
                ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(scanningTranslationValue,style: AppTextStyle.subTitle.apply(color: Colors.redAccent)),
                    Text(scanningValue,style: AppTextStyle.subTitle),
                  ],
                ),
              ),
            ),
            SizedBox(height:  size.height * 0.03,),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(
                  onPressed: () => getImage(imageSource: ImageSource.camera),
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(size.width * 0.06,size.height * 0.06)),
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    elevation: MaterialStateProperty.resolveWith((states) {
                      if(states.contains(MaterialState.pressed)){
                        return 4;
                      }
                      else{
                        return 8;
                      }
                    })
                  ) ,
                  child: Row(children: [
                    Text('اسکن از دوربین',style: AppTextStyle.title.apply(color: Colors.white)),
                    const SizedBox(width: 6),
                    const Icon(Icons.camera)
                  ],)),
              ElevatedButton(
                  onPressed: () => getImage(imageSource: ImageSource.gallery),
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(size.width * 0.06,size.height * 0.06)),
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    elevation: MaterialStateProperty.resolveWith((states) {
                      if(states.contains(MaterialState.pressed)){
                        return 4;
                      }
                      else{
                        return 8;
                      }
                    })
                  ) ,
                  child: Row(
                    children: [
                    Text('اسکن از گالری',style: AppTextStyle.title.apply(color: Colors.white)),
                    const SizedBox(width: 6),
                    const Icon(Icons.image)
                  ],)),
              ],
            )
      ],
    ),
        ),
    );
  }
}
