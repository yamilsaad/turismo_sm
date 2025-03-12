import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoViewMobile extends StatefulWidget {
  const VideoViewMobile({super.key});

  @override
  State<VideoViewMobile> createState() => _VideoViewMobileState();
}

class _VideoViewMobileState extends State<VideoViewMobile>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isVisible = false; // Variable para controlar la animación
  late VideoPlayerController _controller;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      _controller = VideoPlayerController.asset('assets/videos/Vinas2.mp4')
        ..initialize().then((_) {
          setState(() {
            _isLoading = false;
          });
          _controller.setLooping(true);
          _controller.setVolume(
              0); // Silenciar el video para permitir reproducción automática
          _playVideo(); // Intentar reproducir automáticamente
        });
      _controller.addListener(_videoListener);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error loading video: $e';
      });
    }
  }

  void _videoListener() {
    if (_controller.value.hasError) {
      setState(() {
        _errorMessage = 'Video error: ${_controller.value.errorDescription}';
      });
    }
  }

  void _playVideo() {
    try {
      _controller.play();
    } catch (e) {
      setState(() {
        _errorMessage = 'Error attempting to play video: $e';
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _screenWidth,
      height: _screenHeight * 0.5,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: VideoFondoWidget(
                screenHeight: _screenHeight,
                screenWidth: _screenWidth,
                isLoading: _isLoading,
                errorMessage: _errorMessage,
                controller: _controller),
          ),
          Container(
            width: _screenWidth,
            height: _screenHeight * 0.5,
            color: Colors.black.withOpacity(0.5), // Ajusta el color y opacidad
          ),
          VisibilityDetector(
            key: Key('video-view-mobile'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.2 && !_isVisible) {
                setState(() {
                  _isVisible = true;
                  _animationController
                      .forward(); // Inicia la animación solo si es visible
                });
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _screenHeight * 0.05,
                    ),
                    SizedBox(
                      height: _screenHeight * 0.4,
                      width: _screenWidth * 0.75,
                      child: _isVisible
                          ? FadeIn(
                              duration: Duration(milliseconds: 1500),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Text(
                                    'A tan solo 16 Kilómetros de la ciudad de San Juan, San Martín te ofrece toda la experiencia de Cuyo a un costo muy bajo para vos y tu familia.',
                                    style: TextStyle(
                                        color: Colors.grey[200],
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: _screenWidth * 0.06),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              // Espacio vacío para evitar reacomodos
                              height: _screenHeight * 0.075,
                              width: _screenWidth * 0.075,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Video de fondo:
class VideoFondoWidget extends StatelessWidget {
  const VideoFondoWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required bool isLoading,
    required String? errorMessage,
    required VideoPlayerController controller,
  })  : _isLoading = isLoading,
        _errorMessage = errorMessage,
        _controller = controller;

  final double screenHeight;
  final double screenWidth;
  final bool _isLoading;
  final String? _errorMessage;
  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Text(_errorMessage!,
                      style: const TextStyle(color: Colors.red)))
              : FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
    );
  }
}
