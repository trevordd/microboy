//
//  FormationPosition.h
//  MicroSoccer5
//
//  Created by Trevor Delves on 16/12/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//

#ifndef FormationPosition_h
#define FormationPosition_h


#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface FormationPosition : NSObject {
    
    CGPoint startPositionPercenatge;
    
    float verticalPercAhead;
    float verticalPercBehind;
    
    float horizontalPercAhead;
    float horizontalPercBehind;
}

@property CGPoint startPositionPercentage;

@property float verticalPercAhead;
@property float verticalPercBehind;

@property float horizontalPercAhead;
@property float horizontalPercBehind;

-(id) init;
-(id) initWithDetails:(float)xPos :(float)yPos :(float)vAhead :(float)vBehind :(float)hAhead :(float)hBehind;

@end

#endif /* FormationPosition_h */
