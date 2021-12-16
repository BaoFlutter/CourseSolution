class HinhChuNhat {
    double? chieuDai;
    double? chieuRong; 

    HinhChuNhat({this.chieuDai, this.chieuRong});
    
    tinhChuVi(){
      return (this.chieuDai! + this.chieuRong!)*2;
    }

    tinhDienTich(){
      return this.chieuDai! * this.chieuRong!;
    }

    getInfor(){
      print(
        "Chiều dài là: " + this.chieuDai.toString() + 
        "Chiều rộng là: " + this.chieuRong.toString() +
        "Chu vi là: " + tinhChuVi().toString() +
        "Diện tích là: " + tinhDienTich().toString()
      );
    }

}