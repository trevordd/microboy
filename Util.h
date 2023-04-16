//
//  Util.h
//  mySoccer
//
//  Created by Trevor Delves on 03/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SimpleAudioEngine.h"
#import "pitch.h"



@interface Util : NSObject {
    
}

+(int) random:(int)range;
+(bool) random5050;
+(int) random1inX:(int)range;
+(int) random1NotInX:(int)range;
+(float) randomFloat;
//+(CGPoint) getVectorRotatedByRandomAngle:(CGPoint)originalVec :(int)range;
//+(CGPoint) rotateVector:(CGPoint)vec Angle:(float)theta;
+(void) playSoundEffect:(NSString *)snd;
+(void) playSoundMusic:(NSString *)snd loop:(bool)loop;
+(void) playMenuMusic:(NSString *)snd loop:(bool)loop;
+(void) stopMenuMusic;
+(void) stopMusic;
@end
