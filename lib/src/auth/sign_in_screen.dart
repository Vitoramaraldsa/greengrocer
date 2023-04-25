import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'components/custom_text_field.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // obter o tamanho da tela do dispositivo ---------------------------------------------------
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //rich text: nome do app -----------------------------------------------------
                  Text.rich(
                      TextSpan(style: const TextStyle(fontSize: 40), children: [
                    const TextSpan(
                        text: "Green",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "grocer",
                        style: TextStyle(
                          color: CustomColors.customConstrastColor,
                        ))
                  ])),
                  // categorias do app ---------------------------------------------------------
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: const Duration(milliseconds: 50),
                        animatedTexts: [
                        FadeAnimatedText('Frutas'),
                        FadeAnimatedText('Verduras'),
                        FadeAnimatedText('Legumes'),
                        FadeAnimatedText('Carnes'),
                        FadeAnimatedText('Cereais'),
                        FadeAnimatedText('Laticíneos'),
                      ]),
                    ),
                  )
                ],
              )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //email ----------------------------------------------------------------------------
                      const CustomTextField(
                        icon: Icons.email,
                        label: "Email",
                      ),
                      //senha ----------------------------------------------------------------------------
                      const CustomTextField(
                        icon: Icons.lock,
                        label: "Senha",
                        isSecret: true,
                      ),
                      //entrar ---------------------------------------------------------------------------
                      SizedBox(
                          height: 50,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), backgroundColor: Colors.green, elevation: 1),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/base');
                          },
                          child: const Text("Entrar",style: TextStyle(fontSize: 18, color: Colors.white)))),
                      //esqueceu a senha ------------------------------------------------------------------
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Esqueceu a senha?",
                                  style: TextStyle(color: CustomColors.customConstrastColor)))),
                      //divisor ---------------------------------------------------------------------------
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Ou"),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // button novo usuário ----------------------------------------------------------------
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/cadastro');
                          },
                          style: OutlinedButton.styleFrom(
                              side:
                                   BorderSide(width: 2, color: CustomColors.customSwatchColor),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          child: const Text("Criar Conta",
                              style: TextStyle(fontSize: 18)),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
