import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../model/contact.model.dart';
import '../services/contact.service.dart';

class AjoutModifContactPage extends StatefulWidget {
  AjoutModifContactPage({this.contact, this.modifMode = false});
  final Contact? contact;
  final bool modifMode;
  @override
  State<AjoutModifContactPage> createState() => _AjoutModifContactPageState();
}

class _AjoutModifContactPageState extends State<AjoutModifContactPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late Contact contact;
  ContactService contactService = ContactService();

  @override
  void initState() {
    super.initState();
    contact = widget.modifMode ? widget.contact! : Contact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modifMode
            ? 'Page Modifier Contact'
            : 'Page Ajouter Contact'),
      ),
      body: Form(
        key: globalKey,
        child: _formUI(context),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormHelper.submitButton(
              widget.modifMode ? "Modifier" : "Ajouter",
              () {
                if (validateAndSave()) {
                  if (widget.modifMode) {
                    contactService.modifierContact(contact).then((value) {
                      Navigator.pop(context);
                    });
                  } else {
                    contactService.ajouterContact(contact).then((value) {
                      Navigator.pop(context);
                    });
                  }
                }
              },
              borderRadius: 10,
              btnColor: Colors.greenAccent,
              borderColor: Colors.greenAccent,
            ),
            FormHelper.submitButton(
              "Annuler",
              () {
                Navigator.pop(context);
              },
              borderRadius: 10,
              btnColor: Colors.grey,
              borderColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget _formUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FormHelper.inputFieldWidgetWithLabel(
              context,
              "nom",
              "Nom",
              "",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "* Required";
                }
                return null;
              },
              (onSaved) {
                contact.nom = onSaved!;
              },
              initialValue: widget.modifMode ? contact.nom ?? "" : "",
              showPrefixIcon: true,
              prefixIcon: const Icon(Icons.text_fields),
              borderRadius: 10,
              contentPadding: 15,
              fontSize: 14,
              labelFontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              prefixIconPaddingLeft: 10,
            ),
            FormHelper.inputFieldWidgetWithLabel(
              context,
              "telephone",
              "Téléphone",
              "",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "* Required";
                }
                return null;
              },
              (onSaved) {
                contact.tel = int.parse(onSaved!);
              },
              initialValue: widget.modifMode ? contact.tel.toString() : "",
              showPrefixIcon: true,
              prefixIcon: const Icon(Icons.phone),
              borderRadius: 10,
              contentPadding: 15,
              fontSize: 14,
              labelFontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              prefixIconPaddingLeft: 10,
              isNumeric: true,
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
