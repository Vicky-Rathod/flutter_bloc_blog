import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_blog/core/widgets/custom_button.dart';
import 'package:flutter_bloc_blog/core/widgets/custom_textfield.dart';
import 'package:flutter_bloc_blog/features/auth/presentation/bloc/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/home_screen.dart';

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.9);

    // Create the wave shape using a quadratic Bezier curve
    // path.quadraticBezierTo(
    //   size.width * 0.25, // Control point X
    //   size.height * 0.9, // Control point Y
    //   size.width * 0.5, // End point X
    //   size.height * 0.8, // End point Y
    // );

    path.quadraticBezierTo(
      size.width * 0.5, // Control point X
      size.height * 0.75, // Control point Y
      size.width, // End point X
      size.height * 0.4, // End point Y
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive dimensions for the text field container
    final containerWidth = screenWidth * 0.9;
    final containerHeight = screenHeight * 0.07;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        if (state is LoginFailureState) {
          print('LoginFailureState');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.failure.message),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: DiagonalClipper(),
              child: Container(
                color: const Color(0xffe9e8ef),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlutterLogo(
                                size: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Welcome!,",
                                style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Sign in to Continue',
                                style: TextStyle(color: Color(0xff4c4b53), fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Email Text Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        hintText: 'Email',
                        fieldType: FieldType.email,
                        controller: emailController,
                        height: containerHeight,
                        width: containerWidth,
                        onChanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password Text Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        hintText: 'Password',
                        fieldType: FieldType.password,
                        controller: passwordController,
                        height: containerHeight,
                        width: containerWidth,
                        onChanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ),

                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: CustomButton(
                            text: 'Sign In',
                            disabled: emailController.text.isEmpty || passwordController.text.isEmpty,
                            onPressed: () {
                              context.read<AuthBloc>().add(LoginRequested(email: emailController.text, password: passwordController.text));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
