//
//  MenuGameType.h
//  mySoccer
//
//  Created by Trevor Delves on 09/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneManager.h"

@interface MenuGameTypeLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *forwardLabel;
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    
}

- (void)onHumanGame:(id)sender;
- (void)onManagerGame:(id)sender;
- (void)onPManagerGame:(id)sender;
- (void)onGoBack : (id)sender;

@end
