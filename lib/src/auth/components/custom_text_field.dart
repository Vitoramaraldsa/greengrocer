import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class CustomTextField extends StatefulWidget {
  
  //variaveis
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? mask;
  
  
  //construtor padrão
  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.mask
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

//isObscure sempre vai receber o valor da variávei IsSecret
//o Suffix icon não pode receber o IsObscure, caso isso aconteça o icone desaparece pois ele é responsável por controllar somente o estado de Obscure
 late bool isObscure;
 @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: widget.mask,
        obscureText: isObscure,
        decoration: InputDecoration(
        suffixIcon: widget.isSecret ? 
          IconButton(onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          }, 
          icon: Icon( isObscure ? Icons.visibility : Icons.visibility_off)) : null,
          isDense: true,
          labelText: widget.label,
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18)
          )
        ),
      ),
    );
  }
}