import 'package:weight_tracker/imports/imports.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onPressed;
  CustomButton({this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: ScreenUtil().setHeight(50),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.kPrimaryColor,
          borderRadius: BorderRadius.circular(
            ScreenUtil().radius(30),
          ),
        ),
        child: Center(
          child: Text(title!,
              style: Theme.of(context).textTheme.button,
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
