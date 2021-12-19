

import 'package:async_programing_2/async_programing_2.dart' as async_programing_2;

void main(List<String> arguments) async {
Stream<int> numberStream = Stream<int>.periodic(Duration(seconds: 1), makeNumber);
await for(int x in numberStream )
{
  if(x> 100) {
    break;}
  if(x%3==0) print("Số trong stream chia hết cho 3: $x" );
}
}
int makeNumber(int value)=> value + 1; 

