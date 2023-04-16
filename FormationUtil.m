//
//  FormationUtil.m
//  MicroSoccer5
//
//  Created by Trevor Delves on 16/12/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "FormationUtil.h"

@implementation FormationUtil

-(id) init
{
    if( (self=[super init] )) {
    }
    
    return self;
}

+(CGPoint) getPitchPositionPercentage :(CGPoint) pos {
    //
    float xPerc=0;
    float yPerc=0;
    
    // y
    if (pos.y >= PITCH_TOP) {
        yPerc=100;
    } else if(pos.y <= PITCH_BOTTOM) {
        yPerc=0;
    } else {
        yPerc = ((pos.y-PITCH_BOTTOM) / PITCH_HEIGHT) * 100;
    }
    
    
    // x
    if (pos.x >= PITCH_RIGHT) {
    } else if(pos.x<=PITCH_LEFT) {
        pos.x=0;
    } else {
        xPerc = ((pos.x-PITCH_LEFT) / PITCH_WIDTH) * 100; //TODO check for 0 division
    }
    
   //NSLog(@"Original Position on Pitch x,y : %f,%f",xPerc*[FormationUtil getPitchXPosPerPercentage],yPerc*[FormationUtil getPitchYPosPerPercentage]);
   //NSLog(@"Original Position on Pitch (as Percentage) x,y : %f,%f",xPerc,yPerc);

    return CGPointMake(xPerc, yPerc);
}


+(float) getPitchXPosPerPercentage  {
    float xPosPerPerc=(float)((PITCH_RIGHT-PITCH_LEFT)/100);
    return xPosPerPerc;
}

+(float) getPitchYPosPerPercentage  {
    float yPosPerPerc=(float)((PITCH_TOP-PITCH_BOTTOM)/100);
    return yPosPerPerc;
}


+(CGPoint) getPlayerPitchPosition :(CGPoint) percentagePos :(FormationPosition *)formationPos {
    
    float xPercentageGap=0;
    float yPercentageGap=0;
    
    // get x,y gap
    xPercentageGap = percentagePos.x - formationPos.startPositionPercentage.x;
    yPercentageGap = percentagePos.y - formationPos.startPositionPercentage.y;
    
    
    //NSLog(@" Gap (as Percentage) x,y : %f,%f",xPercentageGap,yPercentageGap);

    
    // use gap value to caluclate target position
    float xTargetPercentageGap = 0;
    float yTargetPercentageGap = 0;
    float xTargetPosition = 0;
    float yTargetPosition = 0;
    
//   / NSLog(@">>*** Formation ahead perc : %f",formationPos.aheadHorizPerc);
    
    if ( xPercentageGap >= 0) {
        // if past position ( to the right)
        xTargetPercentageGap = xPercentageGap * formationPos.horizontalPercAhead;
    } else {
        // (to the left)
        xTargetPercentageGap = xPercentageGap * formationPos.horizontalPercBehind;
    }
    xTargetPosition=formationPos.startPositionPercentage.x+xTargetPercentageGap;

    
    if ( yPercentageGap >= 0) {
        // if past position ( ahead)
        yTargetPercentageGap = yPercentageGap * formationPos.verticalPercAhead;

    } else {
        // (behind)
        yTargetPercentageGap = yPercentageGap * formationPos.verticalPercBehind;
    }
    yTargetPosition=formationPos.startPositionPercentage.y+yTargetPercentageGap;

    
    //NSLog(@" New Position Percentage Gap x,y : %f,%f",xTargetPercentageGap,yTargetPercentageGap);
    //NSLog(@" New Position on Pitch (as Percentage) x,y : %f,%f",xTargetPosition,yTargetPosition);


    // calculate real position
    
    float playerXPos = (xTargetPosition * [FormationUtil getPitchXPosPerPercentage]);
    float playerYPos = (yTargetPosition * [FormationUtil getPitchYPosPerPercentage]);

    //NSLog(@"\n----------------------\n Real Position x,y : %f,%f\n",playerXPos,playerYPos);
    
    return CGPointMake(playerXPos, playerYPos);
    
}



+(CGPoint) getPlayerPitchPositionInversed :(CGPoint) percentagePos :(FormationPosition *)formationPos {
    
    float xPercentageGap=0;
    float yPercentageGap=0;
    
    // get x,y gap
    xPercentageGap = (100 - percentagePos.x) - formationPos.startPositionPercentage.x;
    yPercentageGap = (100 - percentagePos.y) - formationPos.startPositionPercentage.y;
    
    
    //NSLog(@" Gap (as Percentage) x,y : %f,%f",xPercentageGap,yPercentageGap);
    
    
    // use gap value to caluclate target position
    float xTargetPercentageGap = 0;
    float yTargetPercentageGap = 0;
    float xTargetPosition = 0;
    float yTargetPosition = 0;
    
    //   / NSLog(@">>*** Formation ahead perc : %f",formationPos.aheadHorizPerc);
    
    if ( xPercentageGap >= 0) {
        // if past position ( to the right)
        xTargetPercentageGap = xPercentageGap * formationPos.horizontalPercAhead;
    } else {
        // (to the left)
        xTargetPercentageGap = xPercentageGap * formationPos.horizontalPercBehind;
    }
    xTargetPosition=formationPos.startPositionPercentage.x+xTargetPercentageGap;
    
    
    if ( yPercentageGap >= 0) {
        // if past position ( ahead)
        yTargetPercentageGap = yPercentageGap * formationPos.verticalPercAhead;
        
    } else {
        // (behind)
        yTargetPercentageGap = yPercentageGap * formationPos.verticalPercBehind;
    }
    yTargetPosition=formationPos.startPositionPercentage.y+yTargetPercentageGap;
    
    
    //NSLog(@" New Position Percentage Gap x,y : %f,%f",xTargetPercentageGap,yTargetPercentageGap);
    //NSLog(@" New Position on Pitch (as Percentage) x,y : %f,%f",xTargetPosition,yTargetPosition);
    
    
    // calculate real position
    
    float playerXPos = (xTargetPosition * [FormationUtil getPitchXPosPerPercentage]);
    float playerYPos = (yTargetPosition * [FormationUtil getPitchYPosPerPercentage]);
    
    //NSLog(@"\n----------------------\n Real Position x,y : %f,%f\n",playerXPos,playerYPos);
    
    return CGPointMake(PITCH_RIGHT-playerXPos, PITCH_TOP-playerYPos);
    
}



@end
