import 'person_sample.dart';

class Person extends PersonSample {
  String? id; 
  String? name; 
  int? _birthYear;

  Person({required this.id, required this.name});

  void setBirthYear({required int birthYear })
  {
    this._birthYear = birthYear;
  }

  get birthYear => this._birthYear;

  @override
  int getAge() {
    // TODO: implement getAge
    if(this._birthYear!=null)
    return DateTime.now().year - this._birthYear!;
    else return 0;
  }

  @override
  void getInfor() {
    if(this._birthYear==null){
      print("Thông tin người dùng chưa hoàn thiện.");
      print("Bạn chưa nhập tuổi, hãy dùng hàm setter để nhập");
      return;
    }
    print(
      "Người này có tên là: " + this.name.toString() + '\n' +
      "Tuổi của họ là: " + this.getAge().toString()
    );
  }




}