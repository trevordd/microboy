//
//  MenuChooseTeamLayer.h
//  mySoccer
//
//  Created by Trevor Delves on 10/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "Pitch.h"

@interface MenuChooseTeamLayer : CCNode {
    CCLabelTTF *testLabel;
    CCLabelTTF *forwardLabel;
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    CCSprite *pitch;
    CCSprite *backBox;
    CCSprite *menuBG;
    CCSprite *menu2BG;
    CCSprite *menuBox;
    CCSprite *menuLogo;
    CCSprite *menuTab;
    NSMutableArray *nameLabels;
    NSMutableArray *nameButtons;
    
    
    
    int chosenTeam1Id;
    int chosenTeam2Id;
    bool team1Chosen;
    bool team2Chosen;
    
    
}
//+(CCScene *) scene;


- (BOOL) isWithinArea:(CGPoint)touchPos :(CCLabelTTF *)label;
- (int) getTeamIndex:(CCButton*)button;
- (void)onGoBack : (id)sender;
    
@end
