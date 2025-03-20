import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itbeesolutionstest/screens/welcome/bloc/welcome_bloc.dart';
import 'package:itbeesolutionstest/utils/image_constant.dart';
import 'package:itbeesolutionstest/utils/size_utils.dart';
import 'package:itbeesolutionstest/widgets/custome_image.dart';

import '../../utils/color_constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final WelcomeBloc _bloc = WelcomeBloc();
  @override
  void initState() {
    _bloc.add(GetInitEvent());
    super.initState();
  }
  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WelcomeBloc, WelcomeState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          alignment: Alignment.center,
          color: ColorConstant.welcomeBack,
          child: CustomImageView(
            width: getSize(250),
            height: getSize(250),
            imagePath: ImageConstant.imgWelcome,
          ),
        ),
      );
    },);
  }
}
