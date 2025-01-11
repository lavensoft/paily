import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/inline_button.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: ViewAppBar(
        title: 'Store',
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppPaddingTheme.viewPadding.copyWith(
            top: 0,
            bottom: 0,
          ),
          child: FilledButton(
            onPressed: () {}, 
            child: Text('Navigate')
          ),
        ),
      ),
      body: Padding(
        padding: AppPaddingTheme.viewPadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:  CachedNetworkImage(
                imageUrl: 'https://s3-alpha-sig.figma.com/img/074f/e2f2/101281732e707d4ca27b99c12001f134?Expires=1737331200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OlfVyLRWiGhEZ7l7Yw0QFfa6-nLg82t84tpqi2kVUJ9va82wGJXRbkPppDGmcmPm75rO1WojAwSW9i99oe0tlwE8fHxIRatI9WCEqcsZOOqc~m3~fjDu~vhLnxAuUZCMRJDzj1sPZ0Xa5KzLxcFniKfTZJzUrL~kbThExj6rS1xDbATDsKUSH14I9H~MHQhl8obneSQ6tr2CaOWmxVD2MWwslLkDX7eXkHP1pQB9TgD68IWOk-QE~JAo8E8d0L3YjgjONxypFQiaPWIZC3zofgIeVk5sNalSHmwaAA-1r9s0cGnotdJE6QbC0p0ACXjpSoMt0g68zL7w2nxaN~iUiw__',
                height: 390,
                fit: BoxFit.cover,
              ),
            ),
        
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 21),
                child: Column(
                  spacing: 3,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Place',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      'Description',
                      style: theme.textTheme.bodyMedium!.copyWith(  
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 21),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: InlineButton(
                        onPressed: () {}, 
                        label: Text('Open Mini-app'),
                        icon: Icon(Icons.open_in_new),
                      )
                    ),
                    Expanded(
                      child: InlineButton(
                        onPressed: () {}, 
                        label: Text('Open Mini-app'),
                        icon: Icon(Icons.open_in_new),
                      )
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

}