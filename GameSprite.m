//
//  GameSprite.m
//  mySoccer
//
//  Created by Trevor Delves on 28/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameSprite.h"


@implementation GameSprite

@synthesize sprite;
@synthesize shadow;
@synthesize position;
@synthesize zoomPosition;
@synthesize vector;
@synthesize prevVector;
@synthesize prevPrevVector;
@synthesize z;
@synthesize zVector;

-(CGPoint) getSpritePosition {
    return sprite.position;
}

//
-(void) setSpritePosition:(CGPoint)pos
{
    self.sprite.position= ccp(pos.x, pos.y);
}

//
-(void) setShadowPosition:(CGPoint)pos
{
    self.shadow.position= ccp(pos.x, pos.y);
}

//
-(CGPoint) rotateVector:(CGPoint)vec Angle:(float)theta
{
    CGPoint newVec;
    float angle = -CC_RADIANS_TO_DEGREES( ccpToAngle(vec) );
    angle += theta;
    newVec = ccpForAngle(-CC_DEGREES_TO_RADIANS(angle));
    return newVec;
}

//
-(CGPoint) getVectorRotatedByRandomAngle:(CGPoint)originalVec :(int)range
{
    CGPoint randomVec;
    int randomAngle = [Util random:range];
    int length = ccpLength(originalVec);
    
    if([Util random:2] == 0)
    {
        randomVec = [self rotateVector:originalVec Angle:-randomAngle];
    }
    else
    {
        randomVec = [self rotateVector:originalVec Angle:randomAngle];
    }
    
    //    CCLOG(@">> Angle Range = %d, random angle (divided by 2) = %d, original Vec : %f, %f, final Vector : %f,%f",
    //          range, randomAngle, originalVec.x, originalVec.y, randomVec.x, randomVec.y);
    //    CCLOG(@">>>> Angle Range = %d, random angle (divided by 2) = %d, original Vec : %f, %f, final Vector : %f,%f",
    //          range, randomAngle, originalVec.x, originalVec.y, randomVec.x*length, randomVec.y*length);
    //
    //rotate functionnormalise the vector - return the new vector based on original vector length
    return ccpMult(randomVec,length);
}

//
-(CGPoint) rotateVectorKeepLength:(CGPoint)vec Angle:(float)theta
{
    CGPoint newVec;
    float angle = -CC_RADIANS_TO_DEGREES( ccpToAngle(vec) );
    angle += theta;
    newVec = ccpForAngle(-CC_DEGREES_TO_RADIANS(angle));
    return ccpMult(newVec, ccpLength(vec));;
}

-(int) getSpriteX {
    return sprite.position.x;
}

-(int) getSpriteY {
    return sprite.position.y;
}

-(int) getX {
    return position.x;
}

-(int) getY {
    return position.y;
}

-(void) draw {
    CCLOG(@">>> DO draw");
}



@end
