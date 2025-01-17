import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MiniAppView extends HookWidget {
  const MiniAppView({super.key, required this.url, required this.name});

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    final isRootPath = useState(true);
    final isLoading = useState(true);

    final controller = useMemoized(() => 
      WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageFinished: (_) {
              isLoading.value = false;
            },
            onUrlChange: (urlChange) {
              if (urlChange.url! == url) {
                isRootPath.value = true;
              } else {
                isRootPath.value = false;
              }
            }
          ),
        )
        ..loadRequest(Uri.parse(url))
      );

    return Scaffold(
      appBar: ViewAppBar(
        leading: IconButton(
          icon: Icon(isRootPath.value ? HugeIcons.strokeRoundedCancel01 : HugeIcons.strokeRoundedArrowLeft01),
          onPressed: () async {
            final canGoBack = await controller.canGoBack();
            if (isRootPath.value && canGoBack) {
              controller.goBack();
            } else {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
        ),
        title: name,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            Visibility(
              visible: isLoading.value,
              child: _loading(),
            )
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Skeletonizer(
            child: Skeleton.shade(
              child: Icon(
                Icons.grid_view_rounded,  
                size: 96,
              ),
            ),
        )
      ),
    );
  }
}
