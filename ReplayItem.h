//
//  ReplayItem.h
//  MatchDay
//
//  Created by Trevor Delves on 17/03/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ReplayItem : NSObject {
    int frame;
    NSString* frameName;
    CGFloat spriteRotation;
    CGPoint position;           //shadow
    int height;
    CGFloat scale;
    long zOrder;
}

@property (nonatomic) int frame;
@property (strong, nonatomic) NSString* frameName;
@property (nonatomic) CGFloat spriteRotation;
@property (nonatomic) CGPoint position;
//@property (nonatomic, assign) CGPoint position;

@property (nonatomic) int height;
@property (nonatomic) CGFloat scale;
@property (nonatomic) long zOrder;

-(void) toString;


-(id) init;
@end
