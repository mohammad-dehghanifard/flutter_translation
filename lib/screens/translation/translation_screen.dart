import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translation_demo/core/style/text_style.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {

  final TextEditingController _textEditingController = TextEditingController();

  //لیست های زبان مبدا و مقصد
  List<String> originLanguages = [
    'فارسی',
    'انگلیسی',
    'روسی',
    'فرانسوی',
    'ایتالیایی',
    'المانی',
    'اسپانیایی',
  ];
  List<String> destinationLanguages = [
    'انگلیسی',
    'فارسی',
    'فرانسوی',
    'روسی',
    'المانی',
    'ایتالیایی',
    'اسپانیایی',
  ];

   String selectedOriginLanguage = 'فارسی';
   String selectedDestinationLanguages = 'انگلیسی';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 20)
        ]
      ),
      child: Column(
        children: [
          // text titles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("زبان مبدا",style: AppTextStyle.title),
              Text("زبان مقصد",style: AppTextStyle.title),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          // Dropdowns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // origin language Dropdown
              SizedBox(
                width: size.width / 3.8,
                height: size.height / 7.5,
                child: DropdownButtonFormField<String>(
                    value: selectedOriginLanguage,
                    items: originLanguages.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        alignment: Alignment.bottomCenter,
                        child: Text(item,style: AppTextStyle.subTitle.copyWith(fontSize: 14)));
                    }).toList(),
                    onChanged: (value) => setState(() {selectedOriginLanguage = value!;}),
                    style: AppTextStyle.subTitle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      filled: true,
                      fillColor: Colors.grey[300],
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                   ),
              ),
              //destination language Dropdown
              SizedBox(
                width: size.width / 3.8,
                height: size.height / 7.5,
                child: DropdownButtonFormField<String>(
                    value: selectedDestinationLanguages,
                    items: destinationLanguages.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        alignment: Alignment.bottomCenter,
                        child: Text(item,style: AppTextStyle.subTitle.copyWith(fontSize: 14)));
                    }).toList(),
                    onChanged: (value) => setState(() {selectedDestinationLanguages = value!;}),
                    style: AppTextStyle.subTitle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      filled: true,
                      fillColor: Colors.grey[300],
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                   ),
              ),
            ],
          ),
          // text field
          Row(
            children: [
              // TEXT field
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  maxLines: 4,
                  style: AppTextStyle.subTitle,
                  onChanged: (text) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: "لطفا متن خود را وارد کنید...",
                    hintStyle: AppTextStyle.subTitle.apply(color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none
                    ),
                  ),

                ),
              ),
              // icons
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                          setState(() {
                            _textEditingController.clear();
                          });
                      },
                      iconSize: 26,
                      icon: const Icon(CupertinoIcons.clear,color: Colors.red,)),
                  IconButton(
                      onPressed: () {

                      },
                      iconSize: 26,
                      icon: const Icon(Icons.volume_up,color: Colors.blueAccent,)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
