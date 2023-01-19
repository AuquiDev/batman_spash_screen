import 'package:batman_spash_screen/UI/general/spaicing.dart';
import 'package:batman_spash_screen/UI/routes/routes.dart';
import 'package:batman_spash_screen/service/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemePage>(context);
    return Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          margin:
              const EdgeInsets.only(left: 30, right: 20, bottom: 15, top: 50),
          decoration: _decorationDrawer(theme),
          child: Stack(
            children: [
              Positioned(
                  left: 10,
                  top: 10,
                  child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.black.withOpacity(.3),
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            size: 10,
                            color: Colors.white,
                          )))),
              Column(
                children: [
                  spacingheight30,
                  CircleAvatar(
                    radius: 100,
                    child: Center(
                        child: Text(
                      'alberto'.substring(0, 2).toUpperCase(),
                      style: _styleDrawer(theme),
                    )),
                  ),
                  Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                            color: theme.currentTheme!.colorScheme.background),
                        itemCount: pageRoutes.length,
                        itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                child: pageRoutes[index].icon,
                              ),
                              title: Text(
                                pageRoutes[index].title,
                                style: _styleDrawer(theme),
                              ),
                              trailing: const Icon(Icons.local_activity),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            pageRoutes[index].page));
                              },
                            )),
                  ),
                  ListTile(
                    leading: !theme.dartTheme == true
                        ? const Icon(
                            Icons.light_mode_outlined,
                            color: Color.fromARGB(255, 207, 152, 23),
                          )
                        : Icon(
                            Icons.dark_mode,
                            color: theme.currentTheme!.colorScheme.secondary,
                          ),
                    title: Text(
                      theme.dartTheme == true ? 'Dark Mode' : 'Light Mode',
                      style: _styleDrawer(theme),
                    ),
                    trailing: Switch.adaptive(
                        activeColor: Colors.red,
                        value: theme.dartTheme,
                        onChanged: (value) {
                          theme.getDarkTheme = value;
                          setState(() {});
                        }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  BoxDecoration _decorationDrawer(ThemePage theme) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(begin: const Alignment(0, -2), colors: [
          !theme.dartTheme == true ? Colors.black : Colors.orangeAccent,
          !theme.dartTheme == true ? Colors.white: Colors.red,
          theme.currentTheme!.canvasColor,
        ]),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-1, 1),
            blurStyle: BlurStyle.solid,
            blurRadius: 1,
            color: !theme.dartTheme == true ? Colors.grey : Colors.redAccent,
          )
        ]);
  }

  TextStyle _styleDrawer(ThemePage theme) => TextStyle(
        color: theme.currentTheme!.colorScheme.secondary,
      );
}
