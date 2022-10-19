import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../Models/project_list_all_model.dart';
import '../constants.dart';

class PaymentBayar extends StatelessWidget {
  const PaymentBayar({Key? key}) : super(key: key);
  // final ProjectElement project;

  // File? _file;
  // PlatformFile? _platformFile;
  //
  // selectFile() async {
  //  final file = await FilePicker.platform.pickFiles(
  //      type: FileType.custom,
  //      allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf']
  //  );
  //
  //  if (file != null) {
  //    setState(() {
  //      _file = File(file.files.single.path!);
  //      _platformFile = file.files.first;
  //    });
  //  }
  // }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          'Pembayaran',
          style: TitleApps,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // IconButton(
          //   onPressed: () {
          //     _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
          //   },
          //   icon: const Icon(Icons.shopping_cart, size: 25,),
          //   color: blush,
          // ),
        ],
      ),
      body: Container(
          height: size.height*1,
          width: size.width*1,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical:size.height*0.01,),
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              // color: blacksand,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Rp. xxxx,-',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      // color: Colors.black,
                                      color: blacksand,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Expanded(
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      //child: SubTittle(sub: "Kategori")
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      //child: SubTittle(sub: "Kategori")
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('lib/Assets/images/bca.jpg',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bank BCA',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: blacksand,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      //child: SubTittle(sub: "Kategori")
                    ),
                    Text(
                      'No. Rekening : ',
                      //konveksi.nama,
                      style: TextStyle(
                        fontSize: 17.0,
                        // fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        //color: blacksand,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      //child: SubTittle(sub: "Kategori")
                    ),
                    Text(
                      '1234 5678 910 a/n Mr. Fashionizt ',
                      //konveksi.nama,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        //color: blacksand,
                      ),
                    ),
                    Divider(
                      color: blacksand,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      //child: SubTittle(sub: "Kategori")
                    ),
                    Text(
                      'setelah pembayaran berhasil akan di verifikasi terlebih dahulu oleh pihak Fashionizt ',
                      style: TextStyle(
                        fontSize: 10.0,
                      //  fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: blacksand,
                        //color: blacksand,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      //child: SubTittle(sub: "Kategori")
                    ),
                    Text(
                      'Penting : Pastikan kamu mentransfer sesuai dengan No. Rekening yang tertera di atas ',
                      style: TextStyle(
                        fontSize: 10.0,
                        //  fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        //color: blacksand,
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // Text(
                    //     'Lampiran :',
                    //     style: TextStyle(
                    //       fontSize: 16 ,
                    //       fontWeight: FontWeight.w600,
                    //     )
                    // ),
                    // GestureDetector(
                    //   onTap: selectFile,
                    //   child: Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                    //       child: DottedBorder(
                    //         borderType: BorderType.RRect,
                    //         radius: Radius.circular(6),
                    //         dashPattern: [10, 4],
                    //         strokeCap: StrokeCap.round,
                    //         color: Colors.blue.shade400,
                    //         child: Container(
                    //           width: double.infinity,
                    //           height: 100,
                    //           decoration: BoxDecoration(
                    //               color: Colors.blue.shade50.withOpacity(.3),
                    //               borderRadius: BorderRadius.circular(6)
                    //           ),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Icon(Iconsax.folder_open, color: Colors.blue, size: 40,),
                    //               SizedBox(height: 15,),
                    //               Text(
                    //                 'Tambahkan File Desain Anda',
                    //                 style: TextStyle(
                    //                   fontSize: 15,
                    //                   color: Colors.grey.shade400,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //   ),
                    // ),
                    // _platformFile != null
                    //     ? Container(
                    //     padding: EdgeInsets.all(5),
                    //     child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text('Desain Anda',
                    //             style: TextStyle(
                    //               color: Colors.grey.shade600,
                    //               fontSize: 15,
                    //             ),
                    //           ),
                    //           SizedBox(height: 10,),
                    //           Container(
                    //               padding: EdgeInsets.all(8),
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(6),
                    //                   color: Colors.white,
                    //                   boxShadow: [
                    //                     BoxShadow(
                    //                       color: Colors.grey.shade200,
                    //                       offset: Offset(0, 1),
                    //                       blurRadius: 3,
                    //                       spreadRadius: 2,
                    //                     )
                    //                   ]
                    //               ),
                    //               child: Row(
                    //                   children: [
                    //                     ClipRRect(
                    //                         borderRadius: BorderRadius.circular(6),
                    //                         child: Image.file(_file!, width: 70,)
                    //                     ),
                    //                     SizedBox(width: 10,),
                    //                     Expanded(
                    //                         child: Column(
                    //                             crossAxisAlignment: CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text(_platformFile!.name,
                    //                                 style: TextStyle(fontSize: 13, color: Colors.black),),
                    //                               SizedBox(height: 5,),
                    //                               Text('${(_platformFile!.size / 1024).ceil()} KB',
                    //                                 style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                    //                               ),
                    //                               SizedBox(height: 5,),
                    //                               Container(
                    //                                 height: 5,
                    //                                 clipBehavior: Clip.hardEdge,
                    //                                 decoration: BoxDecoration(
                    //                                   borderRadius: BorderRadius.circular(6),
                    //                                   color: Colors.blue.shade50,
                    //                                 ),
                    //                                 child: LinearProgressIndicator(
                    //                                   value: loadingController.value,
                    //                                 ),
                    //                               ),
                    //                             ]
                    //                         )
                    //                     )
                    //                   ]
                    //               )
                    //           )
                    //         ]
                    //     )
                    // ):
                    // SizedBox(width: 10,),
              Divider(),
              Container(
                height: size.height * 0.20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    width: 300,
                    height: 37,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        primary: blush,
                        backgroundColor: blacksand,
                        shadowColor: Colors.black,
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                      ),
                      onPressed: () {
                        // register();
                      },
                      child: Text('OK'),
                    ),
                  )
                ], // <Widget>[]
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     margin: const EdgeInsets.all(5),
              //     width: double.infinity,
              //     child: ElevatedButton(
              //         onPressed: (){},
              //         child: const Text('Accept', style: TextStyle(fontSize: 20, color: blacksand, textColor: blush,)),
              //     )
              //   ),
              // ),
            ],
          )
      ),
    ],
    ),
      ),
    );
  }
}