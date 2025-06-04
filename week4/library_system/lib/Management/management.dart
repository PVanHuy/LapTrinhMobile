import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Thư viện',
      home: ManagementScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ManagementScreen extends StatefulWidget {
  @override
  _ManagementScreenState createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  final TextEditingController _controller = TextEditingController(
    text: "Nguyen Van A",
  );

  // Danh sách sinh viên mẫu
  final List<String> students = [
    'Nguyen Van A',
    'Nguyen Thi B',
    'Nguyen Van C',
  ];
  String currentStudent = 'Nguyen Van A';

  // Danh sách sách mẫu
  final List<String> allBooks = ['Sách 01', 'Sách 02'];

  // Map lưu danh sách sách đã mượn của từng sinh viên
  Map<String, Set<String>> borrowedBooks = {
    'Nguyen Van A': {'Sách 01', 'Sách 02'},
    'Nguyen Thi B': {'Sách 01'},
    'Nguyen Van C': {},
  };

  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeStudent() {
    String name = _controller.text.trim();
    if (students.contains(name)) {
      setState(() {
        currentStudent = name;
      });
    } else {
      // Nếu sinh viên chưa có trong danh sách, thêm mới
      setState(() {
        students.add(name);
        borrowedBooks[name] = {};
        currentStudent = name;
      });
    }
  }

  void _toggleBook(String book, bool? value) {
    setState(() {
      if (value == true) {
        borrowedBooks[currentStudent]?.add(book);
      } else {
        borrowedBooks[currentStudent]?.remove(book);
      }
    });
  }

  void _addBook() {
    // Thêm sách đầu tiên chưa mượn vào danh sách
    final borrowed = borrowedBooks[currentStudent] ?? {};
    final notBorrowed = allBooks.where((b) => !borrowed.contains(b)).toList();
    if (notBorrowed.isNotEmpty) {
      setState(() {
        borrowedBooks[currentStudent]?.add(notBorrowed.first);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final borrowed = borrowedBooks[currentStudent] ?? {};
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: const [
            Text(
              'Hệ thống',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Quản lý Thư viện',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Sinh viên",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _changeStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Thay đổi',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Danh sách sách",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child:
                  borrowed.isEmpty
                      ? const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Bạn chưa mượn quyển sách nào\nNhấn "Thêm" để bắt đầu hành trình đọc sách!',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      )
                      : Column(
                        children:
                            allBooks
                                .where((b) => borrowed.contains(b))
                                .map(
                                  (book) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 1,
                                      child: CheckboxListTile(
                                        title: Text(book),
                                        value: borrowed.contains(book),
                                        onChanged:
                                            (bool? value) =>
                                                _toggleBook(book, value),
                                        activeColor: const Color.fromARGB(
                                          255,
                                          172,
                                          18,
                                          46,
                                        ),
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        tileColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _addBook,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                  minimumSize: const Size(150, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Thêm',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1, color: Colors.grey),
          SizedBox(
            height: 100,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              iconSize: 35,
              currentIndex: _selectedIndex,
              onTap: _onNavTapped,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Quản lý',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'DS Sách',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Sinh viên',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
