import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tan loi"),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: MyWidget(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.eighteen_up_rating_sharp),
                label: "Home",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        fontFamily: "Freedom-10eM",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return banner();
  }

  Widget example() {
    return Stack(
      children: [
        Image.asset("assets/images/avatar.jpg", fit: BoxFit.contain),
        Align(
          alignment: Alignment.topLeft,
          child: Text("Hello", style: TextStyle(color: Colors.white)),
        ),
        Container(
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 50,
                right: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.webp"),
                  radius: 50,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/avatar.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          // top: 10,
          left: 10,
          right: 10,
          bottom: 10,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Card",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            backgroundColor: Colors.lightGreenAccent,
                            color: Colors.black,
                            fontFamily: "Times New Roman",
                          ),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 25),
                  SelectableText('0123 456 789'),
                  Icon(Icons.favorite, color: Colors.red, size: 24),
                  Text(
                    "Con này xịn. Dùng rất sướng. Nhiều khi thấy nó khôn hơn cả "
                    "Gemini, Grok ở 1 số trường hợp tạo ảnh. Dùng song song mấy "
                    "con thì nó bù trừ những đoạn ngốc nghếch của nhau",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Times New Roman",
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    children: [
                      Image.network(
                        "https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/615806450_1434389544746190_2748647871483835064_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=127cfc&_nc_ohc=ia3cq1quN-cQ7kNvwFPwAPB&_nc_oc=AdlgS5fSTHTKUvzqWloAamQZ484YmC1hVWiXflU-c4_2X3hQZLLHk7SU6_4PxQ-CAbkmpwHTO2z9Mza-JRXCawzw&_nc_zt=23&_nc_ht=scontent.fdad1-1.fna&_nc_gid=0FH_LqmN7NKhGAVCQWR9pA&oh=00_AfrK6S1icbkPa3c5GY8I1hfLeCJz4gqUciwH0MziTKmMMg&oe=697139BE",
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return CircularProgressIndicator();
                        },
                        errorBuilder: (context, error, stack) {
                          return Icon(Icons.broken_image);
                        },
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 100),
                      Icon(Icons.location_on),
                      SizedBox(width: 10),
                      Text(
                        "Hà Nội",
                        // style: Theme.of(context).textTheme.bodyLarge,
                        // strutStyle: StrutStyle.fromTextStyle(
                        //     Theme.of(context).textTheme.bodyLarge!,
                        //     fontSize: 20,
                        //     fontFamily: "Times New Roman"
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget profileHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background
        Image.asset(
          'assets/images/avatar.webp',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),

        // Avatar
        Positioned(
          bottom: -40,
          left: 16,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),

        // Username
        Positioned(
          bottom: -20,
          left: 110,
          child: Text(
            'Kobi Loi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget productCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/avatar.webp',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),

          // Price
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '120.000đ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget banner() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://picsum.photos/600/300',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,

            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                height: 180,
                child: Center(child: CircularProgressIndicator()),
              );
            },

            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                height: 180,
                child: Center(child: Icon(Icons.broken_image, size: 40)),
              );
            },
          ),
        ),
        FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(12),
            child: Text('Custom Button'),
          ),
        ),
      ],
    );
  }
}
