//
//  GameInfoLayer.h
//  mySoccer
//
//  Created by Trevor Delves on 15/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "Pitch.h"

#import "HudModel.h"
#import "GameData.h"

@class SceneManager;

@interface GameInfoLayer : CCNode {
    CCLabelTTF *titleLabel;
    CCLabelTTF *info1Label;
    CCLabelTTF *info2Label;
    CCLabelTTF *info3Label;
    CCLabelTTF *info4Label;
    

    CCLabelTTF *continueLabel;
    CCSprite *menuBG;
    
    
    //GameLayer *gameLayer;
    
    // CCSprite screen
    CCSprite *recBackground;
    CCNodeColor *recBackgroundHeader;
    
    // 3 quarters
    CCSprite *recBackgroundSmall;
    CCNodeColor *recBackgroundHeaderSmall;
    
    CCSprite *buttonLeft;
    CCSprite *buttonLeftEdge;
    CCSprite *buttonCenter;
    CCSprite *buttonCenterEdge;
    CCSprite *buttonRight;
    CCSprite *buttonRightEdge;
    
//    CCLabelTTF *leftButtonLabel;
//    CCLabelTTF *centerButtonLabel;
//    CCLabelTTF *rightButtonLabel;
    
    CCButton *leftButtonLabel;
    CCButton *centerButtonLabel;
    CCButton *rightButtonLabel;
    
    
    //
    RectangleNode *recBackgroundTitle;
    RectangleNode *recBackgroundTitleHeader;
    CCSprite *buttonBigLeft;
    CCSprite *buttonBigCenter;
    CCSprite *buttonBigRight;
    CCButton *leftButtonBigLabel;
    CCButton *centerButtonBigLabel;
    CCButton *rightButtonBigLabel;
    CCLabelTTF * recBackgroundTitleLabel;
}

@property (nonatomic, strong) CCLabelTTF* titleLabel;
@property (nonatomic, strong) CCLabelTTF* info1Label;
@property (nonatomic, strong) CCLabelTTF* info2Label;
@property (nonatomic, strong) CCLabelTTF* info3Label;
@property (nonatomic, strong) CCLabelTTF* info4Label;
@property (nonatomic, strong) CCLabelTTF* continueLabel;

// full
@property (nonatomic, strong) CCSprite *recBackground;
@property (nonatomic, strong) CCNodeColor *recBackgroundHeader;

// three quarters
@property (nonatomic, strong) CCSprite *recBackgroundSmall;
@property (nonatomic, strong) CCNodeColor *recBackgroundHeaderSmall;

// footer buttons and labels
@property (nonatomic, strong) CCSprite *buttonLeft;
@property (nonatomic, strong) CCSprite *buttonLeftEdge;
@property (nonatomic, strong) CCSprite *buttonCenter;
@property (nonatomic, strong) CCSprite *buttonCenterEdge;
@property (nonatomic, strong) CCSprite *buttonRight;
@property (nonatomic, strong) CCSprite *buttonRightEdge;

//
@property (nonatomic, strong) CCButton* leftButtonLabel;
@property (nonatomic, strong) CCButton* centerButtonLabel;
@property (nonatomic, strong) CCButton* rightButtonLabel;

// title and big buttons
@property (nonatomic, strong) RectangleNode *recBackgroundTitle;
@property (nonatomic, strong) RectangleNode *recBackgroundTitleHeader;
@property (nonatomic, strong) CCSprite *buttonBigLeft;
@property (nonatomic, strong) CCSprite *buttonBigCenter;
@property (nonatomic, strong) CCSprite *buttonBigRight;
@property (nonatomic, strong) CCButton* leftButtonBigLabel;
@property (nonatomic, strong) CCButton* centerButtonBigLabel;
@property (nonatomic, strong) CCButton* rightButtonBigLabel;
@property (nonatomic, strong) CCLabelTTF* recBackgroundTitleLabel;

-(void) setPreMatchInfo;
-(void) setFullTimeInfo;
-(void) setHalfTimeInfo;
-(void) setMatchInProgressInfo;
-(void) updateScore:(int)t1Score :(int)t2Score;
-(void) updateScorerInfo:(int)teamId :(NSString *)scorer;
-(void) updateMatchEggTimer:(int)matchSecs;
- (BOOL) isWithinArea:(CGPoint)touchPos :(CGPoint)spritePos :(float)width;

-(void) showSmallBackground;
-(void) showBigBackground;
-(void) setAfterMatchLabels;
-(void) setReplayLabels;
-(void) setupReplay;
-(void) clearInfoLabels;
-(void) showInfoLabels:(bool) show;
-(void) showReplayLabels:(bool) show;
-(void) setHumanGotoMatchButtons;
-(void) setManagerGotoMatchButtons;
-(void) setDemoGotoMatchButtons;
-(void) setHalftimeButtons;



-(void) doLeftButton:(id)sender;
-(void) doCenterButton:(id)sender;
-(void) doRightButton:(id)sender;


//
-(void) showBackgroundTitle;
-(void) showFooterButtons:(bool) show;
-(void) showBigButtons:(bool) show;
-(void) showBigButtonsLabels:(bool) show;;
-(void) showBigBackground:(bool) show;
-(void) showSmallBackground:(bool) show;
-(void) showBackgroundTitle:(bool) show;


@end
