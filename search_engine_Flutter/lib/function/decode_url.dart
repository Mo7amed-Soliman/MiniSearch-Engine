String decodeUrl(String url) {
  final decodedUrl = url
      .replaceAll('_slash_', '/')
      .replaceAll('_double_back_slash_', '\\')
      .replaceAll('_colon_', ':')
      .replaceAll('_asterisk_', '*')
      .replaceAll('_question_', '?')
      .replaceAll('_double_quote_', '"')
      .replaceAll('_less_than_', '<')
      .replaceAll('_greater_than_', '>')
      .replaceAll('_pipe_', '|');

  return 'https://$decodedUrl';
}
