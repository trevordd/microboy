//
//  Util.m
//  mySoccer
//
//  Created by Trevor Delves on 03/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Util.h"
#import "GameData.h"

@implementation Util

+(int) random:(int)range
{
    int result = arc4random() % range;

    //CCLOG(@"Result = %d", result);
    //CCLOG(@">> PLAYEr JUMP >>");
    return result;
}

+(float) randomFloat {
    return ((float) (arc4random() % 100)/100);
}

+(int) random1inX:(int)range
{
    int result = arc4random() % range;
    
    //CCLOG(@"Result = %d", result);
    //CCLOG(@">> PLAYEr JUMP >>");
    return (result==1);
}

+(int) random1NotInX:(int)range
{
    int result = arc4random() % range;
    
    //CCLOG(@"Result = %d", result);
    //CCLOG(@">> PLAYEr JUMP >>");
    return (result != 1);
}

+(bool) random5050
{
    int result = arc4random() % 2;
    return (result==0);
}


//
//+(CGPoint) rotateVector:(CGPoint)vec Angle:(float)theta
//{
//    CGPoint newVec;
//    float angle = -CC_RADIANS_TO_DEGREES( ccpToAngle(vec) );    
//    angle += theta;
//    //newVec = ccpForAngle(-CC_DEGREES_TO_RADIANS(angle));
//    return newVec;
//}

//
+(void) playSoundEffect:(NSString *)snd
{
    #ifdef SOUND_FX_ON
        //CCLOG(@">> PLAY SOUND");
        //[[SimpleAudioEngine sharedEngine] playEffect:snd];
    
    if ([GameData isFxSoundsOn]) {
        [[OALSimpleAudio sharedInstance] playEffect:snd loop: NO];
    }
    #endif
}

//
+(void) playSoundMusic:(NSString *)snd loop:(bool)loop
{
#ifdef SOUND_MUSIC_ON
    
    if ([GameData isCrowdSoundsOn]) {
        CCLOG(@">> PLAY MUSIC");
        //[[SimpleAudioEngine sharedEngine] playBackgroundMusic:snd loop:loop];
        [[OALSimpleAudio sharedInstance] playBg:snd loop:loop];
    }
#endif
}


//
+(void) playMenuMusic:(NSString *)snd loop:(bool)loop
{
    
#ifdef SOUND_MENU_MUSIC_ON
    
    if ([GameData isMenuSoundsOn]) {
        CCLOG(@">> PLAY MENU MUSIC");
        //[[SimpleAudioEngine sharedEngine] playBackgroundMusic:snd loop:loop];
        [[OALSimpleAudio sharedInstance] playBg:snd loop:loop];
    }
#endif
}

+(void) stopMenuMusic
{
    [[OALSimpleAudio sharedInstance] stopBg];
}


+(void) stopMusic
{
    #ifdef SOUND_MUSIC_ON
        //[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [[OALSimpleAudio sharedInstance] stopBg];
    #endif
}


//
//+(CGPoint) getVectorRotatedByRandomAngle:(CGPoint)originalVec :(int)range
//{
//    CGPoint randomVec;
//    int randomAngle = [Util random:range];
//    int length = ccpLength(originalVec);
//    
//    if([Util random:2] == 0)
//    {
//        randomVec = [self rotateVector:originalVec Angle:-randomAngle];
//    }
//    else
//    {
//        randomVec = [self rotateVector:originalVec Angle:randomAngle];
//    }
//    
//    CCLOG(@">> Angle Range = %d, random angle (divided by 2) = %d, original Vec : %f, %f, final Vector : %f,%f", 
//          range, randomAngle, originalVec.x, originalVec.y, randomVec.x, randomVec.y);
//    CCLOG(@">>>> Angle Range = %d, random angle (divided by 2) = %d, original Vec : %f, %f, final Vector : %f,%f", 
//          range, randomAngle, originalVec.x, originalVec.y, randomVec.x*length, randomVec.y*length);
//    
//    //rotate functionnormalise the vector - return the new vector based on original vector length
//    return ccpMult(randomVec,length);
//}

@end
