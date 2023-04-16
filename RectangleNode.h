//
//  RectangleNode.h
//  MatchDay
//
//  Created by Trevor Delves on 26/05/2013.
//
//

#import <Foundation/Foundation.h>

@interface RectangleNode : CCNode {
    CGPoint startPoint,endPoint;
    ccColor4F colour;
    int width;
    int height;
}

-(id)init: (CGPoint) p1 :(CGPoint) p2 :(ccColor4F) col;
-(void) draw;
//-(CGRect) myBoundingBox;
-(bool) isPointWithinRect :(CGPoint) pos;

@end
