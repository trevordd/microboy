//
//  HudModel.m
//  mySoccer
//
//  Created by Trevor Delves on 26/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HudModel.h"
#import "GameData.h"

@implementation HudModel

@synthesize joypad;
@synthesize joyStick;
@synthesize joyPassButton;

@synthesize joyShootButton;
@synthesize joyPassButtonLabel;
@synthesize joyShootButtonLabel;



@synthesize kickOffSpr;
@synthesize goalSpr;
@synthesize halftimeSpr;
@synthesize fulltimeSpr;

@synthesize passSpr;
@synthesize shootSpr;
@synthesize switchSpr;
@synthesize slideSpr;

@synthesize scorelabel;
@synthesize timelabel;
@synthesize p1Namelabel;
@synthesize p2Namelabel;

@synthesize scorelabelBg;
@synthesize timelabelBg;
@synthesize p1NamelabelBg;
@synthesize p2NamelabelBg;

@synthesize version;

@synthesize replayPanel;
@synthesize playButton;
@synthesize pauseButton;
@synthesize stopButton;
@synthesize forwardButton;
@synthesize zoomInButton;
@synthesize zoomOutButton;
@synthesize zoomText;
@synthesize rewindButton;
@synthesize ingamePauseButton;
@synthesize ingamePlayButton;
@synthesize exitButton;

@synthesize scoreBackground;
@synthesize timeBackground;

@synthesize tutorialBackground1;
@synthesize tutorialBackground2;
@synthesize tutorialOverlay;

static HudModel *hudModel = nil;



+ (HudModel*) sharedHudModel
{
    if (hudModel == nil) {
        hudModel = [[super alloc] init];
    }
    return hudModel;
}


-(id) init
{
    if( (self=[super init] ))
    {
        //[super onEnter];
        version++;
    }
	return self;
}

//
-(void) createHudObjects
{
    CCLOG(@">> createHudObjects");
    //
    CGSize viewSize = [CCDirector sharedDirector].viewSize;
    int screenCenterX = viewSize.width/2;
    int screenCenterY = viewSize.height/2;
    
    //
    self.tutorialBackground1.anchorPoint = CGPointMake(0,0);
    
    //int swipeBoxWidth = (viewSize.width/2)+(viewSize.width/4);
    int swipeBoxWidth = (viewSize.width/2);
    swipeBoxWidth+=(swipeBoxWidth/3);
    
    //int swipeBoxXPos = (viewSize.width - swipeBoxWidth)-12;
    
    // size
    self.tutorialBackground1= [CCSprite spriteWithImageNamed: @"tutorialNew.png"]; //tutorialBase2
    self.tutorialBackground1.position = ccp( viewSize.width/2,viewSize.height/2 ); //125
    self.tutorialBackground1.anchorPoint=CGPointMake(0.5,0.5);
    self.tutorialBackground1.opacity=0.99f; //0.65
    //int joypadBoxWidth = viewSize.width-swipeBoxWidth-20;
    //self.tutorialBackground2= [CCNodeColor nodeWithColor:boxColor width:joypadBoxWidth height:viewSize.height-15];
    // self.tutorialBackground2.anchorPoint = CGPointMake(0.5,0.5);
    //self.tutorialBackground2.position = CGPointMake(5, 10);
    
    //
    self.tutorialOverlay = [CCSprite spriteWithImageNamed: @"tutorial.png"];
    self.tutorialOverlay.anchorPoint=CGPointMake(0.5,0.5);
    self.tutorialOverlay.position = ccp( -viewSize.width/2,viewSize.height/2 ); //125
    self.tutorialOverlay.opacity=0.85f;  // 0.5
//    self.tutorialOverlay.scaleX=0.85;
//    self.tutorialOverlay.scaleY=0.82;
    
    

    //
    self.joyPassButton= [CCSprite spriteWithImageNamed: @"action_button.png"];
    self.joyPassButton.anchorPoint=CGPointMake(0.5,0.5);
    self.joyPassButton.position = ccp( viewSize.width-PASS_BUTTON_DISTANCE_FROM_SIDE, PASS_BUTTON_DISTANCE_FROM_BOTTOM ); //125
    self.joyPassButton.opacity=1.0;
    //self.joyPassButton.scale=0.35;
    
    //self.joyPassButtonLabel = [CCButton buttonWithTitle  :@"PASS" fontName:@MENU_FONT fontSize:8];
    self.joyPassButtonLabel = [CCLabelBMFont labelWithString:@"" fntFile:@"arial16.fnt"];
    self.joyPassButtonLabel.anchorPoint=CGPointMake(0.5,0.5);
    self.joyPassButtonLabel.position = ccp( viewSize.width-PASS_BUTTON_DISTANCE_FROM_SIDE, PASS_BUTTON_DISTANCE_FROM_BOTTOM ); //125
    
    //
//    self.joyLongPassButton= [CCSprite spriteWithImageNamed: @"joypadCap.png"];
//    self.joyLongPassButton.anchorPoint=CGPointMake(0.5,0.5);
//    self.joyLongPassButton.position = ccp( viewSize.width-50, 45 );
//    self.joyLongPassButton.opacity=0.5f;
    

//    self.joyLongPassButtonLabel = [CCLabelBMFont labelWithString:@"HIGH\nPASS" fntFile:@"arial16.fnt"];
//    self.joyLongPassButtonLabel.anchorPoint=CGPointMake(0.5,0.5);
//    self.joyLongPassButtonLabel.position = ccp( viewSize.width-50, 45 );

    //
    self.joyShootButton= [CCSprite spriteWithImageNamed: @"action_button.png"]; //
    self.joyShootButton.anchorPoint=CGPointMake(0.5,0.5);
    self.joyShootButton.position = ccp( viewSize.width-SHOT_BUTTON_DISTANCE_FROM_SIDE, SHOT_BUTTON_DISTANCE_FROM_BOTTOM );
    self.joyShootButton.opacity=1.0f;  // 0.5
    //self.joyShootButton.scale=0.35;     // 1.0
    
    //self.joyShootButtonLabel = [CCButton buttonWithTitle:@"SHOOT" fontName:@MENU_FONT fontSize:5];
    self.joyShootButtonLabel = [CCLabelBMFont labelWithString:@"" fntFile:@"arial16.fnt"];

    
    self.joyShootButtonLabel.anchorPoint=CGPointMake(0.5,0.5);
    self.joyShootButtonLabel.position = ccp( viewSize.width-SHOT_BUTTON_DISTANCE_FROM_SIDE, SHOT_BUTTON_DISTANCE_FROM_BOTTOM );
    
    //
    self.joypad= [CCSprite spriteWithImageNamed: @"joypad_area.png"];
    self.joypad.anchorPoint=CGPointMake(0.5,0.5);
    self.joypad.position = ccp( JOYSTICK_CENTER_X, JOYSTICK_CENTER_Y );
    //self.joypad.opacity=0.20f;
    self.joypad.scale=0.35;
    
    
    //
    self.joyStick= [CCSprite spriteWithImageNamed: @"joypad3.png"];
    self.joyStick.anchorPoint=CGPointMake(0.5,0.5);
    self.joyStick.position = ccp( JOYSTICK_CENTER_X, JOYSTICK_CENTER_Y );
    self.joyStick.opacity=0.75f;
    self.joyStick.scale=0.40;
    
    //
    self.goalSpr = [CCSprite spriteWithImageNamed: @"GOAL.png"];
    self.goalSpr.position = ccp ( screenCenterX, screenCenterY );
    self.goalSpr.visible =false;
    self.goalSpr.scale=0.70;
    
    
    //
    self.halftimeSpr = [CCSprite spriteWithImageNamed: @"HALFTIME.png"];
    self.halftimeSpr.position = ccp ( screenCenterX, screenCenterY );
    self.halftimeSpr.visible =false;
    self.halftimeSpr.scale=0.70;
    
    //
    self.fulltimeSpr = [CCSprite spriteWithImageNamed: @"FULLTIME.png"];
    self.fulltimeSpr.position = ccp ( screenCenterX, screenCenterY );
    self.fulltimeSpr.visible =false;
    self.fulltimeSpr.scale=0.70;
    
    //
    self.kickOffSpr = [CCSprite spriteWithImageNamed: @"KICKOFF.png"];
    self.kickOffSpr.position = ccp ( screenCenterX, screenCenterY );
    self.kickOffSpr.visible =false;
    self.kickOffSpr.scale=0.70;
    
    //
    self.passSpr = [CCSprite spriteWithImageNamed: @"PASS.png"];
    //self.passSpr.position = ccp ( screenCenterX, screenCenterY );
    self.passSpr.position = ccp( viewSize.width-PASS_BUTTON_DISTANCE_FROM_SIDE, PASS_BUTTON_DISTANCE_FROM_BOTTOM );
    self.passSpr.visible =false;
    self.passSpr.scale=0.70;
    
    self.shootSpr = [CCSprite spriteWithImageNamed: @"SHOOT.png"];
    //self.shootSpr.position = ccp ( screenCenterX, screenCenterY );
    self.shootSpr.position = ccp( viewSize.width-SHOT_BUTTON_DISTANCE_FROM_SIDE, SHOT_BUTTON_DISTANCE_FROM_BOTTOM );
    self.shootSpr.visible =false;
    self.shootSpr.scale=0.70;
    
    self.switchSpr = [CCSprite spriteWithImageNamed: @"SWITCH.png"];
    self.switchSpr.position = ccp( viewSize.width-SHOT_BUTTON_DISTANCE_FROM_SIDE, SHOT_BUTTON_DISTANCE_FROM_BOTTOM );
    self.switchSpr.visible =false;
    self.switchSpr.scale=0.70;

    self.slideSpr = [CCSprite spriteWithImageNamed: @"SLIDE.png"];
    self.slideSpr.position = ccp( viewSize.width-PASS_BUTTON_DISTANCE_FROM_SIDE, PASS_BUTTON_DISTANCE_FROM_BOTTOM );
    self.slideSpr.visible =false;
    self.slideSpr.scale=0.70;

    
    
    self.p1Namelabel = [CCLabelBMFont labelWithString:@"" fntFile:@"kiloton11.fnt"];
    [p1Namelabel setPosition: ccp(5,10)];
    p1Namelabel.anchorPoint=ccp(0,0.5);
    
    self.p2Namelabel = [CCLabelBMFont labelWithString:@"" fntFile:@"kiloton11.fnt"];
    [p2Namelabel setPosition: ccp(PITCH_RIGHT+60,10)];
    p2Namelabel.anchorPoint=ccp(1,0.5);
    
    
    self.scorelabel = [CCLabelBMFont labelWithString:@"" fntFile:@"kiloton12.fnt"];
    self.scorelabel.anchorPoint = CGPointMake(0.5,0);
    [scorelabel setPosition: ccp(59,viewSize.height-25)];
    
    self.timelabel = [CCLabelBMFont labelWithString:@"" fntFile:@"kiloton12.fnt"];
    self.timelabel.anchorPoint = CGPointMake(0.5,0);
    [timelabel setPosition: ccp(viewSize.width-32,viewSize.height-25)];
    
    //
    self.p1NamelabelBg = [CCSprite spriteWithImageNamed: @"transparent_box_dark.png"];
    [p1NamelabelBg setPosition: ccp(50,10)];
    self.p1NamelabelBg.scaleX=0.65;
    self.p1NamelabelBg.scaleY=0.5;
    self.p1NamelabelBg.opacity=0.08;
    
    self.p2NamelabelBg = [CCSprite spriteWithImageNamed: @"transparent_box_dark.png"];
    [p2NamelabelBg setPosition: ccp(PITCH_RIGHT+10,10)];
    self.p2NamelabelBg.scaleX=0.65;
    self.p2NamelabelBg.scaleY=0.5;
    self.p2NamelabelBg.opacity=0.08;
    
    
    self.scorelabelBg = [CCSprite spriteWithImageNamed: @"transparent_box_dark.png"];
    self.scorelabelBg.anchorPoint = CGPointMake(0.5,0.15);
    [scorelabelBg setPosition: ccp(59,viewSize.height-25)];
    self.scorelabelBg.scaleX=0.70;
    self.scorelabelBg.scaleY=0.5;
    self.scorelabelBg.opacity=0.5;
    
    
    self.timelabelBg = [CCSprite spriteWithImageNamed: @"transparent_box_dark.png"];
    self.timelabelBg.anchorPoint = CGPointMake(0.5,0.15);
    [timelabelBg setPosition: ccp(viewSize.width-32,viewSize.height-25)];
    self.timelabelBg.scaleX=0.40;
    self.timelabelBg.scaleY=0.50;
    self.timelabelBg.opacity=0.5;
    
    //
  
    CCColor *tutorialBoxColor = [CCColor colorWithRed:(0.0f) green:(0.00f) blue:(0.0f) alpha:(.35f)];
    self.timeBackground = [CCNodeColor nodeWithColor:tutorialBoxColor width:70 height:18];
    self.timeBackground.anchorPoint = CGPointMake(0.5,0.5);
    self.timeBackground.position = CGPointMake(viewSize.width-30, viewSize.height-18);
    
    self.scoreBackground = [CCNodeColor nodeWithColor:tutorialBoxColor width:124 height:18];
    self.scoreBackground.anchorPoint = CGPointMake(0.5,0.5);
    self.scoreBackground.position = CGPointMake(55, viewSize.height-18);

    //
//    [timelabel addChild:timeBackground];
//    [scorelabel addChild:scoreBackground];
    
        //[sprite setSpriteFrame:frame];
    //CCButton * testBtn = [CCButton buttonWithTitle:@"" spriteFrame:playFrame];
                           


    
    
    //replay controls
    int controlsY = 50;
    int controlsXGap = 70;
    
    //self.playButton = [CCSprite spriteWithImageNamed: @"play.png"];
    float buttonOpacity=REPLAY_BUTTONS_OPACITY;
    
    self.replayPanel = [CCSprite spriteWithImageNamed:@"replayPanel.png"];
    self.replayPanel.anchorPoint=CGPointMake(0.5,0.5);
    self.replayPanel.position = ccp ( screenCenterX, controlsY );
    self.replayPanel.visible =false;
    self.replayPanel.scale=0.6;
    self.replayPanel.opacity=REPLAY_PANEL_OPACITY;

    
    
    CCSpriteFrame *playFrame = [CCSpriteFrame frameWithImageNamed:@"play.png"];
    self.playButton = [CCButton  buttonWithTitle:@"" spriteFrame:playFrame];
    self.playButton.anchorPoint = CGPointMake(0.5,0.5);
    self.playButton.position = ccp ( screenCenterX - controlsXGap-3, controlsY );
    self.playButton.visible =false;
    self.playButton.scale=0.5;
    self.playButton.cascadeOpacityEnabled=YES;
    self.playButton.opacity=buttonOpacity;


    CCSpriteFrame *pauseFrame = [CCSpriteFrame frameWithImageNamed:@"pause.png"];
    self.pauseButton = [CCButton buttonWithTitle:@"" spriteFrame:pauseFrame];
    self.pauseButton.anchorPoint = CGPointMake(0.5,0.5);
    self.pauseButton.position = ccp ( screenCenterX, controlsY );
    self.pauseButton.visible =false;
    self.pauseButton.scale=0.5;
    self.pauseButton.cascadeOpacityEnabled=YES;
    self.pauseButton.opacity=buttonOpacity;

    CCSpriteFrame *stopFrame = [CCSpriteFrame frameWithImageNamed:@"stop.png"];
    self.stopButton = [CCButton buttonWithTitle:@"" spriteFrame:stopFrame];
    self.stopButton.anchorPoint = CGPointMake(0.5,0.5);
    self.stopButton.position = ccp ( screenCenterX + controlsXGap+3, controlsY );
    self.stopButton.visible =false;
    self.stopButton.cascadeOpacityEnabled=YES;
    self.stopButton.opacity=buttonOpacity;
    self.stopButton.scale=0.5;
    
    //self.forwardButton = [CCSprite spriteWithImageNamed: @"fastforward.png"];
    CCSpriteFrame *fastForwardFrame = [CCSpriteFrame frameWithImageNamed:@"fastforward.png"];
    self.forwardButton = [CCButton buttonWithTitle:@"" spriteFrame:fastForwardFrame];
    self.forwardButton.anchorPoint = CGPointMake(0.5,0.5);
    self.forwardButton.position = ccp ( screenCenterX + (controlsXGap * 2)+3, controlsY );
    self.forwardButton.visible =false;
    self.forwardButton.cascadeOpacityEnabled=YES;
    self.forwardButton.opacity=buttonOpacity;
    self.forwardButton.scale=0.5;

    CCSpriteFrame *rewindFrame = [CCSpriteFrame frameWithImageNamed:@"rewind.png"];
    self.rewindButton = [CCButton buttonWithTitle:@"" spriteFrame:rewindFrame];
    self.rewindButton.anchorPoint = CGPointMake(0.5,0.5);
    self.rewindButton.position = ccp ( screenCenterX - (controlsXGap * 2)-3, controlsY );
    self.rewindButton.visible =false;
    self.rewindButton.cascadeOpacityEnabled=YES;
    self.rewindButton.opacity=buttonOpacity;
    self.rewindButton.scale=0.5;
    
    CCSpriteFrame *exitButtonFrame = [CCSpriteFrame frameWithImageNamed:@"x.png"];
    self.exitButton = [CCButton buttonWithTitle:@"" spriteFrame:exitButtonFrame];
    self.exitButton.anchorPoint = CGPointMake(0.5,0.5);
    self.exitButton.position = ccp ( viewSize.width-25 , viewSize.height-50 );
    self.exitButton.visible =false;
  //  self.exitButton.cascadeOpacityEnabled=YES;
  //  self.exitButton.opacity=0.65f;
    self.exitButton.scale=0.5; //0.2
    
    
    float zoomButtonScale =0.35;
    CCSpriteFrame *zoomInButtonFrame = [CCSpriteFrame frameWithImageNamed:@"zoomin.png"];
    self.zoomInButton = [CCButton buttonWithTitle:@"" spriteFrame:zoomInButtonFrame];
    self.zoomInButton.anchorPoint = CGPointMake(0.5,0.5);
    self.zoomInButton.position = ccp ( 25 , (viewSize.height/2)+17);
    self.zoomInButton.visible =false;
    self.zoomInButton.scale=zoomButtonScale;
    
    CCSpriteFrame *zoomoutButtonFrame = [CCSpriteFrame frameWithImageNamed:@"zoomout.png"];
    self.zoomOutButton = [CCButton buttonWithTitle:@"" spriteFrame:zoomoutButtonFrame];
    self.zoomOutButton.anchorPoint = CGPointMake(0.5,0.5);
    self.zoomOutButton.position = ccp ( 25 , (viewSize.height/2)-17);
    self.zoomOutButton.visible =false;
    self.zoomOutButton.scale=zoomButtonScale;
    
//    CCSpriteFrame *ingamePlayButtonFrame = [CCSpriteFrame frameWithImageNamed:@"ingameplay.png"];
//    self.ingamePlayButton = [CCButton buttonWithTitle:@"" spriteFrame:ingamePlayButtonFrame];
//    self.ingamePlayButton.anchorPoint = CGPointMake(0.5,0.5);
//    self.ingamePlayButton.position = ccp ( 25 , (viewSize.height/2)+50);
//    self.ingamePlayButton.visible =false;
//    self.ingamePlayButton.scale=zoomButtonScale;
//    
//    CCSpriteFrame *ingamePauseButtonFrame = [CCSpriteFrame frameWithImageNamed:@"ingamepause.png"];
//    self.ingamePauseButton = [CCButton buttonWithTitle:@"" spriteFrame:ingamePauseButtonFrame];
//    self.ingamePauseButton.anchorPoint = CGPointMake(0.5,0.5);
//    self.ingamePauseButton.position = ccp ( 25 , (viewSize.height/2)+50);
//    self.ingamePauseButton.visible =true;
//    self.ingamePauseButton.scale=zoomButtonScale;
    
    self.zoomText = [CCSprite spriteWithImageNamed: @"zoom.png"];
    self.zoomText.position = ccp ( 5 , viewSize.height/2);
    self.zoomText.visible =false;
    //self.zoomText.scale=0.4;
    
}

-(void) doButtonTest:(id)sender {
    CCLOG(@">> Play button pressed");
    
    //CCLOG(@">> PLAY BUTTON");
   // [[GameModel sharedGameModel] setReplayState: replayPlay];
}

//
-(void) showReplayControls:(bool)status
{
    self.visible=true;
    self.replayPanel.visible =status;
    self.playButton.visible =status;
    self.stopButton.visible =status;
    self.pauseButton.visible =status;
    self.forwardButton.visible =status;
    self.rewindButton.visible =status;
    self.exitButton.visible=status;
    
    #ifdef SHOW_ZOOM_BUTTONS
        self.zoomInButton.visible =status;
        self.zoomOutButton.visible =status;
        self.zoomText.visible=status;
    #endif
    
}

//
//-(void) showInGamePlayButton:(bool)status
//{
//    if (status) {
//        self.ingamePlayButton.visible=true;
//        self.ingamePauseButton.visible=false;
//
//    } else {
//        self.ingamePlayButton.visible=false;
//        self.ingamePauseButton.visible=true;
//
//    }
//}

//
-(void) showZoomButtons:(bool)status
{
#ifdef SHOW_ZOOM_BUTTONS
    self.zoomInButton.visible =status;
    self.zoomOutButton.visible =status;
    self.zoomText.visible=status;
#endif
    
    self.ingamePlayButton.visible=status;
    self.ingamePauseButton.visible=status;

}

//
-(void) hideControls
{
    self.joyStick.visible=false;
    self.joypad.visible=false;
    self.joyPassButton.visible=false;
    //self.joyLongPassButton.visible=false;
    self.joyShootButton.visible=false;
    self.joyPassButtonLabel.visible=false;
    self.passSpr.visible=false;
    self.shootSpr.visible=false;
    self.slideSpr.visible=false;
    self.switchSpr.visible=false;

    
    //self.joyLongPassButtonLabel.visible=false;
    self.joyShootButtonLabel.visible=false;

}

//
-(void) showPassShotButtons:(bool) status {
    self.joyPassButton.visible=status;
    self.joyShootButton.visible=status;
    self.joyPassButtonLabel.visible=status;
    self.joyShootButtonLabel.visible=status;
    self.passSpr.visible=status;
    self.shootSpr.visible=status;

}


//
-(void) hideMatchInfoSprites
{
    //
    self.goalSpr.visible=false;
    self.halftimeSpr.visible =false;
    self.fulltimeSpr.visible =false;
    self.kickOffSpr.visible =false;
}

-(void) resetScoreLabel {
    [self.scorelabel setString:@"0-0"];
}


-(void) showHumanInPossessionLabels
{
    NSLog(@"IN possion controls");
    self.joyPassButtonLabel.string=@"";
    //self.joyLongPassButtonLabel.string=@"HIGH\nPASS";
    self.joyShootButtonLabel.string=@"";
    self.slideSpr.visible=false;
    self.switchSpr.visible=false;
    self.passSpr.visible=true;
    self.shootSpr.visible=true;

}


-(void) showHumanOutOfPossessionLabels
{
    self.joyPassButtonLabel.string=@"";
    //self.joyLongPassButtonLabel.string=@"";
    self.joyShootButtonLabel.string=@"";
    self.passSpr.visible=false;
    self.shootSpr.visible=false;
    self.slideSpr.visible=true;
    self.switchSpr.visible=true;

}

-(void) setControlsColour : (CCColor *) col {
    self.joyStick.color=col;
    self.joypad.color=col;
    self.joyPassButton.color=col;
    self.joyShootButton.color=col;
}


-(void) showTutorial :(bool) show {
    HudModel *hm = [HudModel sharedHudModel];
    [hm tutorialBackground1].visible=show;
    //[hm tutorialBackground2].visible=show;
    [hm tutorialOverlay].visible=show;
}


//
-(void) showControls
{
    self.joyStick.visible=true;
    self.joypad.visible=true;
    self.joyPassButton.visible=true;
    self.joyShootButton.visible=true;
    self.joyPassButtonLabel.visible=true;
    self.joyShootButtonLabel.visible=true;
    
    if ([GameData isButtonControlsOn ]) {
        [self showPassShotButtons:true];
    } else {
         [self showPassShotButtons:false];
    }
}

-(void) showExitButton:(bool) show
{
    self.exitButton.visible=show;
    if (show) {
        self.exitButton.opacity=0.5f;
    }
}

-(void) setJoyStickPosition:(CGPoint *)pos;
{
    self.joyStick.position = ccp(pos->x, pos->y);
}

-(void) setScorelabelString:(NSString*)text
{
    [self.scorelabel setString:text];
}


@end
