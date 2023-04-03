class LanguageCodeManagement{
  LanguageCodeManagement._();
  static Map<String,String> languageMap = {
    'فارسی' : 'Persian',
    'انگلیسی': 'English',
    'روسی': 'Russian',
    'فرانسوی': 'French',
    'ایتالیایی': 'Italian',
    'المانی': 'German',
    'اسپانیایی': 'Spanish',
  };
  static List<String> latinLanguage = [
    'Persian',
    'English',
    'Russian',
    'French',
    'Italian',
    'German',
    'Spanish',
  ];
  static String getLanguageCode(String countryName){
    switch(countryName){
      case "English" :
        return "en";
      case "Persian" :
        return "fa";
      case "French" :
        return "fr";
      case "Italian" :
        return "it";
      case "Russian" :
        return "ru";
      case "Spanish" :
        return "es";
      case "German" :
        return "de";
      default:
        return "en";
    }
  }
}