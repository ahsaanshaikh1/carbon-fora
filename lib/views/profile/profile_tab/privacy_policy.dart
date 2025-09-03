import 'package:carbon_fora/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                    "Privacy Policy",
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
                  child: Text('''Privacy Policy for Carbonfora Apps
Last updated: 29 August 2025

1. Introduction
Carbonfora ("we", "us", "our") provides mobile applications designed to help users record carbonrelated activities. Our apps may capture GPS location data to create location stamps and may allow users to take timestamped photos for recordkeeping. This Privacy Policy describes what personal data we collect, how we use it, how long we keep it, with whom we share it and the rights you have regarding your data. The policy applies to all Carbonfora applications available through the Google Play Store and the Apple App Store.
Contact details of the data controller:
Controller: Carbonfora (Pakistan)
Address: 8, Canal Burg, Dullah Bagh, off Canal View, Lahore, Pakistan
Email: info@carbonfora.com
Phone: +92 321 850 2900
If you have any questions or requests about this policy or your data, please contact us using the above details. Users in the European Union may also contact our Data Protection Officer via the above email address. Our EU representative’s contact details will be provided upon request, as required by Article 27 GDPR.

2. Data We Collect
We collect and process personal data only as necessary to provide our services and in accordance with the data minimisation principle. Depending on how you interact with the app, we may collect the following categories of data:
Category	Examples and Purpose	Legal basis
Account information	When you create an account, we collect your name, email address, phone number, password and optionally profile photo. We use this to create and manage your account, authenticate you and communicate with you.	Contractual necessity: to provide account services; Legitimate interest: account security and management.
Location data (GPS, networkbased and IPaddress derived)	We collect precise location data only when you enable location permissions. The app uses GPS coordinates to generate location stamps for activities, associate them with photos and calculate carbon metrics. Location is collected only during the activity and not continuously unless you explicitly allow background tracking. You can revoke location access at any time via your device settings.	Consent: explicit optin for location access; 
Contractual necessity: if location stamping is essential to the core function.
Photos and media	When you take a picture through the app, we access your device camera to capture the photo and time stamp. The photo may contain metadata (e.g., location, device information). We store the image on your device and, if you choose to sync or back up your data, on our secure servers. You can delete photos within the app at any time.	Consent: explicit permission for camera and media access; Legitimate interest: to provide photo record functionality.
Device and usage data	We automatically collect technical information such as device model, operating system version, app version, IP address, unique device identifiers, language and time zone. We also collect usage logs (e.g., feature usage, crash reports, timestamps) to improve app performance and user experience.	Legitimate interest: to maintain and improve services; Consent: where required by local law.
Analytics data	With your consent, we may use inapp analytics to understand how users interact with the app, which screens are visited, and how features are used. This helps us improve functionality and user experience. Analytics data is aggregated and does not identify individual users.	Consent
Communications	If you contact us by email or through support channels, we collect the content of your message and contact details to respond to your query.	Legitimate interest
We do not knowingly collect personal data from children under 13 years old. If we learn that a child’s data has been collected without appropriate parental consent, we will delete it immediately and disable the associated account.

3. How We Collect Data
We collect personal data in the following ways:
You provide it directly. You give us personal information when you create an account, update your profile, upload photos, enable location access or contact us. We request location and camera permissions via runtime prompts, and we do not collect data until you have granted permission.
Automatically through your device. When you use our app, we automatically collect device and usage data (e.g., IP address, device model, events). If you enable location, your device sends GPS coordinates; if you enable notifications, we collect token information. We use secure connections (HTTPS) to transmit data.
From thirdparty services. If you sign in using a thirdparty authentication provider (e.g., Google or Apple), we receive basic account information from those services subject to their privacy policies. We may also use thirdparty analytics or cloud storage providers; they act as data processors under our instructions. 

4. How We Use Your Data
We process personal data only for the purposes described in this policy and rely on lawful bases specified by GDPR.
Providing and improving services – We use your account information, location data and photos to operate core features such as creating carbon records, GPS stamps and timestamped images. Device and usage data help us monitor app performance, fix bugs and improve user experience.
Personalisation – With your consent, we may use analytics and location data to personalise content or suggest carbonsaving actions relevant to your location. We may also use your location to display local environmental initiatives.
Communications – We use your email to send service messages (e.g., account confirmations, security alerts, updates) and to reply to support requests. We may also send newsletters or promotional messages if you opt in; you can opt out at any time.
Legal compliance and security – We process data to comply with legal obligations (e.g., tax laws, requests from authorities) and to detect, investigate and prevent fraud or abuse. We monitor usage to enforce our Terms and Conditions and protect the rights of Carbonfora and other users.
Research and statistics – We may generate anonymised statistics to understand environmental patterns or app usage. Data used for research is aggregated and cannot reasonably identify you.
We will not use your personal data for purposes that are incompatible with the reasons stated above without notifying you and obtaining your consent where required by law.

5. Sharing and Disclosure
We do not sell your personal data. We may share data in the following circumstances:
Service providers. We engage trusted thirdparty service providers to host data, process payments (if applicable), deliver notifications, provide analytics and support customer service. These providers act as data processors on our behalf and are contractually required to process personal data only according to our instructions and implement appropriate security measures.
Business transfers. If Carbonfora is involved in a merger, acquisition, reorganisation or sale of assets, your personal data may be transferred as part of the transaction. We will notify you and continue to ensure equivalent privacy protection.
Legal and regulatory purposes. We may disclose your information if required by law or in response to valid legal requests (e.g., court orders, government inquiries) or to enforce our legal rights, investigate abuse, protect user safety or detect fraud.
With your consent. We may share your information for other purposes if you have provided explicit consent.
If we transfer personal data outside the European Economic Area, we ensure appropriate safeguards are in place, such as standard contractual clauses approved by the European Commission, to guarantee an adequate level of protection for your data.

6. Data Retention
We retain personal data only for as long as necessary to fulfil the purposes described in this policy, unless a longer retention period is required or permitted by law. In particular:
Account data – retained for as long as you maintain an account. If you delete your account or request deletion, we will erase your personal data within 30 days, except where retention is required for legal or regulatory reasons (e.g., tax records).
Location data and photos – stored on your device and (if you opt to sync) on our servers. You can delete individual location records or photos at any time in the app. We automatically purge serverstored location and photo data 12 months after collection unless you choose to store it longer.
Usage data and logs – retained for up to 24 months for analytics and troubleshooting and then anonymised or deleted.
We may keep anonymised or aggregated data indefinitely because it does not identify individuals.

7. Data Security
We implement technical and organisational measures to protect personal data against unauthorised access, loss, destruction or alteration. These measures include:
Encryption of data in transit (TLS/HTTPS) and at rest (where stored on servers).
Access controls and authentication to limit data access to authorised personnel.
Periodic security assessments and penetration testing.
Secure coding practices and regular software updates.
Incident response procedures and breach notification plans. In the event of a personal data breach, we will notify relevant authorities and affected users within 72 hours.

8. Your Rights
If you are located in the European Union or other jurisdictions with similar laws, you have the following rights:
Right of access – You can request a copy of the personal data we hold about you.
Right to rectification – You can request correction of inaccurate or incomplete data.
Right to erasure – You can request deletion of your personal data under certain circumstances (e.g., when data is no longer necessary or if you withdraw consent). This includes the right to delete your account within the app.
Right to restrict processing – You can request that we limit processing of your data in certain situations.
Right to data portability – You can request to receive the data you provided to us in a structured, machinereadable format and have it transmitted to another controller.
Right to object – You can object to processing based on legitimate interests or direct marketing; we will stop processing unless we demonstrate compelling legitimate grounds.
Right to withdraw consent – If processing is based on consent, you can withdraw it at any time without affecting the lawfulness of processing before withdrawal.
Right to lodge a complaint – You may lodge a complaint with your local data protection authority.
To exercise any of these rights, please contact us at the details provided in Section 1. We will respond to requests within one month and may require verification of your identity.

9. Children’s Privacy
Our apps are not directed at children under 13 years of age. We do not knowingly collect or solicit personal data from children. If you are a parent or guardian and believe that your child has provided us with personal data without consent, please contact us so that we can delete the data and take appropriate measures.

10. Cookies and Similar Technologies
The Carbonfora apps may use local storage and device identifiers to remember user preferences and login status. If we integrate thirdparty analytics or advertising SDKs that use cookies or tracking technologies, we will provide a separate notice explaining those technologies and seek your consent where required by law.

11. Changes to This Privacy Policy
We may update this Privacy Policy from time to time to reflect changes in legal requirements, our data practices or app features. When we make material changes, we will notify you through the app or by email and update the "Last updated" date at the top of this document. We encourage you to review the policy periodically.

12. Contact
If you have questions, concerns or requests regarding this Privacy Policy, please contact us at:
Email: info@carbonfora.com
Postal Address: 8, Canal Burg, Dullah Bagh, off Canal View, Lahore, Pakistan
DPO: Data Protection Officer, info@carbonfora.com
''', style: TextStyle(fontSize: 17, color: themewhitecolor)),
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
                "Privacy Policy",
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
