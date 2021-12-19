import 'package:dart_base_excercise/dart_base_excercise.dart' as dart_base_excercise;

/*
//0.Từ 1 đến 1000 in ra các số chẵn mà tổng các số đó không lớn hơn 400.

void main(List<String> arguments) {
  int sum = 0;
  int tempSum = 0; 
  int count = 1;
  print("các số chẵn mà tổng các số đó không lớn hơn 400 là:");
  while (count <= 1000) {
   if(count%2 == 0) { 
     sum += count;
     if(sum > 4000) break;
     print('$count');
     }
     tempSum = sum;
    count++;
  }
  print("Tổng các số đó là: $tempSum");
}
*/


//1. Từ. 1 đến 10000, Viết chương trình đếm xem có bao nhiêu chữ số chia hết cho 3 , bao nhiêu số chia hết cho 5
/*
void main(List<String> arguments) {
  int demChiaHetCho3 = 0;
  int demChiaHetCho5 = 0;
  for (int i = 1; i <= 10000; i++) {
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
*/
// 2.Chomộtlist:Listlist5=[4,3,10,9,15,7,6,5,8]; Inratổngcácsốchiahếtcho3.
/*
void main(List<String> arguments) {
  int sum = 0;
  List<int> list5 = [4, 3, 10, 9, 15, 7, 6, 5, 8];
  print("tổng các số chia hết cho 3 là:");
  for (int number in list5) {
    if (sum % 3 == 0) {
      sum += number;
    }
  }
  print("$sum");
}
*/

/*
//3. Cho thông tin biểu diễn dưới sạng sau :
var classInformation = {
“id”: 12,
“name”: “Báo Flutter 1.2”,
“description”: “ Lớp học lập trình Flutter, hot line: 0349582808”
};
Yêu cầu: In ra số hotline của lớp học trên.
 */
//========== Bài giải =========
void main(List<String> arguments) {
  Map classInformation = {
    "id": 12,
    "name": "Báo Flutter 1.2",
    "description": "Lớp học lập trình Flutter, hot line: 0349582808"
  };
  String  description = classInformation['description'];
  print(description.substring(description.length -10, description.length));
}

