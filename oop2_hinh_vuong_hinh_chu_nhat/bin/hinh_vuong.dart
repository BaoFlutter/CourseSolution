import 'hinh_chu_nhat.dart';

class HinhVuong extends HinhChuNhat{
  HinhVuong({required double canh}):super(chieuDai: canh, chieuRong: canh );
  @override
  getInfor() {
    // TODO: implement getInfor
    print(
      "Thông tin của hình vuông: " + '\n' +
      "Cạnh của hình vuông: " + super.chieuDai.toString() + '\n' + 
      "Diện tích của hình vuông:  " + super.tinhDienTich().toString() + '\n' +
      "Chu vi của hình vuông: " + super.tinhChuVi().toString()
    );
  }
}