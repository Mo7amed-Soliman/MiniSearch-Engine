String getMatchingLine(List<String> lines, String searchWord) {
  for (var line in lines) {
    if (line.trim().startsWith(searchWord)) {
      return line;
    }
  }
  return ''; // Return null if no matching line is found
}
