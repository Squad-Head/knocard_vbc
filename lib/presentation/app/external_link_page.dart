import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';
import 'package:knocard_ui/presentation/widget/header_title_bottom_external.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

class ExternalLinkPage extends HookConsumerWidget {
  final UserProfile profile;
  const ExternalLinkPage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      WebView.platform = WebWebViewPlatform();
      return null;
    }, []);
    return Scaffold(
      appBar: const HeaderBottomExternal(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: profile.external_pages!.link,
      ),
    );
  }
}
