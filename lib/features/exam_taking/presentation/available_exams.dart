import 'package:exam_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AvailableExams extends StatefulWidget {
  const AvailableExams({super.key});

  @override
  State<AvailableExams> createState() => _AvailableExamsState();
}

class _AvailableExamsState extends State<AvailableExams> {
  int _selectedFilter = 0; // 0: Saved Exams, 1: Online Exams
  List<String> _savedExams = [];
  List<String> _onlineExams = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Example: populate with empty lists or mock data
    _savedExams = [];
    _onlineExams = [];
  }

  @override
  Widget build(BuildContext context) {
    final exams = _selectedFilter == 0 ? _savedExams : _onlineExams;
    final filteredExams = exams.where((exam) => exam.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Exams'),
        backgroundColor: AppColors.lightGrey,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for Exams',
                    hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) => setState(() {
                    _searchQuery = value;
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _filterBySavedOrOnline(),
            const SizedBox(height: 24),
            Expanded(
              child: filteredExams.isEmpty
                  ? Center(child: Text('No exams available, \nor try connecting to the Internet,\n or click to receive an exam.', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center,))
                  : ListView.builder(
                      itemCount: filteredExams.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredExams[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterBySavedOrOnline() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _selectedFilter == 0 ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: Container(
                width: 173.7,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.optionSelected,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = 0;
                      });
                    },
                    child: Center(
                      child: Text(
                        'Saved Exams',
                        style: TextStyle(
                          fontWeight: _selectedFilter == 0 ? FontWeight.bold : FontWeight.normal,
                          color: _selectedFilter == 0 ? const Color.fromARGB(255, 255, 255, 255): Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = 1;
                      });
                    },
                    child: Center(
                      child: Text(
                        'Online Exams',
                        style: TextStyle(
                          fontWeight: _selectedFilter == 1 ? FontWeight.bold : FontWeight.normal,
                          color:  _selectedFilter == 1 ? const Color.fromARGB(255, 255, 255, 255): Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
