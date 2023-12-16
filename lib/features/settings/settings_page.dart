import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:qr_code_wallet/core/extensions/list_widget_extensions.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/features/settings/primary_color.dart';
import 'package:qr_code_wallet/features/settings/state.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  static const path = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: const PrimaryColorSettings(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryColorSettings extends ConsumerWidget {
  const PrimaryColorSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = ref.watch(primaryColorControllerProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: PrimaryColor.values
              .map(
                (pColor) => PrimaryColorButton(
                  primaryColor: pColor,
                  isSelected: primaryColor == pColor,
                  onTap: () => ref.read(primaryColorControllerProvider.notifier).state = pColor,
                ),
              )
              .toList()
              .intersperse(const Gap(8)),
        ),
      ].intersperse(const Gap(8)),
    );
  }
}

class PrimaryColorButton extends StatelessWidget {
  const PrimaryColorButton({
    super.key,
    required this.primaryColor,
    required this.isSelected,
    required this.onTap,
  });

  final PrimaryColor primaryColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: kMinInteractiveDimension,
        height: kMinInteractiveDimension,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: primaryColor.color,
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                size: kMinInteractiveDimension * 0.6,
                color: Colors.white,
              )
            : SizedBox(
                height: kMinInteractiveDimension * 0.6,
                width: kMinInteractiveDimension * 0.6,
              ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Version: 0.0.1',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleMedium,
            children: [
              TextSpan(
                text: 'Made with ',
              ),
              TextSpan(
                text: '❤️',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              TextSpan(
                text: ' in Berlin',
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => showLicensePage(
                context: context,
                applicationName: context.l10n.appTitle,
                applicationLegalese: '© 2023 defuncart',
              ),
              child: Text(
                MaterialLocalizations.of(context).viewLicensesButtonLabel,
              ),
            ),
            TextButton(
              onPressed: () => launchUrl(
                Uri.parse('https://github.com/defuncart/qr_code_wallet'),
                mode: LaunchMode.platformDefault,
              ),
              child: Text(context.l10n.settingsSourceCode),
            ),
          ].intersperse(Gap(8)),
        ),
        _TextWithLink(
          text: '${context.l10n.settingsDataPrivacy1} ${context.l10n.settingsDataPrivacy2}',
          url: 'https://github.com/defuncart/qr_code_wallet/blob/main/privacy_policy.md',
          textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.normal,
              ),
          linkColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}

class _TextWithLink extends StatelessWidget {
  const _TextWithLink({
    required this.text,
    required this.url,
    required this.textStyle,
    required this.linkColor,
  });

  final String text;
  final String url;
  final TextStyle? textStyle;
  final Color? linkColor;

  @override
  Widget build(BuildContext context) {
    final start = text.indexOf('<a>');
    final end = text.indexOf('</a>');
    final components = start != -1 && end != -1 && end > start
        ? [
            TextSpan(
              text: text.substring(0, start),
            ),
            _ClickableTextSpan(
              text: text.substring(start, end).replaceAll('<a>', ''),
              style: TextStyle(
                color: linkColor ?? Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
              url: url,
            ),
            TextSpan(
              text: text.substring(end).replaceAll('</a>', ''),
            ),
          ]
        : [
            TextSpan(text: text),
          ];

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        children: components,
      ),
    );
  }
}

class _ClickableTextSpan extends TextSpan {
  _ClickableTextSpan({
    required String super.text,
    super.style,
    required String url,
  }) : super(
          recognizer: TapGestureRecognizer()..onTap = () async => await _openUrl(url),
        );

  static Future<void> _openUrl(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.platformDefault,
    );
  }
}
