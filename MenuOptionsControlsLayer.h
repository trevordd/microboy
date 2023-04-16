#import "SceneManager.h"

//
@interface MenuOptionsControlsLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    
    
    CCButton * buttonControls;
    CCButton * swipeControls;
    CCButton * playerMoveAssist;
    CCButton * time5mins;
    CCButton * time7mins;
}

//- (void)on2mins:(id)sender;
- (void)on3mins:(id)sender;
- (void)on5mins:(id)sender;
- (void)on7mins:(id)sender;
- (void)onGoBack : (id)sender;

@end
