import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  Color btn1Color = Colors.blue;
  Color btn2Color = Colors.white;
  Color btn3Color = Colors.white;
  Color btn4Color = Colors.white;

  Color btn1FntColor = Colors.white;
  Color btn2FntColor = Colors.black;
  Color btn3FntColor = Colors.black;
  Color btn4FntColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('高科大校務系統'),
        ),
        body: Column(
          children: [
              Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50, // Adjust the radius as needed
                    backgroundImage: AssetImage('assets/icon.jpg'), // Replace with your image asset
                  ),
                  SizedBox(height: 16), // Adjust the spacing as needed
                  Text('歡迎光臨MYFONE'),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: (){
                    print('1');

                    setState(() {
                      btn1Color = Colors.blue; // 新的按鈕顏色
                      btn1FntColor = Colors.white;

                      btn2Color = Colors.white; // 新的按鈕顏色
                      btn2FntColor = Colors.black;
                      btn3Color = Colors.white;
                      btn3FntColor = Colors.black;
                      btn4Color = Colors.white;
                      btn4FntColor = Colors.black;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstScreen()),
                      );
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: btn1FntColor,
                    backgroundColor: btn1Color, // 改變按鈕的背景顏色
                  ),
                  child: Text('科系管理'),
                ),

                TextButton(
                  onPressed: (){
                    print('2');
                    setState(() {
                      btn2Color = Colors.blue; // 新的按鈕顏色
                      btn2FntColor = Colors.white;

                      btn1Color = Colors.white; // 新的按鈕顏色
                      btn1FntColor = Colors.black;
                      btn3Color = Colors.white;
                      btn3FntColor = Colors.black;
                      btn4Color = Colors.white;
                      btn4FntColor = Colors.black;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: btn2FntColor,
                    backgroundColor: btn2Color, // 改變按鈕的背景顏色
                  ),
                  child: Text('課程管理'),
                ),
                TextButton(
                  onPressed: (){
                    print('3');
                    setState(() {
                      btn3Color = Colors.blue; // 新的按鈕顏色
                      btn3FntColor = Colors.white;

                      btn1Color = Colors.white; // 新的按鈕顏色
                      btn1FntColor = Colors.black;
                      btn2Color = Colors.white; // 新的按鈕顏色
                      btn2FntColor = Colors.black;
                      btn4Color = Colors.white;
                      btn4FntColor = Colors.black;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()),
                      );
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: btn3FntColor,
                    backgroundColor: btn3Color, // 改變按鈕的背景顏色
                  ),
                  child: Text('學生管理'),
                ),
                TextButton(
                  onPressed: (){
                    print('4');
                    setState(() {
                      btn4Color = Colors.blue; // 新的按鈕顏色
                      btn4FntColor = Colors.white;

                      btn1Color = Colors.white; // 新的按鈕顏色
                      btn1FntColor = Colors.black;
                      btn2Color = Colors.white; // 新的按鈕顏色
                      btn2FntColor = Colors.black;
                      btn3Color = Colors.white;
                      btn3FntColor = Colors.black;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FourthScreen()),
                      );
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: btn4FntColor,
                    backgroundColor: btn4Color, // 改變按鈕的背景顏色
                  ),
                  child: Text('選課作業'),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }

}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String dynamicText = 'Initial Dynamic Text';
  String apiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=查詢";

  TextEditingController seriesController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController directorController = TextEditingController();

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  Future<void> addDepartment(String code, String departmentName, String head) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=查詢";

    final addApiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=新增&系碼=$code&系名=$departmentName&系主任=$head";
    try {
      final response = await http.get(Uri.parse(addApiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to add department: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to add department: $error');
    }
  }

  Future<void> editDepartment(String code, String departmentName, String head) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=查詢";

    final editApiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=修改&系碼=$code&新系名=$departmentName&新系主任=$head";
    try {
      final response = await http.get(Uri.parse(editApiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to edit department: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to edit department: $error');
    }
  }

  Future<void> deleteDepartment(String code) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=查詢";

    final deleteApiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=刪除&系碼=$code";
    try {
      final response = await http.get(Uri.parse(deleteApiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to delete department: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to delete department: $error');
    }
  }

  Future<void> searchDepartment(String code, String departmentName, String head) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/departments.php?action=查詢";

    if (code != "") apiUrl += "&系碼=$code";
    if (departmentName != "") apiUrl += "&新系名=$departmentName";
    if (head != "") apiUrl += "&新系主任=$head";
    print(apiUrl);

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to search department: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to search department: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('系所管理'),
      ),
      body: Column(
        children: [
          // 上區塊
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: seriesController,
                  decoration: InputDecoration(labelText: '系碼(刪除時只需此欄)'),
                ),
                TextField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: '系名'),
                ),
                TextField(
                  controller: directorController,
                  decoration: InputDecoration(labelText: '系主任'),
                ),
              ],
            ),
          ),
          // 中區塊
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // 新增按鈕被按下時的操作
                    print('新增');
                    String code = seriesController.text;
                    String departmentName = codeController.text;
                    String head = directorController.text;

                    // 在這裡使用系號、系名、系主任的值
                    print('系碼: $code, 系名: $departmentName, 系主任: $head');

                    // 調用新增方法
                    await addDepartment(code, departmentName, head);
                  },
                  child: Text('新增'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 修改按鈕被按下時的操作
                    print('修改');
                    String code = seriesController.text;
                    String departmentName = codeController.text;
                    String head = directorController.text;

                    print('系號: $code, 新系名: $departmentName, 新系主任: $head');

                    // 調用修改方法
                    await editDepartment(code, departmentName, head);
                  },
                  child: Text('修改'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 刪除按鈕被按下時的操作
                    print('刪除');
                    String code = seriesController.text;

                    print('系號: $code');

                    // 調用刪除方法
                    await deleteDepartment(code);
                  },
                  child: Text('刪除'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 查詢按鈕被按下時的操作
                    print('查詢');
                    String code = seriesController.text;
                    String departmentName = codeController.text;
                    String head = directorController.text;

                    print('系號: $code, 新系名: $departmentName, 新系主任: $head');

                    // 調用查詢方法
                    await searchDepartment(code, departmentName, head);
                  },
                  child: Text('查詢'),
                ),
              ],
            ),
          ),
          // 下區塊
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: FutureBuilder<List<Map<String, dynamic>>?>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      // 在這裡使用 snapshot.data 來訪問查詢結果
                      final data = snapshot.data;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = data?[index] ?? {};
                          return ListTile(
                            title: Text('系名: ${item['系名']}    系主任: ${item['系主任']}'),
                            subtitle: Text('系碼: ${item['系碼']}'),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String dynamicText = 'Initial Dynamic Text';
  String apiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=查詢";

  TextEditingController seriesController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController directorController = TextEditingController();

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  Future<void> addCourse(String code, String courseName, String credit) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=查詢";

    final addApiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=新增&課號=$code&課名=$courseName&學分數=$credit";
    try {
      final response = await http.get(Uri.parse(addApiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to add course: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to add course: $error');
    }
  }

  Future<void> editCourse(String code, String courseName, String credit) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=查詢";

    final editApiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=修改&課號=$code&新課名=$courseName&新學分數=$credit";
    try {
      final response = await http.get(Uri.parse(editApiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to edit course: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to edit course: $error');
    }
  }
  Future<void> deleteCourse(String code) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=查詢";

    final deleteApiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=刪除&課號=$code";
    try {
      final response = await http.get(Uri.parse(deleteApiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to edit course: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to edit course: $error');
    }
  }
  Future<void> searchCourse(String code, String courseName, String credit) async {
    // String searchApiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=查詢";
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=查詢";

    if(code!="")apiUrl+="&課號=$code";
    if(courseName!="")apiUrl+="&新課名=$courseName";
    if(credit!="")apiUrl+="&新學分數=$credit";
    print(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to edit course: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to edit course: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('課程管理'),
      ),
      body: Column(
        children: [
          // 上區塊
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: seriesController,
                  decoration: InputDecoration(labelText: '課號(刪除時只需此欄)'),
                ),
                TextField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: '課名'),
                ),
                TextField(
                  controller: directorController,
                  decoration: InputDecoration(labelText: '學分數'),
                ),
              ],
            ),
          ),
          // 中區塊
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // 新增按鈕被按下時的操作
                    print('新增');
                    String code = seriesController.text;
                    String courseName = codeController.text;
                    String credit = directorController.text;

                    // 在這裡使用系名、系碼、系主任的值
                    print('課號: $code, 課名: $courseName, 學分數: $credit');

                    // 調用新增方法
                    await addCourse(code, courseName, credit);
                  },
                  child: Text('新增'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 修改按鈕被按下時的操作
                    print('修改');
                    String code = seriesController.text;
                    String courseName = codeController.text;
                    String credit = directorController.text;

                    print('課號: $code, 新課名: $courseName, 新學分數: $credit');

                    // 調用修改方法
                    await editCourse(code, courseName, credit);
                  },
                  child: Text('修改'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 修改按鈕被按下時的操作
                    print('刪除');
                    String code = seriesController.text;

                    print('課號: $code');

                    // 調用修改方法
                    await deleteCourse(code);
                  },
                  child: Text('刪除'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 修改按鈕被按下時的操作
                    print('查詢');
                    String code = seriesController.text;
                    String courseName = codeController.text;
                    String credit = directorController.text;

                    print('課號: $code, 新課名: $courseName, 新學分數: $credit');

                    // 調用修改方法
                    await searchCourse(code, courseName, credit);
                  },
                  child: Text('查詢'),
                ),
              ],
            ),
          ),
          // 下區塊
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: FutureBuilder<List<Map<String, dynamic>>?>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      // 在這裡使用 snapshot.data 來訪問查詢結果
                      final data = snapshot.data;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = data?[index] ?? {};
                          return ListTile(
                            title: Text('課名: ${item['課名']}    學分: ${item['學分數']}'),
                            subtitle: Text('課號: ${item['課號']}'),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  String dynamicText = 'Initial Dynamic Text';
  String apiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=查詢";

  TextEditingController seriesController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController directorController = TextEditingController();

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  Future<void> addStudent(String studentID, String studentName, String departmentCode) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=查詢";

    final addApiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=新增&學號=$studentID&姓名=$studentName&系碼=$departmentCode";
    try {
      final response = await http.get(Uri.parse(addApiUrl));

      if (response.statusCode == 200) {
        // 新增成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to add student: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to add student: $error');
    }
  }

  Future<void> editStudent(String studentID, String studentName, String departmentCode) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=查詢";

    final editApiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=修改&學號=$studentID&新姓名=$studentName&新系碼=$departmentCode";
    try {
      final response = await http.get(Uri.parse(editApiUrl));

      if (response.statusCode == 200) {
        // 修改成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to edit student: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to edit student: $error');
    }
  }

  Future<void> deleteStudent(String studentID) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=查詢";

    final deleteApiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=刪除&學號=$studentID";
    try {
      final response = await http.get(Uri.parse(deleteApiUrl));

      if (response.statusCode == 200) {
        // 刪除成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to delete student: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to delete student: $error');
    }
  }

  Future<void> searchStudent(String studentID, String studentName, String departmentCode) async {
    apiUrl = "http://10.0.2.2:81/Schedule_course/api/students.php?action=查詢";

    if (studentID != "") apiUrl += "&學號=$studentID";
    if (studentName != "") apiUrl += "&新姓名=$studentName";
    if (departmentCode != "") apiUrl += "&新系碼=$departmentCode";
    print(apiUrl);

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // 查詢成功，重新載入資料
        setState(() {});
      } else {
        throw Exception('Failed to search student: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to search student: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('學生管理'),
      ),
      body: Column(
        children: [
          // 上區塊
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: seriesController,
                  decoration: InputDecoration(labelText: '學號(刪除時只需此欄)'),
                ),
                TextField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: '姓名'),
                ),
                TextField(
                  controller: directorController,
                  decoration: InputDecoration(labelText: '系碼'),
                ),
              ],
            ),
          ),
          // 中區塊
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // 新增按鈕被按下時的操作
                    print('新增');
                    String studentID = seriesController.text;
                    String studentName = codeController.text;
                    String departmentCode = directorController.text;

                    // 在這裡使用學號、姓名、系碼的值
                    print('學號: $studentID, 姓名: $studentName, 系碼: $departmentCode');

                    // 調用新增方法
                    await addStudent(studentID, studentName, departmentCode);
                  },
                  child: Text('新增'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 修改按鈕被按下時的操作
                    print('修改');
                    String studentID = seriesController.text;
                    String studentName = codeController.text;
                    String departmentCode = directorController.text;

                    print('學號: $studentID, 新姓名: $studentName, 新系碼: $departmentCode');

                    // 調用修改方法
                    await editStudent(studentID, studentName, departmentCode);
                  },
                  child: Text('修改'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 刪除按鈕被按下時的操作
                    print('刪除');
                    String studentID = seriesController.text;

                    print('學號: $studentID');

                    // 調用刪除方法
                    await deleteStudent(studentID);
                  },
                  child: Text('刪除'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 查詢按鈕被按下時的操作
                    print('查詢');
                    String studentID = seriesController.text;
                    String studentName = codeController.text;
                    String departmentCode = directorController.text;

                    print('學號: $studentID, 新姓名: $studentName, 新系碼: $departmentCode');

                    // 調用查詢方法
                    await searchStudent(studentID, studentName, departmentCode);
                  },
                  child: Text('查詢'),
                ),
              ],
            ),
          ),
          // 下區塊
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: FutureBuilder<List<Map<String, dynamic>>?>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      // 在這裡使用 snapshot.data 來訪問查詢結果
                      final data = snapshot.data;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = data?[index] ?? {};
                          return ListTile(
                            title: Text('學號: ${item['學號']}    姓名: ${item['姓名']}'),
                            subtitle: Text('系碼: ${item['系碼']}'),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FourthScreen extends StatefulWidget {
  @override
  _FourthScreenState createState() => _FourthScreenState();
}


class _FourthScreenState extends State<FourthScreen> {
  String dynamicText = 'Initial Dynamic Text';
  String apiUrlRecords = "http://10.0.2.2:81/Schedule_course/api/records.php?action=查詢";
  String apiUrlCourses = "http://10.0.2.2:81/Schedule_course/api/courses.php?action=查詢";
  TextEditingController studentIdController = TextEditingController();
  List<Map<String, dynamic>> records = [];

  Future<void> searchRecords(String studentId) async {
    final searchApiUrlRecords = "$apiUrlRecords&學號=$studentId";

    try {
      final response = await http.get(Uri.parse(searchApiUrlRecords));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          records = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception('Failed to load records: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load records: $error');
    }
  }

  Future<Map<String, dynamic>> getCourseInfo(String courseId) async {
    final searchApiUrlCourses = "$apiUrlCourses&課號=$courseId";

    try {
      final response = await http.get(Uri.parse(searchApiUrlCourses));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return data[0];
        } else {
          throw Exception('Course not found: $courseId');
        }
      } else {
        throw Exception('Failed to load course: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load course: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('選課作業'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: studentIdController,
              decoration: InputDecoration(labelText: '輸入學號'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final studentId = studentIdController.text;
                await searchRecords(studentId);
                setState(() {
                  dynamicText = 'Updated Dynamic Text';
                });
              },
              child: Text('搜尋選課紀錄'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  final record = records[index];
                  final courseId = record['課號'];

                  return FutureBuilder<Map<String, dynamic>>(
                    future: getCourseInfo(courseId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final courseInfo = snapshot.data;

                        return ListTile(
                          title: Text('課號: $courseId'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('課名: ${courseInfo?['課名'] ?? 'N/A'}'),
                              Text('學分數: ${courseInfo?['學分數'] ?? 'N/A'}'),
                            ],
                          ),
                          // 如果成績大於等於60，則顯示打勾
                          trailing: int.parse(record['成績']) >= 60 ? Icon(Icons.check) : null,

                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

