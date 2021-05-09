import 'package:attend/index.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key key,
    this.isLoading = false,
    this.children = const [],
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.appBar,
    this.isScrollable = false,
  }) : super(key: key);
  final bool isLoading;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final CustomAppBar appBar;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    appBar == null ? Container() : appBar,
                    Expanded(
                      child: isScrollable
                          ? ListView(
                              padding: padding,
                              children: children,
                            )
                          : Padding(
                              padding: padding,
                              child: Column(
                                children: children,
                              ),
                            ),
                    )
                  ],
                ),
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
