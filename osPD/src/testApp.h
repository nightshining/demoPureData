
#pragma once

#include "ofMain.h"
#include "ofxPd.h"

using namespace pd;

class testApp : public ofBaseApp, public PdReceiver {

	public:

		void setup();
		void update();
		void draw();
		void exit();

		void keyPressed  (int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void windowResized(int w, int h);
		
    // the puredata instance
    ofxPd pd;
	
    // the audio callback
    void audioOut(float *output, int bufferSize, int numChannels);
    void receiveFloat(const std::string& dest, float num);
    // pd message receiver callbacks
    void print(const std::string& message);
    
    float alpha;
    
};
