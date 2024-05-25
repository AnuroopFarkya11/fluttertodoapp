import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertodoapp/src/provider/auth_provider.dart';
import 'package:fluttertodoapp/src/utils/extensions/sizedbox_extension.dart';
import 'package:fluttertodoapp/src/widgets/textFeild/text_feild.dart';

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({super.key});

  @override
  ConsumerState<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends ConsumerState<DashBoard> {
  final ScrollController _parentController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _getDrawer(),
      appBar: _getAppBar(),
      body: _getBody(),
      floatingActionButton: _getFloatingAction(),
    );
  }

  _getAppBar() {
    return AppBar(
      actions: [
        CircleAvatar(
          radius: 15.r,
          backgroundColor: Colors.white,
        )
      ],
    );
  }

  _getDrawer() {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: Text("Logout"),
            onTap: () {
              ref.read(userAuthProvider.notifier).signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  _getBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        controller: _parentController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSearchBar(),
            40.heightBox,
            _getTitle(),
            _getList(),
          ],
        ),
      ),
    );
  }

  _getFloatingAction() {
    return FloatingActionButton(
      onPressed: _onActionTap,
      child: Icon(Icons.add),
    );
  }

  _getSearchBar() {
    return TextField(
      decoration: InputDecoration(hintText: "Search"),
    );
  }

  _getTitle() {
    return Text(
      " All ToDos",
      style: TextStyle(fontSize: 25),
    );
  }

  _getList() {
    return ListView.builder(
        controller: _parentController,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => _getCard());
  }

  _getCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Checkbox(
          value: false,
          onChanged: (bool? value) {},
        ),
        title: Text("Title"),
        subtitle: Text("24/Jan/2024 12:00"),
        trailing: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }

  _onActionTap() {
    Widget sheet = Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getSheetTitle(),
          20.heightBox,
          _getSheetField(),
          20.heightBox,
          _getSheetButton(),
        ],
      ),
    );

    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (context) => sheet);
  }

  _getSheetTitle() {
    return Text(
      " Jot A ToDo!",
      style: TextStyle(fontSize: 25),
    );
  }

  _getSheetField() {
    return Expanded(
      child: TextField(
        maxLines: 10,
        decoration: InputDecoration(hintText: "Type here"),
      ),
    );
  }

  _getSheetButton() {
    return ElevatedButton(onPressed: () {}, child: Text("Continue"));
  }
}
