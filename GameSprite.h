//
//  GameSprite.h
//  mySoccer
//
//  Created by Trevor Delves on 28/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Util.h"

@interface GameSprite : CCNode {
    CCSprite* sprite;
    CCSprite* shadow;
    CGPoint position;
    CGPoint zoomPosition;
    CGPoint vector;
    CGPoint prevVector;
    CGPoint prevPrevVector;
    
    CGFloat z;
    CGFloat zVector;
}

@property (strong, nonatomic) CCSprite *sprite;
@property (strong, nonatomic) CCSprite *shadow;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) CGPoint zoomPosition;
@property (nonatomic, assign) CGPoint vector;
@property (nonatomic, assign) CGPoint prevVector;
@property (nonatomic, assign) CGPoint prevPrevVector;
@property (nonatomic, assign) CGFloat z;
@property (nonatomic, assign) CGFloat zVector;


-(CGPoint) getSpritePosition;
//
-(CGPoint) getVectorRotatedByRandomAngle:(CGPoint)originalVec :(int)range;
-(CGPoint) rotateVector:(CGPoint)vec Angle:(float)theta;
-(CGPoint) rotateVectorKeepLength:(CGPoint)vec Angle:(float)theta;
-(void) setSpritePosition:(CGPoint)pos;
-(void) setShadowPosition:(CGPoint)pos;

-(int) getSpriteX;
-(int) getSpriteY;
-(int) getX;
-(int) getY;


@end
