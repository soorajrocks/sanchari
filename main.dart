import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanchari/LocalString.dart';
import 'ch_lang.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyA-FJQFdpYMUMH0j6kUkql7QUbj1cuMRbg",
        appId: "1:850467632909:web:a6cb55c1f60c4f08e4a244",
        messagingSenderId: "850467632909",
        projectId: "sanchari-4e461",
        measurementId: "G-7HQTXF5964"
    ));
  }

    await Firebase.initializeApp();
    runApp(const MyApp());
  }
  class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
  return GetMaterialApp(
  translations: LocalString(),
  locale:Locale('en_US'),
  home: const HomePage(),
  theme:ThemeData(
  primarySwatch: Colors.blue,
  ),
  );
  }
  }
  class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();

  Widget build(BuildContext context) {
  return Scaffold(
  appBar:AppBar()
  );
  }
  }

  class _HomePageState extends State<HomePage>{
  final _firstTextController = TextEditingController();
  final _secondTextController = TextEditingController();

  void _search(){
  String fromValue = _firstTextController.text.trim();
  String toValue = _secondTextController.text.trim();

  // Perform Firestore query using fromValue and toValue
  FirebaseFirestore.instance.collection('your_collection')
      .where('from', isEqualTo: fromValue)
      .where('to', isEqualTo: toValue)
      .get()
      .then((QuerySnapshot querySnapshot) {
  // Handle query results
  querySnapshot.docs.forEach((doc) {
  // Access document fields as needed
  print(doc.data());
  });
  }).catchError((error) => print("Error getting documents:$error"));

  }


  // To fetch the data from database


  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("title".tr),
  ),
  drawer: const SidebarMenu(),
  body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  TextField(
  controller: _firstTextController,
  decoration: InputDecoration(
  labelText: "from".tr,
  border: OutlineInputBorder(),
  ),
  ),
  const SizedBox(height: 20),
  TextField(
  controller: _secondTextController,
  decoration: InputDecoration(
  labelText: "to".tr,
  border: OutlineInputBorder(),
  ),
  ),
  const SizedBox(height: 20),
  ElevatedButton(
  onPressed: _search,
  child: Text("search".tr),
  ),
  const SizedBox(height: 20),
  Expanded(
  child: _buildSearchResults(),
  ),// Method to display search results
  ],
  ),
  ),
  );
  }
  Widget _buildSearchResults() {
  return StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('your_collection')
      .where('from', isEqualTo: _firstTextController.text.trim())
      .where('to', isEqualTo: _secondTextController.text.trim())
      .snapshots(),
  builder: (context, snapshot) {
  if (snapshot.hasError) {
  return Text('Error: ${snapshot.error}');
  }

  if (snapshot.connectionState == ConnectionState.waiting) {
  return CircularProgressIndicator();
  }

  if (snapshot.data!.docs.isEmpty) {
  return Text('No results found');
  }

  // Display search results here
  return ListView(
  children: snapshot.data!.docs.map((DocumentSnapshot document) {
  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  return ListTile(
  title: Text(data['title']), // Replace with your document field
  subtitle: Text(data['description']), // Replace with your document field
  // Customize ListTile based on your data structure
  );
  }).toList(),
  );
  },
  );
  }


  @override
  void dispose() {
  _firstTextController.dispose();
  _secondTextController.dispose();
  super.dispose();
  }
  }

  class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
  return Drawer( // Sidebar menu implementation
  child: ListView( // List of items in the sidebar
  padding: EdgeInsets.zero, // Remove default padding
  children: [
  DrawerHeader( // Header at the top of the sidebar
  decoration: BoxDecoration(
  color: Colors.blue, // Background color
  ),
  child: Text(
  'menu'.tr,
  style: TextStyle(
  color: Colors.white, // Text color
  fontSize: 24,
  ),
  ),
  ),
  ListTile( // Navigation item for the home page
  leading: const Icon(Icons.home),
  title: Text('home'.tr),
  onTap: () {
  Navigator.pop(context); // Close the drawer
  },
  ),
  ListTile( // Navigation item for the search page
  leading: const Icon(Icons.language),
  title: Text('language'.tr),
  onTap: () {
  // To navigate to the ch_lang.dart
  Navigator.push(context,MaterialPageRoute(builder:
  (context) =>const ch_lang()),); // Close the drawer
  },
  ),
  ListTile( // hn Icon(Icons.person),
  leading: const Icon(Icons.history),
  title: Text('history'.tr),
  onTap: () {
  Navigator.pop(context); // Close the drawer
  },
  )
  ],
  ),
  );
  }
  }
