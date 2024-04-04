class FormatStrings {
  
  // Limita o tamanho de uma string colocando elipsis caso ultrapasse o limite.
  static String maxLength(String value, int max) {
    if (value.length > max) {
      return '${value.substring(0, max)}...';
    }else {
      return value;
    }
  }
}