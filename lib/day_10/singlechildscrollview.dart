import 'package:flutter/material.dart';

class SingleChildScrollViewWidgetDay10 extends StatelessWidget {
  const SingleChildScrollViewWidgetDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SingleChildScrollView")),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          spacing: 20,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),

              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        color: Color(0xFF556B2F),
                      ),

                      Container(
                        height: 200,
                        width: 200,
                        color: Color(0xFF8FA31E),
                      ),

                      Positioned(
                        bottom: -20,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Color(0xFFC6D870),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        color: Color(0xFF556B2F),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Color(0xFF8FA31E),
                      ),
                      Positioned(
                        bottom: -20,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Color(0xFFC6D870),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        color: Color(0xFF556B2F),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Color(0xFF8FA31E),
                      ),
                      Positioned(
                        bottom: -20,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Color(0xFFC6D870),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        color: Color(0xFF556B2F),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Color(0xFF8FA31E),
                      ),
                      Positioned(
                        bottom: -20,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Color(0xFFC6D870),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(height: 300, width: 300, color: Color(0xFF556B2F)),

                Container(height: 200, width: 200, color: Color(0xFF8FA31E)),

                Positioned(
                  bottom: -20,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Color(0xFFC6D870),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(height: 300, width: 300, color: Color(0xFF556B2F)),
                Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
                Positioned(
                  bottom: -20,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Color(0xFFC6D870),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(height: 300, width: 300, color: Color(0xFF556B2F)),
                Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
                Positioned(
                  bottom: -20,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Color(0xFFC6D870),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(height: 300, width: 300, color: Color(0xFF556B2F)),
                Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
                Positioned(
                  bottom: -20,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Color(0xFFC6D870),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
