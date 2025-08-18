import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final TextEditingController nameController = TextEditingController();
  int changeColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(context),
            20.kH,
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                primary: false,
                shrinkWrap: true,
                itemCount: faqmodel.length,
                itemBuilder: (context, index) {
                  return PhysicalModel(
                    color: Palette.themecolor,
                    elevation: 2,
                    shadowColor: themewhitecolor,
                    borderRadius: BorderRadius.circular(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          backgroundColor: Palette.themecolor,
                          collapsedBackgroundColor: themewhitecolor,
                          initiallyExpanded: index == 0 ? true : false,
                          collapsedIconColor: themeblackcolor,
                          collapsedTextColor: themeblackcolor,
                          iconColor: themewhitecolor,
                          textColor: themewhitecolor,
                          childrenPadding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            bottom: 15.0,
                          ),
                          title: Text(
                            faqmodel[index].title,
                            textScaleFactor: 1.0,

                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            const Divider(color: themewhitecolor),
                            const SizedBox(height: 15),
                            Text(
                              faqmodel[index].titleDesc,
                              textScaleFactor: 1.0,

                              style: const TextStyle(
                                fontSize: 14,
                                color: themewhitecolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xfe1D8AA2)),
                    color: Color(0xfe1D8AA2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(252, 149, 215, 231),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "FAQ's",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqModel {
  final String title;
  final String titleDesc;

  FaqModel({required this.title, required this.titleDesc});
}

List<FaqModel> faqmodel = [
  FaqModel(
    title: "1. What is this app?",
    titleDesc:
        'HEAL is a trauma-informed mental health and wellbeing app created by Adaptable Therapeutic Support. It offers an AI chatbot trained by a therapist, journalling, practical tools, self-paced mini courses, and resources to support your emotional wellbeing—anytime, anywhere.',
  ),
  FaqModel(
    title: "2. Who is the app for?",
    titleDesc:
        'HEAL is designed for anyone seeking mental health and wellbeing support—especially those navigating trauma, stress, anxiety, or emotional overwhelm. It’s suitable for adults of all backgrounds and is inclusive, compassionate, and self-guided.',
  ),
  FaqModel(
    title: "3. Is my information safe and private?",
    titleDesc:
        'Yes. Your data is securely stored in Australia using encrypted services through Firebase. You can delete your journal entries at any time. You can also contact us at info@adaptablesupport.com to request full data removal. All data is automatically deleted when your subscription ends. Your privacy is our priority.',
  ),
  FaqModel(
    title: "4. Can I talk to someone through the app?",
    titleDesc:
        'HEAL includes a trauma-informed AI chatbot trained by a therapist to offer helpful, supportive guidance. You can also access virtual sessions with a therapist through the app on the ‘Guided Support’ subscription plan, or on an ad hoc basis for an additional fee. For urgent or crisis support, we recommend contacting a local mental health or emergency service.',
  ),
  FaqModel(
    title: "5. Do I have to pay to use the app?",
    titleDesc:
        '''HEAL operates on a tiered subscription model. All features—including access to the AI chatbot, journalling, learning modules, and soothing tools—are part of the paid plans.
We offer a 7-day free trial on the Guided Growth plan so you can explore the app, interact with the chatbot, and see if it’s a good fit for you.''',
  ),
  FaqModel(
    title: "6. What kind of support is available?",
    titleDesc:
        "HEAL offers: An AI chatbot trained in trauma-informed care Journalling and mood tracking Mini courses on topics like grounding, self-esteem, boundaries & more Soothing tools and strategies for difficult moments Access to virtual therapy",
  ),
  FaqModel(
    title: "7. Can I remain anonymous?",
    titleDesc:
        'Yes. You can use most features of HEAL anonymously. We only collect the minimal information needed to create and protect your account (including first name and email address). Your privacy is respected at all times.',
  ),
  FaqModel(
    title: "8. Is this app a substitute for professional medical help?",
    titleDesc:
        "No. While HEAL offers supportive tools and trauma-informed guidance, it is not a substitute for professional medical or psychiatric care. If you're in crisis or need urgent help, please reach out to your local mental health services or emergency support line.",
  ),
];
