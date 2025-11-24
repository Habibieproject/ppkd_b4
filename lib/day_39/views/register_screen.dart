import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_b4/day_15/drawer.dart';
import 'package:ppkd_b4/day_39/models/user_firebase_model.dart';
import 'package:ppkd_b4/day_39/service/firebase.dart';
import 'package:ppkd_b4/extension/navigation.dart';
import 'package:ppkd_b4/preferences/preference_handler.dart';
import 'package:ppkd_b4/widgets/login_button.dart';

class RegisterScreenDay39 extends StatefulWidget {
  const RegisterScreenDay39({super.key});
  static const id = "/register_day39";

  @override
  State<RegisterScreenDay39> createState() => _RegisterScreenDay39State();
}

class _RegisterScreenDay39State extends State<RegisterScreenDay39> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isVisibility = false;
  bool isLoading = false;
  bool isLoadingDropdown = false;

  UserFirebaseModel user = UserFirebaseModel();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hello, Welcome",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  height(12),

                  const Text("Register to access your account"),
                  height(24),
                  // ================= FOTO PROFILE DI PALING ATAS =================

                  // --- Name ---
                  buildTitle("Name"),
                  height(12),
                  buildTextField(
                    hintText: "Enter your name",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  height(16),

                  // --- Email ---
                  buildTitle("Email Address"),
                  height(12),
                  buildTextField(
                    hintText: "Enter your email",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains('@')) {
                        return "Email tidak valid";
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                      ).hasMatch(value)) {
                        return "Format Email tidak valid";
                      }
                      return null;
                    },
                  ),

                  height(16),

                  // --- Password ---
                  buildTitle("Password"),
                  height(12),
                  buildTextField(
                    hintText: "Enter your password",
                    isPassword: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password tidak boleh kosong";
                      } else if (value.length < 6) {
                        return "Password minimal 6 karakter";
                      }
                      return null;
                    },
                  ),

                  height(24),

                  // --- Button Register ---
                  LoginButton(
                    text: "Register",
                    isLoading: isLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          final result = await FirebaseService.registerUser(
                            email: emailController.text.trim(),
                            username: nameController.text.trim(),
                            password: passwordController.text,
                          );

                          setState(() {
                            isLoading = false;
                            user = result;
                          });

                          // contoh: simpan token kalau ada
                          if (user.uid != null) {
                            await PreferenceHandler.saveToken(user.uid!);
                          }

                          context.pushReplacement(DrawerWidgetDay15());
                        } catch (e) {
                          Fluttertoast.showToast(msg: e.toString());
                          setState(() {
                            isLoading = false;
                          });
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Validation Error"),
                              content: const Text("Please fill all fields"),
                              actions: [
                                TextButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: const Text("Ga OK"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),

                  height(16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          // TODO: ke halaman login / apapun
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: Colors.black, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
          width: 1.0,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            // color: AppColor.gray88,
          ),
        ),
      ],
    );
  }
}
