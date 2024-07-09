import 'package:flutter/material.dart';
import 'package:whats_pie/common/enum.dart';
import 'package:whats_pie/common/regexp/regexp.dart';

class RegexMenu extends StatelessWidget {
  final platformFocusNode = FocusNode();
  final localeFocusNode = FocusNode();

  final ValueNotifier<WhatsAppRegex> whatsAppRegexNotifi;

  RegexMenu({super.key, required this.whatsAppRegexNotifi});

  @override
  Widget build(BuildContext context) {
    const selectedTextStyle =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
    const defaultTextStyle = TextStyle(color: Colors.black26);
    return ValueListenableBuilder<WhatsAppRegex>(
      valueListenable: whatsAppRegexNotifi,
      builder: (context, regex, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropdownButton<WhatsAppPlatform>(
              focusNode: platformFocusNode,
              value: whatsAppRegexNotifi.value.platform,
              items: WhatsAppRegex.supportPlatforms.keys.toList().map((key) {
                final isSelected = regex.platform == key;
                final value = WhatsAppRegex.getPlatformName(key);
                return DropdownMenuItem<WhatsAppPlatform>(
                  value: key,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected ? selectedTextStyle : defaultTextStyle,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (platform) {
                whatsAppRegexNotifi.value =
                    whatsAppRegexNotifi.value.copyWith(platform: platform!);
                platformFocusNode.unfocus();
              },
            ),
            const SizedBox(width: 12.0),
            DropdownButton<MobileLocale>(
              focusNode: localeFocusNode,
              value: whatsAppRegexNotifi.value.locale,
              items: WhatsAppRegex.supportLocales.keys.toList().map((key) {
                final isSelected = regex.locale == key;
                final value = WhatsAppRegex.getLocaleName(key);
                return DropdownMenuItem<MobileLocale>(
                  value: key,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected ? selectedTextStyle : defaultTextStyle,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (locale) {
                whatsAppRegexNotifi.value =
                    whatsAppRegexNotifi.value.copyWith(locale: locale!);
                localeFocusNode.unfocus();
              },
            ),
            const SizedBox(width: 24.0),
          ],
        );
      },
    );
  }
}
