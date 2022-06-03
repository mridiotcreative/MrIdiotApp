import 'package:better_video_player/better_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomControls extends BetterVideoPlayerControls {
  final bool isFullScreen;

  const CustomControls({Key? key, required this.isFullScreen}) : super(key: key, isFullScreen: isFullScreen);

  @override
  State<StatefulWidget> createState() {
    return _CustomControlsState();
  }
}

class _CustomControlsState extends BetterVideoPlayerControlsState {
  /// 暂停播放按钮
  Widget buildPlayPause(Function() onTap) {
    final controller = context.watch<BetterVideoPlayerController>();
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      onPressed: onTap,
      child: controller.value.videoPlayerController?.value?.isPlaying ?? false
          ? Icon(Icons.pause,size: 26,)
          : Icon(Icons.play_arrow,size: 26,)
    );
  }

  /// 全屏按钮
  Widget buildExpand(Function() onTap) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      onPressed: onTap,
      child: widget.isFullScreen
          ? Icon(Icons.fullscreen_exit,size: 26,)
          :Icon(Icons.fullscreen,size: 26,)
    );
  }

  /// 重播按钮
  Widget buildReplay(VoidCallback onTap) {
    return Container(
      color: Colors.black38,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100)

                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child:Icon(Icons.replay,size: 26,color: Colors.white,),// Image.asset("images/replay.png", width: 26, height: 26),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 屏幕中间的暂停按钮
  Widget buildCenterPause(VoidCallback onTap) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Icon(Icons.play_arrow,size: 26,)//Image.asset("images/play.png", width: 26, height: 26),
          ),
        ),
      ),
    );
  }

  /// Wifi中断
  Widget buildWifiInterrupted(VoidCallback onTap) {
    return Container(
      color: Colors.black38,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 32,
                onPressed: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFF671F),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    child: Text(
                      "Error",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 发生错误
  Widget buildError(Function() onTap) {
    return Container(
      color: Colors.black38,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 32,
                onPressed: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.black,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    child: Text(
                      "Error in Video uploading",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopBar(Function() onTap) {
    if (widget.isFullScreen)
      return Align(
        alignment: Alignment.topLeft,
        child: CupertinoButton(
          onPressed: onTap,
          child: Container(
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      );
    else
      return SizedBox();
  }
}