import 'package:carbon_fora/theme/colors.dart';
import 'package:flutter/material.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Terms & Condition",
                    style: TextStyle(
                      color: themewhitecolor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '''Terms and Conditions for Carbonfora Apps
Effective date: 29 August 2025
These Terms and Conditions ("Terms") govern your access to and use of Carbonfora mobile applications ("App" or "Apps"). By downloading, installing or using the Apps, you agree to be bound by these Terms. If you do not agree, do not use the Apps.

1. Definitions and Acceptance
"Carbonfora" ("we", "our", "us") refers to the owner and operator of the Apps.
"User" ("you") means the individual who downloads, installs or uses the Apps.
The "Service" means all functionality provided by the Apps, including GPS stamping, timestamped photos, data storage, analytics and any associated websites or services.
By using the Apps, you affirm that you are at least 13 years old (or the minimum age required in your jurisdiction) and capable of entering into a binding agreement. If you access the Apps on behalf of a company or other legal entity, you represent that you have authority to bind that entity to these Terms.

2. Licence to Use
Subject to these Terms, Carbonfora grants you a nonexclusive, nontransferable, revocable licence to download, install and use the Apps on your personal devices solely for your own noncommercial use. You agree not to:
Copy, reproduce, distribute or modify any part of the Apps except as permitted by law.
Reverse engineer, decompile or attempt to extract the source code of the Apps.
Rent, lease, sell, sublicense or transfer the Apps to any third party.
Circumvent or disable any security or technological features of the Apps.
All rights not expressly granted to you are reserved by Carbonfora and its licensors.

3. User Accounts and Responsibilities
Registration. To access certain features, you must create an account. You agree to provide accurate, current and complete information and keep it updated. You are responsible for maintaining the confidentiality of your login credentials and all activities under your account.
Prohibited behaviours. You agree not to use the Apps to:
Violate any applicable law or regulation;
Impersonate another person or entity or misrepresent your affiliation;
Upload or transmit harmful code, malware or other disruptive materials;
Harass, abuse or harm other users;
Infringe or violate intellectual property or privacy rights;
Collect data from other users without their consent;
Interfere with or disrupt the integrity or performance of the Apps.
Usergenerated content. You retain ownership of photos, text or other content you upload ("User Content"). By uploading User Content, you grant Carbonfora a worldwide, royaltyfree, sublicensable licence to host, store, reproduce and display the content solely for operating and improving the Services. You are responsible for ensuring that your User Content does not violate any rights of third parties and that you have all necessary permissions.

4. Location and Camera Permissions
Some features rely on access to your device’s location services and camera. When you first use those features, the Apps will request permission. You may choose not to grant permission; however, certain functionality (e.g., GPS stamping or timestamped photos) will be unavailable without it. You can change permissions at any time through your device settings. For information on how we collect and use location and camera data, please read our Privacy Policy.

5. Payments
The basic Carbonfora Apps are free to use. Certain premium features or additional storage may require payment of subscription fees or onetime charges. All fees will be disclosed within the Apps before purchase. Payments are processed through thirdparty app stores (Google Play or Apple App Store) using your account on those platforms. Taxes may apply. Purchases are subject to the store’s payment terms and conditions. We do not process or store payment card information ourselves.

6. Intellectual Property
The Apps and all content (including text, graphics, logos, software and trademarks) are owned by Carbonfora or our licensors and are protected by copyright and other intellectual property laws. You may not use our trademarks without prior written consent. All thirdparty trademarks appearing in the Apps belong to their respective owners. Using the Apps does not grant you ownership or licence of any intellectual property rights except the limited licence described in Section 2.

7. Termination and Suspension
We may suspend or terminate your access to the Apps, without notice, if you violate these Terms, misuse the Services or create risk or legal exposure for us or other users. Upon termination, your right to use the Apps will cease immediately. We may retain or delete your data in accordance with our Privacy Policy. You may delete your account at any time from within the Apps; deletion will remove your personal data, subject to the retention obligations described in the Privacy Policy.

8. Disclaimer of Warranties
The Apps and Services are provided "as is" and "as available" without warranties of any kind. To the maximum extent permitted by law, Carbonfora disclaims all implied warranties, including merchantability, fitness for a particular purpose and noninfringement. We do not guarantee that the Services will be uninterrupted, secure or errorfree or that any data will be accurate or complete. Your use of the Apps is at your own risk.

9. Limitation of Liability
To the fullest extent permitted by law, Carbonfora and its directors, employees and agents will not be liable for any indirect, incidental, consequential or punitive damages, or any loss of profits or revenue, arising from your use of the Apps. In no event will our total liability exceed the amount you paid (if any) for using premium features during the twelve months preceding the claim. Nothing in these Terms excludes liability for death or personal injury caused by negligence or fraud.

10. Indemnification
You agree to indemnify and hold harmless Carbonfora, its affiliates, officers and employees from any claims, damages, losses, liabilities and expenses (including legal fees) arising out of or related to your misuse of the Apps, your violation of these Terms or your violation of any rights of a third party.

11. Changes to the Apps and Terms
We may modify or discontinue the Apps (or any part of them) at any time without liability. We may also amend these Terms. When we make material changes, we will notify you by updating the effective date at the top of this document and, if the change affects your rights, by providing an inapp notification or email. Your continued use of the Apps after changes take effect constitutes acceptance of the amended Terms.

12. Governing Law and Dispute Resolution
These Terms are governed by the laws of Pakistan without regard to its conflict of law principles, and you consent to exclusive jurisdiction and venue in the courts of Lahore, Pakistan. If you are a consumer residing in the European Union or another jurisdiction with mandatory consumer laws, you also benefit from any mandatory provisions of your local law. Any disputes will first be attempted to be resolved amicably; if unresolved, they will be submitted to the competent courts.

13. General Provisions
Severability. If any provision of these Terms is deemed invalid or unenforceable, that provision will be limited or eliminated to the minimum extent necessary and the remaining provisions will remain in full force.
No waiver. A failure to enforce any right or provision of these Terms will not constitute a waiver of future enforcement.
Assignment. You may not assign these Terms without our prior written consent. We may assign our rights and obligations to any affiliate or successor.
Entire agreement. These Terms, together with the Privacy Policy, constitute the entire agreement between you and Carbonfora regarding the Apps and supersede any prior agreements.
If you have questions about these Terms, please contact us at info@carbonfora.com
''',
                    style: TextStyle(fontSize: 17, color: themewhitecolor),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
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
                "Terms & Condition",
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
