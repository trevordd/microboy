#import "SceneManager.h"

//
@interface MenuOptionsSoundLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    
    
    CCButton * crowdSounds;
    CCButton * fxSounds;
    CCButton * menuSounds;
    CCButton * time3mins;
    CCButton * time5mins;
    CCButton * time7mins;
}

- (void)onCrowdSounds:(id)sender;
//- (void)onfxSounds:(id)sender;
- (void)onMenuSounds:(id)sender;
//- (void)on5mins:(id)sender;
//- (void)on7mins:(id)sender;
- (void)onGoBack : (id)sender;

@end
