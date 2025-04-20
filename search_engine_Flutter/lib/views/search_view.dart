import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_engine/function/load_map_from_json_file.dart';
import 'package:search_engine/utils/constants.dart';
import 'package:search_engine/function/convert_to_map.dart';
import 'package:search_engine/function/get_matching_line.dart';
import 'package:search_engine/function/sort_map_by_value.dart';
import 'package:search_engine/widgets/custom_button.dart';
import 'package:search_engine/widgets/custom_list_tile.dart';
import 'package:search_engine/widgets/custom_text_form_field.dart';
import 'package:search_engine/widgets/dropdown.dart';
import 'package:search_engine/widgets/title_widget.dart';
import '../function/fetch_content_in_web_hdfs_rest_api.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final GlobalKey<FormState> _signinFormKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic> _sortLinks = {};

  late List<String> lines;
  bool _notLoading = true;
  // Initial Selected Value

  String dropdownvalue = 'Inverted Index';

  @override
  void initState() {
    super.initState();
    _initializeAsyncData();
  }

  Future<void> _initializeAsyncData() async {
    // Perform your asynchronous initialization here
    // You can use await inside this method without any issues
    lines = await fetchContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: const TitleWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _signinFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 14,
                      child: CustomTextFormField(
                        hintText: 'Search',
                        controller: _searchController,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset(
                            height: 20,
                            'assets/icons/Search.svg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Dropdown(
                        dropdownvalue: dropdownvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        }),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 5,
                      child: CustomButton(
                        text: 'Search',
                        onPressed: _searchLinks,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                height: 4,
                color: secondaryColor,
              ),
              const SizedBox(height: 30.0),
              _notLoading
                  ? _sortLinks.isNotEmpty
                      ? listView()
                      : aboutResults()
                  : loadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded listView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _sortLinks.length,
        itemBuilder: (context, index) {
          return CustomListTile(
            links: _sortLinks,
            index: index,
          );
        },
      ),
    );
  }

  Center loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }

  Center aboutResults() {
    return const Center(
      child: Text(
        'About 0 results',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontFamily: 'Poppins-Regular',
        ),
      ),
    );
  }

  Future<void> _searchLinks() async {
    _sortLinks = {};
    Map<String, dynamic> result;

    if (_signinFormKey.currentState!.validate()) {
      setState(() {
        _notLoading = false;
      });
      // if as 'Inverted Index' else Page Rank
      final query = _searchController.text[0];

      if (lines.isNotEmpty) {
        result = convertToMap(getMatchingLine(lines, query));
        if (dropdownvalue == 'Inverted Index') {
          // Inverted Index
          _sortLinks = sortMapByValue(result);
        } else {
          // page rank
          Map<String, dynamic> pageRank = await loadMapFromJsonFile();

          for (var key in result.keys) {
            double value = pageRank[key];
            _sortLinks[key] = value;
          }
          _sortLinks = sortMapByValue(_sortLinks);
        }
      }

      setState(() {
        _notLoading = true;
      });
    }
  }
}
