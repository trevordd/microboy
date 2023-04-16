//
//  HudModel.h
//  mySoccer
//
//  Created by Trevor Delves on 26/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RectangleNode.h"
#import "Pitch.h"



@interface HudModel : CCNode
{
    CCSprite *leftDPad;
    CCSprite *rightDPad;
    CCSprite *upDPad;
    CCSprite *downDPad;
    CCSprite *centerDPad;
    CCSprite *joypad;
    CCSprite *joyStick;
    CCSprite *joyPassButton;
    //CCSprite *joyLongPassButton;
    CCSprite *joyShootButton;
    CCLabelBMFont *joyPassButtonLabel;
    //CCLabelBMFont *joyLongPassButtonLabel;
    CCLabelBMFont *joyShootButtonLabel;
    
    
    //
    CCSprite *replayPanel;
    CCButton *playButton;
    CCButton *pauseButton;
    CCButton *stopButton;
    CCButton *forwardButton;
    CCButton *rewindButton;
    CCButton *zoomInButton;
    CCButton *zoomOutButton;
    CCButton *exitButton;
    CCSprite *zoomText;
    CCButton *ingamePauseButton;
    CCButton *ingamePlayButton;

    
    //
    CCSprite *kickOffSpr;
    CCSprite *goalSpr;
    CCSprite *halftimeSpr;
    CCSprite *fulltimeSpr;
    
    //
    CCSprite *passSpr;
    CCSprite *shootSpr;
    CCSprite *switchSpr;
    CCSprite *slideSpr;

    //
    CCLabelTTF *scorelabel;
    CCLabelTTF *timelabel;
    CCLabelTTF *p1Namelabel;
    CCLabelTTF *p2Namelabel;
    
    CCLabelTTF *scorelabelBg;
    CCLabelTTF *timelabelBg;
    CCLabelTTF *p1NamelabelBg;
    CCLabelTTF *p2NamelabelBg;
    
    CCNodeColor *timeBackground;
    CCNodeColor *scoreBackground;
    
    //
    CCSprite *tutorialBackground1;
    CCNodeColor *tutorialBackground2;

    CCSprite *tutorialOverlay;
    //
    //RectangleNode *recBackground;

    int version;
}

@property (nonatomic, strong) CCSprite *joypad;
@property (nonatomic, strong) CCSprite *joyStick;
@property (nonatomic, strong) CCSprite *joyPassButton;
//@property (nonatomic, strong) CCSprite *joyLongPassButton;
@property (nonatomic, strong) CCSprite *joyShootButton;

@property (nonatomic, strong) CCLabelBMFont *joyPassButtonLabel;
//@property (nonatomic, strong) CCLabelBMFont *joyLongPassButtonLabel;
@property (nonatomic, strong) CCLabelBMFont *joyShootButtonLabel;


@property (nonatomic, strong) CCSprite *kickOffSpr;
@property (nonatomic, strong) CCSprite *goalSpr;
@property (nonatomic, strong) CCSprite *halftimeSpr;
@property (nonatomic, strong) CCSprite *fulltimeSpr;

@property (nonatomic, strong) CCSprite *passSpr;
@property (nonatomic, strong) CCSprite *shootSpr;
@property (nonatomic, strong) CCSprite *switchSpr;
@property (nonatomic, strong) CCSprite *slideSpr;


@property (nonatomic, strong) CCLabelTTF *scorelabel;
@property (nonatomic, strong) CCLabelTTF *timelabel;
@property (nonatomic, strong) CCLabelTTF *p1Namelabel;
@property (nonatomic, strong) CCLabelTTF *p2Namelabel;

@property (nonatomic, strong) CCSprite *scorelabelBg;
@property (nonatomic, strong) CCSprite *timelabelBg;
@property (nonatomic, strong) CCSprite *p1NamelabelBg;
@property (nonatomic, strong) CCSprite *p2NamelabelBg;

@property (nonatomic, strong) CCNodeColor *scoreBackground;
@property (nonatomic, strong) CCNodeColor *timeBackground;

@property (nonatomic, assign) int version;

@property (nonatomic, strong) CCSprite *replayPanel;
@property (nonatomic, strong) CCButton *playButton;
@property (nonatomic, strong) CCButton *pauseButton;
@property (nonatomic, strong) CCButton *stopButton;
@property (nonatomic, strong) CCButton *forwardButton;
@property (nonatomic, strong) CCButton *rewindButton;
@property (nonatomic, strong) CCButton *zoomInButton;
@property (nonatomic, strong) CCButton *zoomOutButton;
@property (nonatomic, strong) CCButton *exitButton;
@property (nonatomic, strong) CCSprite *zoomText;
@property (nonatomic, strong) CCButton *ingamePauseButton;
@property (nonatomic, strong) CCButton *ingamePlayButton;

//
@property (nonatomic, strong) CCSprite *tutorialBackground1;
@property (nonatomic, strong) CCNodeColor *tutorialBackground2;

@property (nonatomic, strong) CCSprite *tutorialOverlay;

//@property (nonatomic, retain) RectangleNode *recBackground;


+(HudModel*) sharedHudModel;
-(id) init;

//
-(void) createHudObjects;

//
-(void) hideControls;
-(void) showControls;
-(void) setControlsColour : (CCColor *) col;
-(void) setJoyStickPosition:(CGPoint *)pos;
-(void) setScorelabelString:(NSString*)text;
-(void) showReplayControls:(bool)status;
-(void) showZoomButtons:(bool)status;
//-(void) showInGamePlayButton:(bool)status;
-(void) hideMatchInfoSprites;
-(void) showExitButton:(bool) show;
-(void) resetScoreLabel;
-(void) showPassShotButtons:(bool) status;

-(void) showHumanInPossessionLabels;
-(void) showHumanOutOfPossessionLabels;

-(void) showTutorial :(bool) show;

//
@end
