import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textEditingController = TextEditingController();

  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
 Future speak() async{
      await flutterTts.setLanguage("hi-IN");
      await flutterTts.setPitch(1);
await flutterTts.speak("मेरे बाबू ने खाना खाया क्या , बाबू तुम्हारी बहुत याद आती है , मैं तुम्हारे बिना जी नहीं सकती हु");
    }

 Future speaktext(String text) async{
   await flutterTts.setLanguage("en-US");
   await flutterTts.setPitch(1.4);
   await flutterTts.speak(text);
 }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        TextFormField(
          controller: textEditingController,
        ),
RaisedButton(
  child: Text("Tap this button to say"),
    onPressed:
    () => speaktext(textEditingController.text),
    ),
SizedBox(height: 50,),
    Container(
    alignment: Alignment.center,
      child: RaisedButton(
        child: Text("Masti button"),
        onPressed: () => speak(),
      ),
    ),
      ],
    );
  }
}
