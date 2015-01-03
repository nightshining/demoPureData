#include "ofApp.h"

#include <Poco/Path.h>

//--------------------------------------------------------------
void ofApp::setup() {

    
    ofBackground(ofColor::white);
    // puredata works on sounds in chunks of 64 samples (called a tick)
    // 8 ticks per buffer corresponds to 8 * 64 sample buffer size (512 samples)
    int ticksPerBuffer = 8;
    
    // this initialized pd
    // format is pd.init(numOutputChannels, numInputChannels, samplerate, ticksPerBuffer)
    // note that outputs comes before inputs.
    pd.init(2, 0, 44100, ticksPerBuffer);
    
    // open the patch (relative to the data folder)
    pd.subscribe("data");
    pd.addReceiver(*this);
    pd.addToSearchPath("pd");
    pd.start();
    
    Patch patch = 	pd.openPatch("pd/test2.pd");
    cout << "pure data info: " << patch << endl;
    
    
    // start the sound stream - always do this last in your setup
    ofSoundStreamSetup(2, 0, this, 44100, ofxPd::blockSize() * ticksPerBuffer, 1);
    
    alpha = 0;
}

//--------------------------------------------------------------
void ofApp::update() {
    
    pd.sendFloat("tempo", ofMap(ofGetMouseX(), 0, ofGetWidth(), 300, 50));
    
    
}

// this is where the openframeworks sound stream connects to ofxPd
// it's also where the audio processing is done
void ofApp::audioOut(float *output, int bufferSize, int numChannels) {
    pd.audioOut(output, bufferSize, numChannels);
}
void ofApp::receiveFloat(const std::string& dest, float num) {
    
    // dest is the send name, so here we test to see if it's the amplitude
    // (although we don't really need to because it's the only one that's
    // being sent).
    if(dest == "data") {
        alpha = num;
    }
    
    //cout << "OF: float " << dest << ": " << num << endl;
    
}

void ofApp::print(const std::string& message) {
    
    // cout << message << endl;
    
}

//--------------------------------------------------------------
void ofApp::draw() {
    
    
    ofSetCircleResolution(100);
    ofSetColor(ofColor::salmon, ofMap(alpha, 0, 80, 50, 255));
    ofDrawBitmapString("Pure Data Working", 50, 50);
    ofFill();
    ofCircle(ofGetWidth() / 2, ofGetHeight() / 2, 50);
    ofSetColor(ofColor::white);
    ofNoFill();
    ofCircle(ofGetWidth() / 2, ofGetHeight() / 2, 50);
    cout << "Alpha: " << alpha << endl;
    
}

//--------------------------------------------------------------
void ofApp::exit() {
}


//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    pd.sendFloat("metroOn", 1);
    
    
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
  
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}
