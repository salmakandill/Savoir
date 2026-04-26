import 'package:flutter/material.dart';
import 'package:savoir/app_colors.dart';
import 'package:savoir/core/widgets/auth_form_container.dart';
import 'package:savoir/core/widgets/custom_button.dart';
import 'package:savoir/core/widgets/custom_text_form_field.dart';
import 'package:savoir/core/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Savior",
          style: TextStyle(color: AppColors.thirdTextColor),
        ),
      ),
      body: SafeArea(
      child:SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30), 
            Center( 
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.iconsColor.withOpacity(0.15),
                  shape: BoxShape.circle, 
                ), 
                child: Image.asset(
                "savoir/assets/images/Icon.png",
                  height: 60, 
                  width: 60,
                ),
              ),
            ),
          SizedBox(height: 20),
          Text("Welcome back",
         style: TextStyle(
       fontSize: 32,
       fontWeight: FontWeight.w600,
      color: AppColors.frsittextColor,         )),
      SizedBox(height:12 ),
      Text("Continue your literary journey.",
         style: TextStyle(
       fontSize: 18,
       fontWeight: FontWeight.normal,
        color: AppColors.thirdTextColor,)) ,
        SizedBox(height: 12),
   // داخل الـ Column الأساسي في صفحة الـ Login
AuthFormContainer(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Email Address", 
        style: TextStyle(fontWeight: FontWeight.bold)
      ),
      const SizedBox(height: 8),
      const CustomTextFormField(
        hintText: 'reader@example.com',
      ),
      
      const SizedBox(height: 20),
      
      const Text(
        "Password", 
        style: TextStyle(fontWeight: FontWeight.bold)
      ),
      const SizedBox(height: 8),
      const CustomTextFormField(
        hintText: '********',
        isObscureText: true,
        suffixIcon: Icon(Icons.visibility_off_outlined),
      ),
      
      const SizedBox(height: 12), // مسافة بسيطة قبل كلمة نسيت كلمة السر

      // إضافة جزء الـ Forget Password هنا
      Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            // كود الانتقال لصفحة استعادة كلمة المرور
            print("Forgot Password clicked");
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: AppColors.iconsColor, // التأكد من استخدام اللون البني من ملف الألوان
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
      
      const SizedBox(height: 24), // مسافة قبل زرار الدخول
      
    
    ],
  ),
),
    
    
    
    // تحت الـ Forget Password
const SizedBox(height: 10),

CustomButton(
  buttonText: "SIGN IN",
  onPressed: () {
    print("Sign In Pressed!");
    // هنا هتحط الكود اللي بينقلك للصفحة اللي بعدها
  },
),
   const SizedBox(height: 30), // مسافة بعد البوكس الكريمي

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    children: [
      // الخط اللي على الشمال
      const Expanded(
        child: Divider(
          thickness: 1,
          color: Color(0xFFD7CCC8), // لون الخط الفاتح اللي في الفيجما
        ),
      ),
      
      // الكلمة اللي في النص
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "OR CONTINUE WITH",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600], // لون النص رمادي هادي
            letterSpacing: 1.1,
          ),
        ),
      ),
      
      // الخط اللي على اليمين
      const Expanded(
        child: Divider(
          thickness: 1,
          color: Color(0xFFD7CCC8),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 30),
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    children: [
      Expanded(child: 
      SocialButton(
        label: "Google",
        iconPath: "savoir/assets/images/google.png", // تأكد من المسار
        onTap: () {
          print("Google Login");
        },
      )),
      
      const SizedBox(width: 16), // مسافة بين الزرارين
      Expanded(child:
      SocialButton (
        label: "Apple",
        iconPath: "savoir/assets/images/ios.png",
        onTap: () {
          print("Apple Login");
          
        },
      ),
  )],
  ),
),
SizedBox(height: 12,)] // مسافة قبل أزرار Google و Apple ],
  ),
),
        ));
    
    
  }
}