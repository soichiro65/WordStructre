import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  await Firebase.initializeApp();
  runApp(WordStructureApp());
}


class WordStructureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Structure',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> WordListName =[];
  List<String> WordListExplain =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メインページ'),
        actions:<Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.favorite),
             ),
          IconButton(
             onPressed: (){},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          Container(
            height: 100,
            child: Text('単語帳選択'),
          ),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: WordListName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(WordListName[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newWordList = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return WordListAddPage();
            }),
          );
          if (newWordList != null) {
            setState(() {
              WordListName.add(newWordList[0]);
              WordListExplain.add(newWordList[1]);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


class WordListAddPage extends StatefulWidget {
  @override
  _WordListAddPageState createState() => _WordListAddPageState();
}

class _WordListAddPageState extends State<WordListAddPage> {
  //String _WordName = '';
  //String _WordExplain = '';
  List<String> _WordList = ['',''];
  @override
  Widget build(BuildContext context){
    return Scaffold(  
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('単語帳追加'),
        actions:<Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('単語帳名'),
            Text(_WordList[0], style: TextStyle(color:Colors.blue)),
            const SizedBox(height:8),
            TextField(
              onChanged: (String value1){
                setState((){
                  _WordList[0] = value1;
                });
              }
            ),
            const SizedBox(height: 8),
            Text('説明'),
            Text(_WordList[1], style: TextStyle(color:Colors.blue)),
            const SizedBox(height:8),
            TextField(
              onChanged: (String value2){
                setState((){
                  _WordList[1] = value2;
                });
              }
            ),
            const SizedBox(height:8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pop(_WordList); //ここにWordExplainも渡したい
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DoSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('メインページ'),
          actions:<Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite),
              ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Color.fromARGB(255, 33, 243, 236),
              padding: EdgeInsets.all(8),
              child: Text('WordStructure', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:36, color: Colors.white),
                textAlign: TextAlign.center,
                ),
              ),
            // デフォルト表示
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('単語を構造化して管理できるアプリです'),
                Text('ラベルを単語に紐づけることで、自動的に可視化してくれます'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top:32),
              child: Text('メインボタン'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                ElevatedButton(
                  onPressed: (){},
                  child: Text('単語を追加'),
                  ),                
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    elevation: 16,
                  ),
                  child: Text('ラベルを管理'),
                  ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('単語構造化'),
                  ),
              ],
            ),
          ],
        ),
      );
  }
}