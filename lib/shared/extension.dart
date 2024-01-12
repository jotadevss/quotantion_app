extension XmlParser on String {
  innerXmlCode() {
    final start = indexOf('<') + 1;
    final end = indexOf('>');
    return substring(start, end);
  }
}
