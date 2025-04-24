import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';

class QRGeneratorPage extends ConsumerStatefulWidget {
  static const path = '/generator';

  const QRGeneratorPage({super.key});

  @override
  ConsumerState<QRGeneratorPage> createState() => _QRGeneratorPageState();
}

class _QRGeneratorPageState extends ConsumerState<QRGeneratorPage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  var _type = QRCodeType.text;
  var _canSubmit = false;

  @override
  void initState() {
    super.initState();

    _controller =
        TextEditingController()..addListener(() {
          final canSubmit = _controller.text.trim().isNotEmpty;
          if (_canSubmit != canSubmit) {
            setState(() => _canSubmit = canSubmit);
          }
        });
    _focusNode = FocusNode()..requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.generatorTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            SegmentedButton<QRCodeType>(
              style: SegmentedButton.styleFrom(selectedBackgroundColor: Theme.of(context).colorScheme.primary),
              segments: [
                for (final type in [QRCodeType.text, QRCodeType.url])
                  ButtonSegment(value: type, label: Text(type.name)),
              ],
              multiSelectionEnabled: false,
              selected: {_type},
              showSelectedIcon: false,
              onSelectionChanged: (types) {
                if (types.isNotEmpty) {
                  setState(() => _type = types.first);
                }
              },
            ),
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: switch (_type) {
                  QRCodeType.text => context.l10n.generatorHintText,
                  QRCodeType.url => context.l10n.generatorHintUrl,
                  _ => null,
                },
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed:
                  _canSubmit
                      ? () {
                        _focusNode.unfocus();

                        final data = _controller.text.trim();

                        final id = ref
                            .read(codesDbProvider)
                            .addEntry(
                              type: _type,
                              data: data,
                              label: data,
                              email: null,
                              phone: null,
                              sms: null,
                              wifi: null,
                            );

                        context.replace('/details/$id');
                      }
                      : null,
              child: Text(context.l10n.generatorButton),
            ),
          ],
        ),
      ),
    );
  }
}
