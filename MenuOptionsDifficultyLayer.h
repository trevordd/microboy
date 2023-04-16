#import "SceneManager.h"

//
@interface MenuOptionsDifficultyLayer : CCNode {
    CCSprite *menuBG;
    CCSprite *menu2BG;
    
    CCLabelTTF *backLabel;
    CCLabelTTF *titleLabel;
    
    
    CCButton * easy;
    CCButton * medium;
    CCButton * hard;
}


- (void)onEasy:(id)sender;
- (void)onMedium:(id)sender;
- (void)onHard:(id)sender;
@end
