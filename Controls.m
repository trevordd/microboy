//
//  Controls.m
//  mySoccer
//
//  Created by Trevor Delves on 08/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Controls.h"


@implementation Controls

static Controls *controlsManager = nil;

+ (Controls*)sharedControlsManager
{
    if (controlsManager == nil) {
        controlsManager = [[super alloc] init];
    }
    return controlsManager;
}

-(id) init
{
    if( (self=[super init] )){
        NSLog(@"Initialising Controls");
    }
    
	return self;
}


+ (id)alloc
{
    return [self sharedControlsManager];
}

@end
