import processing.video.*;

Capture cam;
int cameraIndex = 0;
int flip = -1;
String titleString= "CameraCapture";

// Hard coded values of the camera names. Pull this from the debug window for your setup.
String[] camNames = {"HP Wide Vision FHD Camera", 
  "Logitech QuickCam Pro 9000", 
  "Logitech HD Webcam C270"};

// Hard coded default resolutions for each camera
int[][] camRes = {{640, 480}, {1600, 1200}, {1280, 960}};


void setup() {

  //set window size and settings
  size(640, 480);
  surface.setResizable(true);
  surface.setLocation(100, 100);

  //read all capture devices
  String[] cameras = Capture.list();

  // initialize and print out list of available cameras
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      print(i);
      print(" - ");
      println(cameras[i]);
    }

    //set cameraIndex and start capture.
    cameraIndex = 0;
    cam = new Capture(this, camRes[cameraIndex][0], camRes[cameraIndex][1], camNames[cameraIndex]);
    cam.start();
    surface.setTitle(setTitle(cameraIndex));
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }

  // pressing space flips the image. Check the flag variable
  if (flip == 1)
  {
    pushMatrix();
    translate(width, 0); // move to far corner
    scale(-1.0, 1.0);    // flip x-axis backwards
    if ((height / width) > (cam.height/cam.width))
    {
      image(cam, 0, 0, width, width * cam.height / cam.width);
    } else
    {
      image(cam, 0, 0, height*cam.width/cam.height, height);
    }
    popMatrix();
  } else
  {
    if ((height / width) > (cam.height/cam.width))
    {
      image(cam, 0, 0, width, width * cam.height / cam.width);
    } else
    {
      image(cam, 0, 0, height*cam.width/cam.height, height);
    }
  }
}

void keyPressed() {
  if (key==' ') {
    flip = flip * -1;
  }
  if ((key=='1') || (key == '2') || (key == '3'))
  {
    if (cameraIndex != (key - 49)) {
      cameraIndex = (key - 49);
      cam.stop();
      surface.setTitle(setTitle(cameraIndex));
      cam = new Capture(this, camRes[cameraIndex][0], camRes[cameraIndex][1], camNames[cameraIndex]);
      cam.start();
    }
  }
}

String setTitle(int index)
{
  String tempStr = "[" + str(cameraIndex + 1) + "] "+ camNames[cameraIndex] + " (" + camRes[cameraIndex][0] + "x" + camRes[cameraIndex][1] + ")"; 
  return tempStr;
}  
