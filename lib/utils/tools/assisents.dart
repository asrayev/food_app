import 'file_importer.dart';

double height(context)=>MediaQuery.of(context).size.height;
double width(context)=>MediaQuery.of(context).size.width;



void showSnackbar({required BuildContext context,required String message}) {
  final snackBar = SnackBar(
    content: Center(child: Text(message, style: AppTextStyles.sfProDisplay(context,),)),
    backgroundColor: Colors.white,
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}