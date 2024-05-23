import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = 'Hello World!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.chevron_left),
        // backgroundColor: Colors
        //     .transparent, //appbar rengini değiştirmek arka plan ile aynı olsun
        // elevation:
        //     0, //zaten default olarak arkaplan ile appbar aynı renkti ancak yine de yazdım. (bu kod öne getiriyor)
        // centerTitle:
        //     true, // eğer iki platform için uygulama geliştiriyorsan kesin veya kaydıysa force etmek için vermelisin!
        // systemOverlayStyle: SystemUiOverlayStyle.dark, //saat şarj göstergelerini dark yapmak
        automaticallyImplyLeading:
            false, // otomatik olarak back button eklenmesini engellemek
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          // Center(
          //   child: CircularProgressIndicator(),
          // )
        ],
      ),
      body: Column(),
    );
  }
}
