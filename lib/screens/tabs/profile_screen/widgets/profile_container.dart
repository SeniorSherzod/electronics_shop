import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String phoneNumber;
  final String email;
  final String editButtonText;
  final Function() onEditPressed;
  final Function() onLanguageCurrencyPressed;
  final Function() onFeedbackPressed;
  final Function() onReferFriendPressed;
  final Function() onTermsPressed;
  final Function() onLogoutPressed;

  const ProfileContainer({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.editButtonText,
    required this.onEditPressed,
    required this.onLanguageCurrencyPressed,
    required this.onFeedbackPressed,
    required this.onReferFriendPressed,
    required this.onTermsPressed,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Stretch the container to full width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // Bottom shadow
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    profileImageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onEditPressed,
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(phoneNumber),
            const SizedBox(height: 5),
            Text(email),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: onLanguageCurrencyPressed,
                  child: const Text('Language & Currency'),
                ),
                TextButton(
                  onPressed: onFeedbackPressed,
                  child: const Text('Feedback'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: onReferFriendPressed,
                  child: const Text('Refer a Friend'),
                ),
                TextButton(
                  onPressed: onTermsPressed,
                  child: const Text('Terms & Conditions'),
                ),
              ],
            ),
            TextButton(
              onPressed: onLogoutPressed,
              child: Text(editButtonText),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
