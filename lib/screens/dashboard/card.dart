import 'package:attend/index.dart';

class DashboardCard extends StatelessWidget {
  final String subtitle;
  final String title;
  final Function onPressed;
  final IconData icon;
  final List<Color> colors;
  final double fontSize;
  const DashboardCard({
    Key key,
    @required this.subtitle,
    @required this.title,
    this.onPressed,
    @required this.icon,
    this.colors = const [
      Color(0xFF24FCA5),
      Color(0xFF03D1B4),
    ],
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(110, 10, 20, 0),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize != null ? fontSize : 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25),
              height: 72.25,
              width: 72.25,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    offset: const Offset(2, 2),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
              ),
              child: Icon(
                icon,
                color: AppColor.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
