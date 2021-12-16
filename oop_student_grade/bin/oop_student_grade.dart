
import 'student.dart';

void main(List<String> arguments) {
  Student student1 = Student(
    studentId: "S1",
    userName: "Nguyễn Vân Anh",
    mathScore: 6.5,
    literatureScore: 9.0, 
    englishScore: 7.8);
    student1.setBirthDay(birthDay: '23-10-2004');
    student1.setPhoneNumber(phoneNumber: "0349347293");
    student1.getStudentInformation();
    print(
      "Điểm trung bình của học sinh có mã số "+ 
      student1.studentId.toString()+" là: " +
      student1.tinhDiemTrungBinh().toStringAsFixed(2).toString());
      student1.xepLoaiHocSinh();

    Student student2 = Student(
    studentId: "S2",
    userName: "Nguyễn Thị Bình",
    mathScore: 8.5,
    literatureScore: 8.0, 
    englishScore: 8.8);
    student2.getStudentInformation();

    Student student3 = Student(
    studentId: "S3",
    userName: "Nguyễn Văn Cường",
    mathScore: 5.5,
    literatureScore: 9.0, 
    englishScore: 6.8);

    List<Student> studentList = []; 
    studentList.add(student1);
    studentList.add(student2);
    studentList.add(student3);

    timHocSinhGioiNhat(studentList: studentList);


}

void timHocSinhGioiNhat({required List<Student> studentList}){
  double scoreMax = 0 ; 
  Student? resultStudent; 
  for (Student student in studentList )
  {
    double averageScore = student.tinhDiemTrungBinh();
    if(averageScore > scoreMax) {
      scoreMax = averageScore;
      resultStudent =student;
    }
  }
  print("Học sinh có điểm cao nhất là: " +
  resultStudent!.userName.toString()+ 
  ", có mã số là: " + resultStudent!.studentId.toString() +
  ", có điểm trung bình là: " + scoreMax.toStringAsFixed(2).toString()
   );

}
