import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/data/repository/theme_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/presentation/components/app_bar.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/components/side_bar.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/utils/resources/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool setPriority = true;
  bool showCount = true;

  @override
  Widget build(BuildContext context) {
    final primaryColor = toHex(Theme.of(context).colorScheme.primary);
    final textColor = toHex(Theme.of(context).textTheme.displayLarge!.color!);
    final ThemeRepositoryImpl repository = ThemeRepositoryImpl(locator.get<Box<ThemeModel>>());
   
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: MyAppBar(
          title: "Settings",
        )
      ),
      drawer: const MySideBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(text: "General", size: 18),
              const SizedBox(height: 20,),
              BlocProvider(
                create: (context) => ThemeBloc(repository)..add(const GetTheme()),
                child: BlocConsumer<ThemeBloc, ThemeState>(
                  listener: (context, state) => {},
                  builder: (context, state) {
                    if(state is ThemeLoaded) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return const ThemeSelectorPopup();
                            }
                          );
                        },
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            return SizedBox(
                              height: 50,
                              width: constraints.maxWidth * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(text: "Theme", size: 15),
                                  const SizedBox(height: 10,),
                                  MyText(text: state.appTheme.name, size: 12, color:"#${primaryColor.substring(3)}",)
                                ],
                              ),
                            );
                          }
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              const SizedBox(height: 10,),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                    height: 50,
                    width: constraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Set priority by default", 
                              size: 15,
                              color: "#${textColor.substring(3)}"
                            ),
                            const SizedBox(height: 10,),
                            MyText(
                              text: "New todos will be set as high priority", 
                              size: 12,
                              color: "#${primaryColor.substring(3)}",
                              isLight: true,
                            ),
                          ],
                        ),
                        Switch(
                          value: setPriority, 
                          activeColor: getColorFromHex("#${textColor.substring(3)}"),
                          onChanged: (val) {
                            setState(() {
                              setPriority = val;
                            });
                          }
                        )
                      ],
                    ),
                  );
                }
              ),
              const SizedBox(height: 20,),
              MyText(text: "List", size: 18),
              const SizedBox(height: 20,),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                    height: 50,
                    width: constraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Show list counts", 
                              size: 15,
                              color: "#${textColor.substring(3)}"
                            ),
                            const SizedBox(height: 10,),
                            MyText(
                              text: "Show the number of lists in a todo", 
                              size: 12,
                              color: "#${primaryColor.substring(3)}",
                              isLight: true,
                            ),
                          ],
                        ),
                        Switch(
                          value: showCount, 
                          activeColor: getColorFromHex("#${textColor.substring(3)}"),
                          onChanged: (val) {
                            setState(() {
                              showCount = val;
                            });
                          }
                        )
                      ],
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      )
    );
  }
}