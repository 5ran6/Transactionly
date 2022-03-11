import 'package:weight_tracker/imports/imports.dart';

class CustomChip extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onPressed;
  CustomChip({this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: ScreenUtil().setHeight(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.kPrimaryColor,
          borderRadius: BorderRadius.circular(
            ScreenUtil().radius(15),
          ),
        ),
        child: Center(
          child: Text(title!,
              style: Theme.of(context).textTheme.button?.copyWith(fontSize:ScreenUtil().setSp(12), fontWeight:FontWeight.normal),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
