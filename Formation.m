//
//  Formation.m
//  mySoccer
//
//  Created by Trevor Delves on 09/01/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Formation.h"
#import "Player.h"




@implementation Formation

@synthesize leftBack;
@synthesize leftCenterBack;
@synthesize middleCenterBack;
@synthesize rightCenterBack;
@synthesize rightBack;

@synthesize leftMidfied;
@synthesize leftCenterMidfield;
@synthesize middleCenterMidfield;
@synthesize rightCenterMidfield;
@synthesize rightMidfield;

@synthesize leftStriker;
@synthesize leftCenterStriker;
@synthesize middleCenterStriker;
@synthesize rightCenterStriker;
@synthesize rightStriker;


int left = PITCH_LEFT+50; //20
int leftCenter = PITCH_LEFT+20+80; //60
int centerLeft = ((PITCH_RIGHT-PITCH_LEFT)/2)-80; //160; // 120
int center = (PITCH_RIGHT-PITCH_LEFT)/2;//240;
int centerRight = ((PITCH_RIGHT-PITCH_LEFT)/2)+80;; //345 //330 //360
int rightCenter = PITCH_RIGHT-20-80;
int right = PITCH_RIGHT-50;// 20 //460 ;
//
////
int top = 623; //640
int topLow = 537;
int middleHigh = 451;
int middle = 345 ;
int middleLow = 255;
int bottomHigh = 172; //original 172
int bottom = 116 ; //50 // 86

//
//int left = 20;
//int leftCenter = 90; //60
//int centerLeft = 160; // 120
//int center = 240;
//int centerRight = 320; //345 //330 //360
//int rightCenter = 420;
//int right = 460 ;

//
//int top = 603; //640
//int topLow = 517;
//int middleHigh = 431;
//int middle = 345 ;
//int middleLow = 255;
//int bottomHigh = 172; //original 172
//int bottom = 116 ; //50 // 86



-(id) init
{
    if( (self=[super init] )) {
        int defenceVerticalLevel = 15;
        
        int defensiveMidfieldVerticalLevel = 30;
        
        int midfieldVerticalLevel = 50;
        
        int strikerVerticalLevel = 75;
        
        //
        
  
        //
        leftBack = [[FormationPosition alloc] initWithDetails:10 :defenceVerticalLevel :0.1 :0.95 :0.1 :0.9];
        leftCenterBack = [[FormationPosition alloc] initWithDetails:35 :defenceVerticalLevel :0.1 :0.9 :0.2 :0.5];
        middleCenterBack = [[FormationPosition alloc] initWithDetails:50 :defenceVerticalLevel :0.1 :0.9 :0.2 :0.2];
        rightCenterBack = [[FormationPosition alloc] initWithDetails:65 :defenceVerticalLevel :0.1 :0.9 :0.5 :0.2];
        rightBack = [[FormationPosition alloc] initWithDetails:90 :defenceVerticalLevel :0.1 :0.95 :0.9 :0.1];

        leftMidfied = [[FormationPosition alloc] initWithDetails:10 :midfieldVerticalLevel :0.60 :0.40 :0.1 :0.9];
        leftCenterMidfield = [[FormationPosition alloc] initWithDetails:35 :midfieldVerticalLevel :0.60 :0.40 :0.2 :0.5];
        middleCenterMidfield = [[FormationPosition alloc] initWithDetails:50 :midfieldVerticalLevel :0.60 :0.40 :0.2 :0.2];
        rightCenterMidfield = [[FormationPosition alloc] initWithDetails:65 :midfieldVerticalLevel :0.60 :0.40 :0.5 :0.2];
        rightMidfield = [[FormationPosition alloc] initWithDetails:90 :midfieldVerticalLevel :0.60 :0.40 :0.9 :0.1];

        leftStriker = [[FormationPosition alloc] initWithDetails:10 :strikerVerticalLevel :0.90 :0.10 :0.2 :0.5];
        leftCenterStriker = [[FormationPosition alloc] initWithDetails:35 :strikerVerticalLevel :0.90 :0.10 :0.2 :0.5];
        middleCenterStriker = [[FormationPosition alloc] initWithDetails:50 :strikerVerticalLevel :0.90 :0.10 :0.2 :0.2];
        rightCenterStriker = [[FormationPosition alloc] initWithDetails:65 :strikerVerticalLevel :0.90 :0.10 :0.5 :0.2];
        rightStriker = [[FormationPosition alloc] initWithDetails:90 :strikerVerticalLevel :0.90 :0.10 :0.5 :0.2];
        
        
        //NSAssert(NO, @"Formation: Init not supported.");
        strikerRightPositions = [[NSMutableArray alloc] init];
        strikerCenterRightPositions = [[NSMutableArray alloc] init];
        strikerCenterPositions = [[NSMutableArray alloc] init];
        strikerCenterLeftPositions = [[NSMutableArray alloc] init];
        strikerLeftPositions = [[NSMutableArray alloc] init];
        
        strikerAttackingRightPositions = [[NSMutableArray alloc] init];
        strikerAttackingCenterRightPositions = [[NSMutableArray alloc] init];
        strikerAttackingCenterPositions = [[NSMutableArray alloc] init];
        strikerAttackingCenterLeftPositions = [[NSMutableArray alloc] init];
        strikerAttackingLeftPositions = [[NSMutableArray alloc] init];
        
        midfieldRightPositions = [[NSMutableArray alloc] init];
        midfieldCenterRightPositions = [[NSMutableArray alloc] init];
        midfieldCenterPositions = [[NSMutableArray alloc] init];
        midfieldCenterLeftPositions = [[NSMutableArray alloc] init];
        midfieldLeftPositions = [[NSMutableArray alloc] init];
        
        defenseRightPositions = [[NSMutableArray alloc] init];
        defenseCenterRightPositions = [[NSMutableArray alloc] init];
        defenseCenterPositions = [[NSMutableArray alloc] init];
        defenseCenterLeftPositions = [[NSMutableArray alloc] init];
        defenseLeftPositions = [[NSMutableArray alloc] init];
        
        lineUpPositionsFaceUp = [[NSMutableArray alloc] init];
        lineUpPositionsFaceDown = [[NSMutableArray alloc] init];
    }
    
	//[self release];
	return self;
}


// striker
-(NSMutableArray *)getStrikerRightPosition
{
    
    return strikerRightPositions;
}

-(NSMutableArray *)getStrikerCenterPosition
{
    return strikerCenterPositions;
}

-(NSMutableArray *)getStrikerLeftPosition
{
    return strikerLeftPositions;
}

-(NSMutableArray *)getStrikerCenterLeftPosition
{
    return strikerCenterLeftPositions;
}

-(NSMutableArray *)getStrikerCenterRightsPosition
{
    return strikerCenterRightPositions;
}


// striker attaking
-(NSMutableArray *)getStrikerAttackingRightPosition
{
    
    return strikerRightPositions;
}

-(NSMutableArray *)getStrikerAttackingCenterPosition
{
    return strikerCenterPositions;
}

-(NSMutableArray *)getStrikerAttackingLeftPosition
{
    return strikerLeftPositions;
}

-(NSMutableArray *)getStrikerAttackingCenterLeftPosition
{
    return strikerCenterLeftPositions;
}

-(NSMutableArray *)getStrikerAttackingCenterRightsPosition
{
    return strikerCenterRightPositions;
}

//midfield
-(NSMutableArray *)getMidfieldRightPosition
{
    return midfieldRightPositions;
}

-(NSMutableArray *)getMidfieldCenterRightPosition
{
    return midfieldCenterRightPositions;
}

-(NSMutableArray *)getMidfieldCenterPosition
{
    return midfieldCenterPositions;
}

-(NSMutableArray *)getMidfieldCenterLeftPosition
{
    return midfieldCenterLeftPositions;
}

-(NSMutableArray *)getMidfieldLeftPosition
{
    return midfieldLeftPositions;
}

//defense
-(NSMutableArray *)getDefenseRightPosition
{
    return defenseRightPositions;
}

-(NSMutableArray *)getDefenseCenterRightPosition
{
    return defenseCenterRightPositions;
}

-(NSMutableArray *)getDefenseCenterPosition
{
    return defenseCenterPositions;
}

-(NSMutableArray *)getDefenseCenterLeftPosition
{
    return defenseCenterLeftPositions;
}

-(NSMutableArray *)getDefenseLeftPosition
{
    return defenseLeftPositions;
}

-(NSMutableArray *)getLineupPositionsFacingUp
{
    return lineUpPositionsFaceUp;
}

-(NSMutableArray *)getLineupPositionsFacingDown
{
    return lineUpPositionsFaceDown;
}

//-(NSMutableArray *)getLineupPositionsFacingUp433
//{
//    return lineUpPositionsFaceUp;
//}
//
//-(NSMutableArray *)getLineupPositionsFacingDown433
//{
//    return lineUpPositionsFaceDown;
//}

-(void) setLineupPositionsFacingUp
{
    [lineUpPositionsFaceUp removeAllObjects];
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottom)]]; // right def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottom)]]; // left def

    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleLow)]]; // right mid    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleLow)]]; // left mid

    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight+25,middle-90)]]; // left att
    
    
}

-(void) setLineupPositionsFacingDown
{
    [lineUpPositionsFaceDown removeAllObjects];
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]]; // right def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]]; // right def

    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow-90)]]; // right mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow-90)]]; // left mid
    
    
    // [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center,middle)]]; // center att
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft-10,middle+90)]]; // left att
}

//433
-(void) setLineupPositionsFacingUp433
{
    [lineUpPositionsFaceUp removeAllObjects];
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottom)]]; // right def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottom)]]; // left def
    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleLow)]]; // right mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleLow)]]; // center mid
    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(left,middle-90)]]; // left mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(right,middle-90)]]; // left att
}

-(void) setLineupPositionsFacingDown433
{
    [lineUpPositionsFaceDown removeAllObjects];
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]]; // right def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]]; // left def
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow-90)]]; // right mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow-90)]]; // center mid
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(right,middle+90)]]; // left mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(left+25,middle+90)]]; // left att
}


// 424
-(void) setLineupPositionsFacingUp424
{
    [lineUpPositionsFaceUp removeAllObjects];
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottom)]]; // right def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottom)]]; // left def
    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]]; // right mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]]; // center mid
    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(left,middle-90)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft-80,middle-90)]]; // left mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(right,middle-90)]]; // left att
}

-(void) setLineupPositionsFacingDown424
{
    [lineUpPositionsFaceDown removeAllObjects];
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]]; // right def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]]; // left def
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow-90)]]; // right mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow-90)]]; // center mid
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(right,middle+90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight-80,middle+90)]]; // left mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(left,middle+90)]]; // left att
}

// 343
-(void) setLineupPositionsFacingUp343
{
    [lineUpPositionsFaceUp removeAllObjects];
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; // left def
    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleLow)]]; // right mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleLow)]]; // left mid

    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(left,middle-90)]]; // left mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(right,middle-90)]]; // left att
}

-(void) setLineupPositionsFacingDown343
{
    [lineUpPositionsFaceDown removeAllObjects];
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]]; // left def
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow-90)]]; // right mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow-90)]]; // left mid
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(right,middle+90)]]; // left mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(left,middle+90)]]; // left att
}

//451
-(void) setLineupPositionsFacingUp451
{
    [lineUpPositionsFaceUp removeAllObjects];
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottom)]]; // right def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; // center def
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottom)]]; // left def
    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleLow)]]; // right mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]]; // center mid
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleLow)]]; // left mid
    
    
    [lineUpPositionsFaceUp addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
    }

-(void) setLineupPositionsFacingDown451
{
    [lineUpPositionsFaceDown removeAllObjects];
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]]; // right def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]]; // center def
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]]; // left def
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow-90)]]; // right mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow-90)]]; // center mid
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow-90)]]; // left mid
    
    [lineUpPositionsFaceDown addObject: [NSValue valueWithCGPoint:CGPointMake(center-90,middle)]]; // right att
}





-(void) setPositions
{
    //    int x = 86;
    //    int x2 = 175;
    //    int y = 80;
    //    int y2 =160;
    //
    //    int left = 0;
    //    int leftCenter = 80;
    //    int centerLeft = 160;
    //    int center = 240;
    //    int centerRight = 320;
    //    int rightCenter = 400;
    //    int right = 480 ;
    //
    ////    int left = 0;
    ////    int leftCenter = 450;
    ////    int centerLeft = 450;
    ////    int center = 450;
    ////    int centerRight = 450;
    ////    int rightCenter = 450;
    ////    int right = x*6 ;
    //
    //
    ////    int left = 0;
    ////    int leftCenter = 54;
    ////    int centerLeft = 108;
    ////    int center = 160;
    ////    int centerRight = 216;
    ////    int rightCenter = 270;
    ////    int right = x*6 ;
    //
    //
    //    int top = 603;
    //    int topLow = 517;
    //    int middleHigh = 431;
    //    int middle = 345 ;
    //    int middleLow = 255;
    //    int bottomHigh = 172;
    //    int bottom = 86 ;
    
    printf("\n*** Formations set...");
    
    /// NSMutableArray *strikerRightPositions = [[NSMutableArray alloc] init];
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];   //1
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];    //2
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,top)]];   //3
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]];  //4
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]];   //5
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow)]];  //6
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleHigh)]]; //7
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleHigh)]];  //8
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middleHigh)]]; //9
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middle)]]; //10
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middle)]]; //11
    //    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middle)]]; //12
    
    // Striker Center Right
    /// NSMutableArray *strikerRightPositions = [[NSMutableArray alloc] init];
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];   //1
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];    //2
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];   //3
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];  //4
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];   //5
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];  //6
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //7
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]];  //8
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //9
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //10
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //11
    [strikerCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //12
    
    // STriker Center Left
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];   //1
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];    //2
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];   //3
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]];  //4
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]];   //5
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]];  //6
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //7
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]];  //8
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //9
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //10
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //11
    [strikerCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //12
    
    
    // Striker Right Positions
    /// NSMutableArray *strikerRightPositions = [[NSMutableArray alloc] init];
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,top)]];   //1
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];    //2
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];   //3
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,topLow)]];  //4
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]];   //5
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]];  //6
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,topLow)]]; //7
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]];  //8
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //9
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,topLow)]]; //10
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //11
    [strikerRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //12
    
    
    // NSMutableArray *strikerCenterPositions = [[NSMutableArray alloc] init];
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];   //1
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,top)]];    //2
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];   //3
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]];  //4
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow)]];   //5
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]];  //6
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //7
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow)]];  //8
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //9
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //10
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow)]]; //11
    [strikerCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //12
    
    // NSMutableArray *strikerLeftPositions = [[NSMutableArray alloc] init];
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];   //1
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];    //2
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,top)]];   //3
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]];  //4
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]];   //5
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,topLow)]];  //6
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //7
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //8
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,topLow)]]; //9
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //10
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //11
    [strikerLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,topLow)]]; //12
    
    // STriker High
    // Striker Center Right
    /// NSMutableArray *strikerRightPositions = [[NSMutableArray alloc] init];
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];   //1
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];    //2
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];   //3
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];  //4
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];   //5
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];  //6
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //7
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]];  //8
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //9
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //10
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //11
    [strikerAttackingCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //12
    
    // STriker Center Left
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];   //1
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];    //2
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];   //3
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];  //4
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];   //5
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];  //6
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]]; //7
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]];  //8
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //9
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //10
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //11
    [strikerAttackingCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //12
    
    
    // Striker Right Positions
    /// NSMutableArray *strikerRightPositions = [[NSMutableArray alloc] init];
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,top)]];   //1
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];    //2
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];   //3
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,top)]];  //4
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];   //5
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,top)]];  //6
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,top)]]; //7
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]];  //8
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //9
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,topLow)]]; //10
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //11
    [strikerAttackingRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,topLow)]]; //12
    
    
    // NSMutableArray *strikerCenterPositions = [[NSMutableArray alloc] init];
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];   //1
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,top)]];    //2
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];   //3
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];  //4
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,top)]];   //5
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,top)]];  //6
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]]; //7
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow)]];  //8
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //9
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,topLow)]]; //10
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow)]]; //11
    [strikerAttackingCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]]; //12
    
    // NSMutableArray *strikerLeftPositions = [[NSMutableArray alloc] init];
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];   //1
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];    //2
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,top)]];   //3
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];  //4
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,top)]];   //5
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,top)]];  //6
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //7
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //8
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,topLow)]]; //9
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //10
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,topLow)]]; //11
    [strikerAttackingLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,topLow)]]; //12
    
    
    //// Midfield
    
    // right
    // NSMutableArray *midfieldRightPositions = [[NSMutableArray alloc] init];
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,middleHigh)]];   //1
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleHigh)]];    //2
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleHigh)]];   //3
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,middleHigh)]];  //4
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleHigh)]];   //5
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleHigh)]];  //6
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,middle)]]; //7
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middle)]];  //8
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middle)]]; //9
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,middleLow)]];  //10
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleLow)]];   //11
    [midfieldRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleLow)]];  //12
    
    // center right
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleHigh)]];   //1
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleHigh)]];    //2
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleHigh)]];   //3
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleHigh)]];  //4
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleHigh)]];   //5
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleHigh)]];  //6
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middle)]]; //7
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middle)]];  //8
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middle)]]; //9
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,middleLow)]];  //10
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]];   //11
    [midfieldCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]];  //12
    
    
    // NSMutableArray *midfieldCenterPositions = [[NSMutableArray alloc] init];
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,top)]];   //1
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,topLow)]];    //2
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,topLow)]];   //3
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleHigh)]];  //4
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middleHigh)]];   //5
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleHigh)]];  //6
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middle)]]; //7
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middle)]];  //8
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middle)]]; //9
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]];  //10
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middleLow)]];   //11
    //    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]];  //12
    
    // NSMutableArray *midfieldCenterPositions = [[NSMutableArray alloc] init];
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middle)]];   //1
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middle)]];    //2
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middle)]];   //3
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middle)]];  //4
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middle)]];   //5
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middle)]];  //6
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]]; //7
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middleLow)]];  //8
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]]; //9
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,middleLow)]];  //10
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,middleLow)]];   //11
    [midfieldCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]];  //12
    
    
    // center left
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleHigh)]];   //1
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleHigh)]];    //2
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleHigh)]];   //3
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleHigh)]];  //4
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleHigh)]];   //5
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleHigh)]];  //6
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middle)]]; //7
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middle)]];  //8
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middle)]]; //9
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleLow)]];  //10
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]];   //11
    [midfieldCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,middleLow)]];  //12
    
    
    
    // NSMutableArray *midfieldLeftPositions = [[NSMutableArray alloc] init];
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleHigh)]];   //1
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleHigh)]];    //2
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,middleHigh)]];   //3
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleHigh)]];  //4
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleHigh)]];   //5
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,middleHigh)]];  //6
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middle)]]; //7
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middle)]];  //8
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,middle)]]; //9
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleLow)]];  //10
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,middleLow)]];   //11
    [midfieldLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,middleLow)]];  //12
    
    // Defense
    //
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,bottomHigh)]];   //1
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottomHigh)]];    //2
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottomHigh)]];   //3
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,bottomHigh)]];   //4
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottomHigh)]];   //5
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottomHigh)]];  //6
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,bottomHigh)]]; //7
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottomHigh)]]; //8
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottomHigh)]]; //9
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(right,bottom)]]; //10
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottom)]]; //11
    [defenseRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(rightCenter,bottom)]]; //12
    
    
    // Center Right
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]];   //1
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]];    //2
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]];   //3
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]];   //4
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]];   //5
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]];  //6
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]]; //7
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]]; //8
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottomHigh)]]; //9
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; //10
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; //11
    [defenseCenterRightPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerRight,bottom)]]; //12
    
    // NSMutableArray *defenseRightPositions = [[NSMutableArray alloc] init];
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]];   //1
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]];    //2
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]];   //3
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]];   //4
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]];   //5
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]];  //6
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]]; //7
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]]; //8
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottomHigh)]]; //9
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottom)]]; //10
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottom)]]; //11
    [defenseCenterPositions addObject: [NSValue valueWithCGPoint:CGPointMake(center,bottom)]]; //12
    
    // Center Left
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]];   //1
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]];    //2
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]];   //3
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]];   //4
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]];   //5
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]];  //6
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]]; //7
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]]; //8
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottomHigh)]]; //9
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; //10
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; //11
    [defenseCenterLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(centerLeft,bottom)]]; //12
    
    
    //  NSMutableArray *defenseLeftPositions = [[NSMutableArray alloc] init];
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottomHigh)]];   //1
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottomHigh)]];    //2
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,bottomHigh)]];   //3
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottomHigh)]];   //4
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottomHigh)]];   //5
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,bottomHigh)]];  //6
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottomHigh)]]; //7
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottomHigh)]]; //8
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,bottomHigh)]]; //9
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottom)]]; //10
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(leftCenter,bottom)]]; //11
    [defenseLeftPositions addObject: [NSValue valueWithCGPoint:CGPointMake(left,bottom)]]; //12
    
    
    printf("\n*** Formations set complete...");
    
    
}

+(int) getReverseZone:(CGPoint)pos
{
    int gapWidth=160;
    int gapLength=175;
    int zone=0;
    int x =pos.x;
    int y =pos.y;
    
    if (x >= gapWidth*2)
    {
        if (y>gapLength*3)
        {
            zone=12;
        }
        else if(y>gapLength*2)
        {
            zone=9;
        }
        else if(y>gapLength*1)
        {
            zone=6;
        }
        else if(y>0)
        {
            zone=3;
        }
    }
    else if (x >= gapWidth)
    {
        if (y>gapLength*3)
        {
            zone=11;
        }
        else if(y>gapLength*2)
        {
            zone=8;
        }
        else if(y>gapLength*1)
        {
            zone=5;
        }
        else if(y>0)
        {
            zone=2;
        }
    }
    else if (x >= 0)
    {
        if (y>gapLength*3)
        {
            zone=10;
        }
        else if(y>gapLength*2)
        {
            zone=7;
        }
        else if(y>gapLength*1)
        {
            zone=4;
        }
        else if(y>0)
        {
            zone=1;
        }
    }
    
    // subtract 1, so correct index is returned from array
    return zone-1;
    
}

+(int) getZone:(CGPoint)pos
{
    int gapWidth=170;  //160
    int gapLength=185; //175
    int zone=0;
    int x =pos.x;
    int y =pos.y;
    
    if (x >= gapWidth*2)
    {
        if (y>gapLength*3)
        {
            zone=1;
        }
        else if(y>gapLength*2)
        {
            zone=4;
        }
        else if(y>gapLength*1)
        {
            zone=7;
        }
        else if(y>0)
        {
            zone=10;
        }
        else {
            zone =10;
        }
    }
    else if (x >= gapWidth)
    {
        if (y>gapLength*3)
        {
            zone=2;
        }
        else if(y>gapLength*2)
        {
            zone=5;
        }
        else if(y>gapLength*1)
        {
            zone=8;
        }
        else if(y>0)
        {
            zone=11;
        }
        else {
            zone=11;
        }
    }
    else if (x >= 0)
    {
        if (y>gapLength*3)
        {
            zone=3;
        }
        else if(y>gapLength*2)
        {
            zone=6;
        }
        else if(y>gapLength*1)
        {
            zone=9;
        }
        else if(y>0)
        {
            zone=12;
        }
        else {
            zone=12;
        }
    }
    
    // subtract 1, so correct index is returned from array
    return zone-1;
    
}

@end
