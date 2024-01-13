import 'package:flutter/material.dart';

class RegisterCharacterPage extends StatefulWidget {
  const RegisterCharacterPage({Key? key}) : super(key: key);

  @override
  State<RegisterCharacterPage> createState() => _RegisterCharacterPageState();
}

class _RegisterCharacterPageState extends State<RegisterCharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterChracterEditBar(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(22.0),
            color: Colors.grey,
            child: GridView(
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 18,
              ),
              children: List.generate(20, (index) => CharacterProfile()),
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterChracterEditBar extends StatelessWidget {
  const RegisterChracterEditBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70, bottom: 22),
      height: 41,
      color: Colors.blue,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.square,
            size: 20,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('모험단 이름', style: TextStyle(fontSize: 16)),
            ),
          ),
          // 아직 기능이 없음
          IconButton(onPressed: () => {}, icon: Icon(Icons.edit)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class CharacterProfile extends StatelessWidget {
  const CharacterProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[600],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  '[길드 이름]',
                  style: TextStyle(
                    fontSize: 6,
                    fontFamily: 'DNFForgedBlade',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.square,
                      size: 6,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '명성 수치',
                      style: TextStyle(
                        fontSize: 6,
                        fontFamily: 'DNFForgedBlade',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Image(
                  image: NetworkImage('https://picsum.photos/200'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  '캐릭터 이름',
                  style: TextStyle(
                      fontSize: 8,
                      fontFamily: 'DNFForgedBlade',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  '총합 템레벨',
                  style: TextStyle(
                    fontSize: 6,
                    fontFamily: 'DNFForgedBlade',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
