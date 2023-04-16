//
//  MenuOptionsLayer.h
//  mySoccer
//
//  Created by Trevor Delves on 10/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneManager.h"
#import "Pitch.h"


@interface MenuHelpLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *forwardLabel;
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    
    CCButton * time1mins;
    CCButton * time2mins;
    CCButton * time3mins;
    CCButton * time5mins;
    CCButton * time7mins;
}




@end
