import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_excercise/resources/strings.dart';
import 'package:state_excercise/resources/widgets/button_item_widget.dart';
import 'package:state_excercise/resources/widgets/text_and_text_field_widget.dart';
import 'package:state_excercise/resources/widgets/text_and_text_widget.dart';
import 'package:state_excercise/resources/widgets/text_widget.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? customerNameController, bookNumberController;

  SharedPreferences? sharedPreferences ;

  FocusNode? focusNode;
  bool isVip = false;
  var bookMoney = 0 ;
  var customerNumber =0 ;
  var vipCustomerNumber = 0 ;
  var moneyTotal = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerNameController  = TextEditingController();
    bookNumberController = TextEditingController();
    focusNode = FocusNode();
    getInforFromDatabase();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    customerNameController!.dispose();
    bookNumberController!.dispose();
    focusNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                TextWidget(
                    weightBox: MediaQuery.of(context).size.width,
                    text: ONLINE_BOOK_SELLING_PROGRAM,
                    colorText: Colors.white,
                    colorBox: Colors.green,
                    textAlign: TextAlign.center),
                TextWidget(
                    weightBox: MediaQuery.of(context).size.width,
                    text: INVOICE_INFORMATION,
                    colorText: Colors.black,
                    colorBox: Colors.green,
                    textAlign: TextAlign.left),
                TextAndTextFieldWidget(
                    text: CUSTOMER_NAME,
                    textController: customerNameController,
                    hintText: CUSTOMER_NAME,
                    keyboardType: TextInputType.text,
                    focusNode: focusNode
                ),
                TextAndTextFieldWidget(
                    text: BOOK_NUMBER,
                    textController: bookNumberController,
                    hintText: BOOK_NUMBER,
                    keyboardType: TextInputType.number),
                vipCheckBox(),
                TextAndTextWidget(
                    titleText: MONEY,
                    contentText: bookMoney.toString(),
                    textContentBoxColor: Colors.black26,
                    alignContentText: TextAlign.center),
                Container(
                  margin: EdgeInsets.only(right: 5, left: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ButtonItemWidget(
                          buttonText: CALCULATE_MONEY,
                          buttonFunction:(){
                            setState(() {
                              bookMoney = tinhTienFunction();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonItemWidget(
                          buttonText: CONTINUE,
                          buttonFunction:(){
                            if(customerNameController!.text !=""){
                              customerNumber ++;
                              if(isVip) vipCustomerNumber ++;
                              moneyTotal += bookMoney;
                            }
                            customerNameController!.text ="";
                            bookNumberController!.text = "";
                            setState(() {
                              isVip = false;
                            });
                            focusNode!.requestFocus();
                            bookMoney = 0;
                            setInforToDatabase(
                                customer_total: customerNumber,
                                vip_customer: vipCustomerNumber ,
                                money_total: moneyTotal);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonItemWidget(
                            buttonText: STATISTIC,
                            buttonFunction:(){
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(NOTICE),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(INCOME_TOTAL+": "+moneyTotal.toString()),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(AGREE),
                                        onPressed: () {
                                          clearSharedPreference();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                        ),
                      ),
               ],
              ),
            ),
                TextWidget(
                    text: STATISTIC_INFORMATION,
                    colorText: Colors.black,
                    colorBox: Colors.green,
                    textAlign: TextAlign.left,
                    weightBox: MediaQuery.of(context).size.width,
                    marginBox: EdgeInsets.only(top: 10, bottom: 10)
                ),
                TextAndTextWidget(
                    titleText: CUSTOMER_TOTAL,
                    contentText: customerNumber.toString(),
                    textContentBoxColor: Colors.transparent,
                    alignContentText: TextAlign.left),
                TextAndTextWidget(
                    titleText: VIP_CUSTOMER_TOTAL,
                    contentText: vipCustomerNumber.toString(),
                    textContentBoxColor: Colors.transparent,
                    alignContentText: TextAlign.left),
                TextAndTextWidget(
                    titleText:INCOME_TOTAL,
                    contentText: moneyTotal.toString(),
                    textContentBoxColor: Colors.transparent,
                    alignContentText: TextAlign.left),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                ),
                _logoutButton()
              ],
            ),

          ),
        )
    );
  }

  setInforToDatabase({required customer_total,required vip_customer, required money_total })async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setInt("customer_total", customer_total);
    await sharedPreferences!.setInt("vip_customer", vip_customer);
    await sharedPreferences!.setInt("money_total", money_total);
  }
  getInforFromDatabase()async {
    sharedPreferences = await SharedPreferences.getInstance();
    customerNumber = sharedPreferences!.getInt("customer_total")?? 0;
    vipCustomerNumber = sharedPreferences!.getInt("vip_customer")?? 0;
    moneyTotal = sharedPreferences!.getInt("money_total")?? 0;
  }

  int tinhTienFunction(){
    if(isVip) return (int.parse(bookNumberController!.text==""?"0":bookNumberController!.text) * 20000* 0.9).toInt();
    else
      return (int.parse(bookNumberController!.text==""?"0":bookNumberController!.text) * 20000);
  }

  _logoutButton()
  {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(Icons.logout),
                onPressed: (){
                  _showMyDialog();
                }),
          )
        ],
      ),
    );
  }

  clearSharedPreference()async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.clear();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(NOTICE),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(EXIT_NOTICE),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(CANCEL),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AGREE),
              onPressed: () {
                clearSharedPreference();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  vipCheckBox(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: const SizedBox()),
          Expanded(
              flex: 3,
              child: CheckboxListTile(
                title: Text(VIP_CUSTOMER),
                value: isVip,
                contentPadding: EdgeInsets.only(left: 0),
                activeColor: Colors.red,
                onChanged: (newValue) {
                  setState(() {
                    isVip = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ))
        ],
      ),
    );
  }




}