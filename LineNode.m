//
//  CircleNode.m
//  mySoccer
//
//  Created by Trevor Delves on 23/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LineNode.h"


@implementation LineNode

@synthesize colorCode;
@synthesize startPoint,endPoint;

NSMutableArray *linesStart;
NSMutableArray *linesEnd;

//CGPoint startPoint,endPoint;

-(id)init:(CGPoint) p1 : (CGPoint) p2 :(int) col {
    
    if( (self=[super init]) ) {
        //self.colorCode = color;
        
        // set up the geometry of this sprite
        // this is necessary so the sprite indicates it's body size
        // relative the center point (position)
//        CGSize size;
//        size.width = 2 * rad;
//        size.height = 2 * rad;
//        self.contentSize = size;
//        self.anchorPoint = ccp(0.5, 0.5);
        colour=col;
        startPoint=p1;
        endPoint=p2;
                
    }
    return self;
}


//
-(id)init:(CGPoint) p1 : (CGPoint) p2 {
    
    if( (self=[super init]) ) {
        startPoint=p1;
        endPoint=p2;        
    }
    return self;
}

-(id)init {
    
    self=[super init];
    return self;
}


-(void)draw {
    
    glLineWidth(3);
    
    
    //red
//    if (colour == 0) {
//        glColor4ub(255, 0, 0, 255);
//    }
//    // yellow
//    if (colour == 1) {
//        glColor4ub(255, 255, 0, 255);
//    }
//    // green
//    if (colour == 2) {
//        glColor4ub(0, 255, 0, 255);
//    }
    
    // glColor4ub(255, 0, 0, 255);
    
    // coordinates are relative to this sprites "position"
    // the draw primitives origin are in the lower left corner relative to the anchor point
    // so the center is "radius" pixels over and up on the x,y axis
    //CGPoint circleCenter = ccp(radius,radius);
    //ccDrawCircle( circleCenter, radius, 0, 30, NO);
    //COMMENTED
    
    //ccDrawLine(startPoint, endPoint);
    
   }

//
//-(void) addLine :(CGPoint) p1 :(CGPoint) p2
//{
//    [linesStart addObject:[NSValue valueWithCGPoint:CGPointMake(p1.x, p1.y)]];
//    [linesEnd addObject:[NSValue valueWithCGPoint:CGPointMake(p2.x, p2.y)]];
//}
//
////
//-(void) drawLines
//{
//    
//    int i=0;
//    int size=[linesStart count];
//    
//    NSLog(@"**Size = %d",size);
//    for (i=0; i<size; i++) {
//        NSValue *startVal = [linesStart objectAtIndex:i+1];
//        CGPoint startPoint = [startVal CGPointValue];
//        //
//        NSValue *endVal = [linesEnd objectAtIndex:i+1];
//        CGPoint endPoint = [endVal CGPointValue];
//        //
//        ccDrawLine(startPoint, endPoint);
//        
//        
//    }
//}
@end

