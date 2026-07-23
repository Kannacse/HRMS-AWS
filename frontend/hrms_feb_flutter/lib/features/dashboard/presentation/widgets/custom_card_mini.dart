import 'package:flutter/material.dart';


class CustomCardMini extends StatelessWidget {
  final Widget? topWidget;
  final String? bottomText;

  const CustomCardMini({
    super.key,
    this.topWidget,
    this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (topWidget != null)
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: topWidget!,
                    ),
                  ),
                ),

              const SizedBox(height: 6),

              Text(
                bottomText ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

