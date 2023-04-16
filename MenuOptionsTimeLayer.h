#import "SceneManager.h"

//
@interface MenuOptionsTimeLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    
    
    CCButton * time1mins;
    CCButton * time2mins;
    CCButton * time3mins;
    CCButton * time4mins;
    CCButton * time5mins;
    CCButton * time7mins;
}

- (void)on2mins:(id)sender;
- (void)on3mins:(id)sender;
- (void)on4mins:(id)sender;
- (void)on5mins:(id)sender;
- (void)on7mins:(id)sender;
- (void)onGoBack : (id)sender;

@end
