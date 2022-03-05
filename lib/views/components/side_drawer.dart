import 'package:bytecraft_checkin/models/user.dart';
import 'package:bytecraft_checkin/views/components/list_element.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {

  final Map<String, User> usersInstance = {};
  SideDrawer({ Key? key, required Map<String, User> usersInstance}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: const Center(
                child: Text(
                  'Participants',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor
                ),
            ),
            ListView.separated(
              itemBuilder: (_, int index)=> ListElement(content: widget.usersInstance.keys.elementAt(index),), 
              separatorBuilder: (BuildContext context, int index) => const Divider(), 
              itemCount: widget.usersInstance.length,
            )
          ],
        ),
      ),
    );
  }
}