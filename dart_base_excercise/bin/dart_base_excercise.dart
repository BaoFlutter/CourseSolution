import 'package:dart_base_excercise/dart_base_excercise.dart' as dart_base_excercise;




void main(List<String> arguments) {
  print("============== Bài tập 0 ==================");
  //0.Từ 1 đến 1000 in ra các số chẵn mà tổng các số đó không lớn hơn 400.
  printEvenNumberWithCondition(limitedNumber: 1000, maxSum: 400);
  print("============== Bài tập 1 ==================");
  //1. Từ. 1 đến 10000, Viết chương trình đếm xem có bao nhiêu chữ số chia hết cho 3 , bao nhiêu số chia hết cho 5
  printHowManyNumbersDivisibleBy3And5(limitedNumber: 1000); 
  print("============== Bài tập 2 ==================");
  //2.Chomộtlist:Listlist5=[4,3,10,9,15,7,6,5,8]; Inratổngcácsốchiahếtcho3.
  List<int> list5 = [4, 3, 10, 9, 15, 7, 6, 5, 8];
  print("Tổng các số chia hết cho 3: ${getSumOfNumbersDevisible3(numberList:list5)}");
  print("============== Bài tập 3 ==================");
  // 3 : Tìm hotline 
  Map classInformation = {
    "id": 12,
    "name": "Báo Flutter 1.2",
    "description": "Lớp học lập trình Flutter, hot line: 0349582808"
  };
  String  description = classInformation['description'];
  print(description.substring(description.length -10, description.length));

}

void printEvenNumberWithCondition({required int limitedNumber, required int maxSum}){
  int sum = 0;
  int tempSum = 0; 
  int count = 1;
  print("các số chẵn mà tổng các số đó không lớn hơn $maxSum là:");
  while (count <= limitedNumber) {
   if(count%2 == 0) { 
     sum += count;
     if(sum > maxSum) break;
     print('$count');
     }
     tempSum = sum;
    count++;
  }
  print("Tổng các số đó là: $tempSum");
}

void printHowManyNumbersDivisibleBy3And5({required int limitedNumber}){
  int demChiaHetCho3 = 0;
  int demChiaHetCho5 = 0;
  for (int i = 1; i <= limitedNumber; i++) {
    if (i % 3 == 0) {
      demChiaHetCho3++;
    }
    if (i % 5 == 0) {
      demChiaHetCho5++;
    }
  }
  print("==>có $demChiaHetCho3  chữ số chia hết cho 3\n");
  print("==>có $demChiaHetCho5 chữ số chia hết cho 5\n");
}

int getSumOfNumbersDevisible3({required List<int> numberList}){
  int sum = 0;
  for (int number in numberList) {
    if (sum % 3 == 0) {
      sum += number;
    }
  }
  return sum; 
  
}

