import 'package:firstapplication/model/contact.model.dart';
import 'package:firstapplication/pages/ajout_modif_contact.page.dart';
import 'package:firstapplication/services/contact.service.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/list_helper.dart';

import '../menu/drawer.widget.dart';

class ContactePage extends StatefulWidget {
  @override
  State<ContactePage> createState() => _ContactePageState();
}

class _ContactePageState extends State<ContactePage> {
  ContactService contactService = ContactService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FormHelper.submitButton(
                "Ajout",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AjoutModifContactPage(),
                    ),
                  ).then((value) {
                    if (value != null && value) {
                      setState(() {});
                    }
                  });
                },
                borderRadius: 10,
                btnColor: Colors.blue,
                borderColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _fetchData(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fetchData() {
    return FutureBuilder<List<Contact>>(
      future: contactService.listeContacts(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return _buildDataTable(snapshot.data!);
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }

  Widget _buildDataTable(List<Contact> listContacts) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ListUtils.buildDataTable(
        context,
        ["Nom", "Telephone", "Action"],
        ["nom", "tel", ""],
        false,
        0,
        listContacts,
        (Contact c) {
          // Modifier contact
        },
        (Contact c) {
          // Supprimer contact
        },
        headingRowColor: Colors.orangeAccent,
        isScrollable: true,
        columnTextFontSize: 20,
        columnTextBold: false,
        columnSpacing: 50,
        onSort: (columnIndex, columnName, asc) {},
      ),
    );
  }
}
