import 'package:async_excercise_1/async_excercise_1.dart' as async_excercise_1;

void main(List<String> arguments) async {
  print("Tôi xin tự giới thiệu: ");
  String name = await showString(
    text: "Tôi tên là Báo Flutter",
    duration: 3);
    print(name);

  String tuoi = await showString(
    text: "Tôi năm nay 30 tuổi",
    duration: 5);
    print(tuoi);

    String homeland = await showString(
    text: "Tôi đang sống ở Hà Nội",
    duration: 2);
    print(homeland);   


}

Future<String> showString({required String text, required int duration}){
  return Future.delayed(Duration(seconds: duration), (){
    return text;
  });

}
