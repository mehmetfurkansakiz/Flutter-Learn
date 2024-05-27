import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems._durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;

  void changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      body: Center(
        child: Column(
          children: [
            Text('PlaceHolder:', style: context.textTheme().bodyLarge),
            ElevatedButton(
                onPressed: () {
                  changeVisible();
                  controller.animateTo(_isVisible ? 1 : 0);
                },
                child: Text('See Placeholder')),
            // _isVisible ? Placeholder() : SizedBox(),
            _placeHolderWidget(),
            ListTile(
              title: AnimatedOpacity(
                  duration: _DurationItems._durationLow, opacity: _isOpacity ? 1 : 0, child: Text('Opacity')),
              trailing: IconButton(
                  onPressed: () {
                    changeOpacity();
                  },
                  icon: Icon(Icons.remove_circle_outline)),
            ),

            AnimatedDefaultTextStyle(
              child: Text('Animated Default Text Style'),
              style: (_isVisible ? context.textTheme().labelLarge : context.textTheme().displaySmall) ?? TextStyle(),
              duration: _DurationItems._durationLow,
            ),

            AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: controller,
            ),

            AnimatedContainer(
              duration: _DurationItems._durationLow,
              height: _isVisible ? kZero : MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              color: Colors.blue,
              margin: EdgeInsets.all(10),
            ),

            const Expanded(
                child: Stack(
              children: [
                AnimatedPositioned(
                  top: 70,
                  curve: Curves.ease,
                  child: Text('data'),
                  duration: _DurationItems._durationLow,
                )
              ],
            )),

            Expanded(
              child: AnimatedList(
                itemBuilder: (context, index, animation) {
                  return const Text('Data');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: Placeholder(),
      secondChild: SizedBox.shrink(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems._durationLow,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const _durationLow = Duration(seconds: 1);
}
