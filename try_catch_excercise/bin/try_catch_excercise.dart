import 'package:try_catch_excercise/try_catch_excercise.dart' as try_catch_excercise;

void main(List<String> arguments) {
  List ageList = [1,3,5, 8,4,20, 25, 26, -30 , 15.5, 40 , 65];
  try{
   throwExceptionInValidAge(numberList: ageList);
  }
  catch (e){
    print(e.toString());
  }
}

void throwExceptionInValidAge({ required List numberList}){
    List invalidList = [];
    List invalidListIndex = [];
    for (int i = 0; i< numberList.length; i++)
    {
     if((numberList[i] < 0)||(numberList[i] % 1 != 0)) {
        invalidList.add(numberList[i]);
        invalidListIndex.add(i);
        }
    }
    if(invalidList.length!=0) throw Exception("Các số $invalidList không phải là tuổi, có chỉ số lần lượt là: $invalidListIndex");
}