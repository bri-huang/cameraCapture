# cameraCapture
Simple camera capture app for showing multiple cameras on the screen. There is no GUI or interface other than keystrokes to change between cameras. The camera names are currently hard-coded for 3 USB cameras. Keypresses '1', '2', and '3' switches between thes three views. Additionally, the [SPACE] key flips / mirrors the image. 

## Dependencies

Requires the video library in Processing.

## Usage
I wanted a real simple interface that provides a window with the camera view for multiple angles for streaming instructional videos. Logitech has a platform called Capture which allows to switch between different windows and display inputs, but it does not interface with all USB cameras. In fact, it only works with their newest streaming cameras. If you compile and export this application, you can run multiple instances that allow you to show each camera. There is a bit of a lag, but this is a completely workable solution.

### Multiple Instances Supported
If you compile and build the program as an executable, you can run multiple instances simultaneously. Note that you can not access the same USB camera at the same time. You can, however, have each window show a different camera.
![Desktop Screenshot](Snag_c5f36a.png)

Using Logitech's Capture program, you can now overlay two different camera views and record videos directly. This will also allow me to overlay my talking head over slides and other notes.

![Desktop Screenshot](2020-03-25_14-58-18.png)
