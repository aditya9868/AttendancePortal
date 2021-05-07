import 'package:attend/index.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key key,
    this.isLoading = false,
    this.children = const [],
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
  }) : super(key: key);
  final bool isLoading;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: children,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        isLoading
            ? Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black45,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container()
      ],
    );
  }
}
