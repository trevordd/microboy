//
//  MenuTeam.h
//  mySoccer
//
//  Created by Trevor Delves on 09/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "Pitch.h"
//#import "GameData.h"

@class GameData;

@interface MenuTeamLayer : CCNode 
{
    CCButton *testLabel;
    CCSprite *menuBG;
    CCSprite *menuBox;
    CCSprite *menuLogo;
    CCSprite *menuTab;
    CCButton *chosenButton1;
    CCButton *chosenButton2;
    CCButton *tempButton;
    bool player1Chosen;
    bool player2Chosen;
    
    CCLabelTTF *forwardLabel;
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    NSMutableArray *nameLabels;
    CCLabelTTF *chosenLabel;
    CCLabelTTF *selectedLabel;
    
    //
    CCButton *formationLabel;
    CCButton *leftFormationLabel;
    CCButton *rightFormationLabel;
    NSMutableArray *formationsNames;
    NSMutableArray *formationsPositions;
    long currentFormation;
    
    //
    
    GameData* gd;
    
    //
    int chosenPlayer1Id;
    int chosenPlayer2Id;
    
    //
    NSMutableArray *formationPlayers;
    NSMutableArray *formationPositions332;
    NSMutableArray *formationPositions323;
    NSMutableArray *formationPositions341;
    NSMutableArray *formationPositions431;
    NSMutableArray *formationPositions343;
    
    
    //
    NSMutableArray *formationNames;
    NSMutableArray *allFormations;
    
}

//+(CCScene *) scene;

//- (BOOL) isWithinArea:(CGPoint)touchPos :(CGPoint)spritePos :(float)width;
-(BOOL) isWithinArea:(CGPoint)touchPos :(CCLabelTTF *)label;
-(void) updateTeamDisplay;
-(void) moveRightFormation;
-(void) moveLeftFormation;
- (void)selectPlayer:(id)sender;
-(void)updatePlayerListings;
- (void)selectPlayerAndUpdateListing:(id)sender;
@end
