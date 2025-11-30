import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messaging_app/utils/color.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

late WebViewController _webViewController ;

String urlToLoad = "http://192.168.1.118:4200/";
bool loadError = false;
@override
  void initState() {
    // TODO: implement initState
  _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {
          setState(() {
            loadError = true;
          });
          print(("Error loading url ${error.description}"));
        },
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    )
    ..loadRequest(Uri.parse(urlToLoad));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: scaffoldBgColor,
        body:loadError
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 50, color: Colors.red),
              SizedBox(height: 16),
              Text(
                "Failed to load the URL",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    loadError = false;
                  });
                  _webViewController.loadRequest(Uri.parse(urlToLoad));
                },
                child: Text("Retry"),
              )
            ],
          ),
        )
            : WebViewWidget(controller: _webViewController),

      ),
    );
  }
}
