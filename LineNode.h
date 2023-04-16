//
//  CircleNode.h
//  mySoccer
//
//  Created by Trevor Delves on 23/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"


@interface LineNode : CCNode {
    
    CGPoint startPoint,endPoint;
    int colour;
}

@property (nonatomic, assign) int colorCode;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;


//-(id)init:(CGPoint) p1 : (CGPoint) p2;
-(id) init:(CGPoint) p1 : (CGPoint) p2 :(int) col;
-(id) init:(CGPoint) p1 : (CGPoint) p2;
-(id) init;

-(void) draw;
//-(void) addLine :(CGPoint) p1 :(CGPoint) p2;
//-(void) drawLines;

@end

