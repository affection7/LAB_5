import "package:flutter/material.dart";

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(title: const Text('Калькулятор площади')),
              body: const MyForm())),
    );

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();
  int _name = 0;
  int _name2 = 0;
  int X = 0;
  String buttonText = "Задайте параметры";
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Ширина (мм):',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Container(
                    width: 280,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Пожалуйста введите значение';
                        if (value == '0') return 'Введите другое значение ';
                        if (int.parse(value) < 0) return 'Введите не отриц значение';
                        isChanged == false;
                      },
                      controller: _nameController,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 20),
                    child: const Text(
                      'Высота (мм):',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Container(
                    width: 280,
                    child: TextFormField(
                      controller: _nameController2,
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Пожалуйста введите значение';
                        if (value == '0') return 'Введите другое значение';
                        if (int.parse(value) < 0) return 'Введите не отриц значение';
                      },
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _name = int.tryParse(_nameController.text)!;
                      _name2 = int.tryParse(_nameController2.text)!;
                      X = (_name * _name2);
                      isChanged = !isChanged;
                      isChanged == true
                          ? buttonText = "Задайте параметры"
                          : buttonText = "S = $_name2 * $_name = $X (мм2)";
                    } else {}

                    setState(() {});
                  },
                  child: const Text('Вычислить/Сбросить ткст',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      isChanged == true;
                      isChanged = !isChanged;
                      isChanged == true
                          ? buttonText = "Задайте параметры"
                          : buttonText = "Задайте параметры";
                    }
                    _nameController.clear();
                    _nameController2.clear();
                  },
                  child: const Text('Сбросить параметры',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                buttonText,
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
