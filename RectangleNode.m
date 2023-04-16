//
//  RectangleNode.m
//  MatchDay
//
//  Created by Trevor Delves on 26/05/2013.
//
//

#import "RectangleNode.h"

@implementation RectangleNode

-(id)init:(CGPoint) p1 : (CGPoint) p2 :(ccColor4F) col {
    
    if( (self=[super init]) ) {
        colour=col;
        startPoint=p1;
        endPoint=p2;
        width = p2.x-p1.x;
        height = p2.y-p1.y;
    }
    return self;
}

//
-(void)draw
{
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    //COMMENTED
    //ccDrawSolidRect(startPoint, endPoint, colour);
}

//
-(bool) isPointWithinRect :(CGPoint) pos
{
    return ((pos.x > startPoint.x && pos.x < (startPoint.x+width)) &&
            (pos.y > startPoint.y && pos.y < (startPoint.y+height)));
}

//
-(CGRect) boundingBox
{
    CCLOG(@">> %f,%f - %f,%f",startPoint.x, startPoint.y, endPoint.x, endPoint.y);
    return (CGRectMake (startPoint.x,startPoint.y,endPoint.x,endPoint.y));
}


@end
