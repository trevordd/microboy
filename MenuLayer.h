//
//  MenuLayer.h
//  mySoccer
//
//  Created by Trevor Delves on 18/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//
//#import <Foundation/Foundation.h>
//#import "cocos2d.h"
//
//#import "CCTouchDispatcher.h"
//
//
//@interface MenuLayer : CCNode {
//    
//}
//
//+(CCScene *) scene;
//
//@end

#import "cocos2d.h"
#import "SceneManager.h"
#import "Pitch.h"
#import "FormationPosition.h"
#import "FormationUtil.h"


@interface MenuLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    CCSprite *menuBox;
    CCSprite *menuLogo;
    CCSprite *menuTab;
    CCLabelTTF *titleLabel;
    CCSprite *musicButton;
    
}

+(CCScene *) scene;
+(void) playMenuButtonSound;
+(void) playMenuButtonSound2;
+(void) playMenuButtonSound3;
+(void) playMenuButtonSound4;
+(void) playMenuButtonSound5;
+(void) playMenuButtonSound6;

- (void)onNewGame:(id)sender;
//- (void)onCredits:(id)sender;
- (void)onDemoGame:(id)sender;
- (void)onPracticeGame:(id)sender;
- (void)onManagerGame:(id)sender;
- (void)onCupGame:(id)sender;
- (void)onOptions:(id)sender;
- (void)onMusic:(id)sender;
- (void)onHelp:(id)sender;

@end
