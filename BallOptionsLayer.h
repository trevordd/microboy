//
//  BallOptions.h
//  MicroSoccer5
//
//  Created by Trevor Delves on 13/07/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//

#ifndef BallOptionsLayer_h
#define BallOptionsLayer_h


#import "SceneManager.h"

//
@interface BallOptionsLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    
    
    CCButton * random;
    CCButton * white;
    CCButton * yellow;
    CCButton * orange;
    CCButton * blue;
    CCButton * magenta;
    
}

- (void)onRandom:(id)sender;
- (void)onWhite:(id)sender;
- (void)onYellow:(id)sender;
- (void)onOrange:(id)sender;
- (void)onBlue : (id)sender;
- (void)onMagenta : (id)sender;
//


@end

#endif


