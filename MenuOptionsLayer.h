//
//  MenuOptionsLayer.h
//  mySoccer
//
//  Created by Trevor Delves on 10/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneManager.h"
#import "Pitch.h"


@interface MenuOptionsLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *forwardLabel;
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
}

- (void)onMatchLength:(id)sender;
- (void)onDifficulty:(id)sender;
- (void)onSkillLevel:(id)sender;
- (void)onControls:(id)sender;
- (void)onSound:(id)sender;
- (void)onGoBack : (id)sender;
//

@end
