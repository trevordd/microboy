//
//  FormationUtil.h
//  MicroSoccer5
//
//  Created by Trevor Delves on 16/12/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//

#ifndef FormationUtil_h
#define FormationUtil_h

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Pitch.h"
#import "FormationPosition.h"



@interface FormationUtil : NSObject {
}

+(CGPoint) getPitchPositionPercentage :(CGPoint) pos;
+(CGPoint) getPlayerPitchPosition :(CGPoint) percentagePos :(FormationPosition *)formationPos;
+(CGPoint) getPlayerPitchPositionInversed :(CGPoint) percentagePos :(FormationPosition *)formationPos;

-(id) init;
@end


#endif /* FormationUtil_h */
