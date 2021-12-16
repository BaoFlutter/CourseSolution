import 'dart:async';

class Student{
  String? studentId;
  String? userName; 
  String? _birthDay;
  String? _phoneNumber; 
  double? mathScore; 
  double? literatureScore; 
  double? englishScore;


  Student({
    required this.studentId,
    required this.userName, 
    required this.mathScore,
    required this.literatureScore,
    required this.englishScore}); 

  void setBirthDay({required String birthDay})
  {
    this._birthDay = birthDay;
  }
  void setPhoneNumber({required String phoneNumber})
  {
    this._phoneNumber = phoneNumber;
  }   

  String? get birthDay => this._birthDay;
  String? get phoneNumber => this._phoneNumber;

  void getStudentInformation()
  {
    String studentBirthDay = this._birthDay!=null ? this._birthDay.toString() : "Chưa cập nhật";
    String studentPhoneNumber = this._phoneNumber!=null ? this._phoneNumber.toString() : "Chưa cập nhật";
    print(
      "Thông tin chi tiết học sinh: " +
      "Mã số học sinh: " + this.studentId.toString() + '\n' +
      "Họ và tên học sinh: " + this.userName.toString() + '\n' +
      "Ngày sinh: " + studentBirthDay + '\n' +
      "Số điện thoại: " + studentPhoneNumber + '\n' +
      "Điểm Toán: " + this.mathScore.toString() + '\n' +
      "Điểm Văn: " + this.literatureScore.toString() + '\n'+
      "Điểm Anh: " + this.englishScore.toString()
    );
  }

  double tinhDiemTrungBinh()
  {
    return (this.mathScore! + this.englishScore! + this.literatureScore!)/3;
  }

  void xepLoaiHocSinh()
  {
    
    double diemTrungBinh = tinhDiemTrungBinh();
    if(diemTrungBinh< 5) print('Học lực: Không Đạt');
    else if(diemTrungBinh < 8) print('Học lực: Đạt');
    else print('Học lực: Xuất sắc');
  }   



}