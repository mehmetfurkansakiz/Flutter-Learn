import 'package:flutter/material.dart';
import 'package:flutter_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'body');

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..body = 'body';
    user1.body = 'body';
    //..userId = 1..body = 'body';   post model constructorun sonunda ; olmamalı

    final user2 = PostModel2(1, 2, 'a', 'b');
    user2.body = 'body'; //final işaretli değil bu yüzden güncellenebiliyor

    final user3 = PostModel3(1, 2, 'a', 'b');
    //user3.body = 'body'; //final işaretli bu yüzden güncellenemez

    // localde işlem yapılıyorsa bu yöntemleri kullanmak daha mantıklı
    final user4 = PostModel4(id: 1, userId: 2, title: 'a', body: 'b');
    // user4.body = 'body';

    final user5 = PostModel5(userId: 1, id: 2, title: 'a', body: 'b');
    //user5. // private tanımladığımız için göremiyoruz. encapsulation gerekiyor. String get userId => _userId;

    final user6 = PostModel6(userId: 1, id: 2, title: 'a', body: 'b');
    //yser6. // private tanımladığımız için göremiyoruz. encapsulation gerekiyor. String get userId => _userId;

    final user7 = PostModel7(); //değerler default olarak tanımlanıyor
    // user7.userId = 1; // değerlere erişebiliyoruz ancak private olduğu için değiştiremiyoruz

    // servisten daha geliyorsa bu yöntemi kullanmak daha mantıklı
    final user8 = PostModel8(body: 'body');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: 'title');
            user9.updateBody(null);
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'),
      ),
    );
  }
}
