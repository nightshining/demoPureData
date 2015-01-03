#pragma once

#include "ofMain.h"
#include "ofxPd.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

using namespace pd;

class ofApp : public ofxiOSApp, public PdReceiver {
    
public:
    
    void setup();
    void update();
    void audioOut(float * output, int bufferSize, int nChannels);
    
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
  
    //// Pure Data ////
    
    ofxPd pd;
    void receiveFloat(const std::string& dest, float num);
    // pd message receiver callbacks
    void print(const std::string& message);
    
    float alpha;
    
};