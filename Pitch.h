//
//  Pitch.h
//  mySoccer
//
//  Created by Trevor Delves on 24/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Pitch : NSObject {

    #define GAME_TITLE "MICRO SOCCER" //"Kick'n'Go"
    #define MAX_TEAMS 15
    
    #define ALLOW_ANDROID_MANAGER_MODE
    
    // quick ending
    //#define DO_TEST_FINISH_QUICK_MATCH
    #define ALLOW_INGAME_ZOOM
    
    //#define REPLAY_BUTTONS_OPACITY 0.85f
    //#define REPLAY_PANEL_OPACITY 0.5f
    
    #define REPLAY_BUTTONS_OPACITY 0.85f
    #define REPLAY_PANEL_OPACITY 0.5f
    
    #define SHOW_HOARDINGS true
    
    //#define SHOW_ZOOM_BUTTONS
    
    //
    //#define SHOW_TEST_PLAYERS_SIDE_ANGLE
    //#define DISPLAY_GOAL_LINE_INTERSECTION
    //#define DRAW_PITCH
    #define SOUND_FX_ON
    #define SOUND_MUSIC_ON
    #define SOUND_MENU_MUSIC_ON
    
    // MUSIC
    #define MUSIC_PATH @"SoccerAudioKit/Music/"
    #define AMBIENCE_PATH @"SoccerAudioKit/Ambience/"
    
    #define FX_CROWD_PATH @"SoccerAudioKit/FX/Crowd/"
    #define FX_EVENT_PATH @"SoccerAudioKit/FX/Events/"
    #define FX_GAME_PATH @"SoccerAudioKit/FX/Game/"
    #define FX_MISC_PATH @"SoccerAudioKit/FX/Misc/"
    
    //MENU MUSIC
    #define ROAD_TO_BRAZIL MUSIC_PATH"RoadtoBrazil(SelectionMenu).mp3"
    #define PROFESSIONAL_ANTHEM MUSIC_PATH"AProfessionalAnthem(Menu).mp3"
    #define CHOOSE_TEAM MUSIC_PATH"ChooseyourTeam(SelectionMenu).mp3"
    #define STREET_SOCCER MUSIC_PATH"StreetSoccer(Menu).mp3"
  
    //
    #define STATS_LOVER MUSIC_PATH"StatsLover(SelectionMenu).mp3"
    #define LETS_PLAY MUSIC_PATH"LetsPlaySoccer(Menu).mp3"

    
    //CROWD/AMBIANCE
    #define STADIUM_CROWD1 AMBIENCE_PATH"StadiumAmbience1.mp3"
    #define STADIUM_CROWD2 AMBIENCE_PATH"FinalMatchAmbience.mp3"
    
    
//    #define CHANTS1 AMBIENCE_PATH"FanChants1.mp3"
//    #define CHANTS2 AMBIENCE_PATH"FanChants2.mp3"
//    #define CHANTS3 AMBIENCE_PATH"FanChants3.mp3"
//    #define CHANTS4 AMBIENCE_PATH"FanChants4.mp3"
//    #define CHANTS1 AMBIENCE_PATH"FanChants1.mp3"
//    #define CHANTS1 AMBIENCE_PATH"FanChants1.mp3"
//    #define CHANTS1 AMBIENCE_PATH"FanChants1.mp3"
    
    
    
    // FX/CROWD
    #define EXCITING_CROWD FX_CROWD_PATH"Crowd-exciting.mp3"
    #define KEEPER_SAVE1 FX_CROWD_PATH"Crowd-shotongoal1.mp3"
    #define KEEPER_SAVE2 FX_CROWD_PATH"Crowd-shotongoal2.mp3"
    
    #define BALL_OVER_BAR1 FX_CROWD_PATH"Crowd-shotongoal1.mp3"
    #define BALL_OVER_BAR2 FX_CROWD_PATH"Crowd-shotongoal2.mp3"
    
    #define SOFT_APPLAUSE FX_CROWD_PATH"Crowd-ovation2.mp3"
    #define STRONG_APPLAUSE FX_CROWD_PATH"Crowd-ovation1.mp3"
    
    
    #define CHANTS1 FX_CROWD_PATH"FanChants1.mp3"
    #define CHANTS2 FX_CROWD_PATH"FanChants2.mp3"
    #define CHANTS3 FX_CROWD_PATH"FanChants3.mp3"
    //#define CHANTS4 FX_CROWD_PATH"FanChants4.mp3"
    
    #define JEER1 FX_CROWD_PATH"Crowd-jeer2.mp3"
    #define BASSDRUM FX_CROWD_PATH"Crowd-bassdrum.mp3"
    #define HORN1 FX_CROWD_PATH"Horn1.mp3"
    #define HORN2 FX_CROWD_PATH"Horn2.mp3"
    
    // FX MISC
    #define BUTTON1 FX_MISC_PATH"Button1.mp3"
    #define BUTTON2 FX_MISC_PATH"Button2.mp3"
    #define BUTTON3 FX_MISC_PATH"Button3.mp3"
    #define BUTTON4 FX_MISC_PATH"Button4.mp3"
    #define BUTTON5 FX_MISC_PATH"Button5.mp3"
    #define BUTTON6 FX_MISC_PATH"Button6.mp3"
    
    
    //FX CROWD
    #define GOAL_SCORED1 FX_CROWD_PATH"Crowd-goal1.mp3"
    #define GOAL_SCORED2 FX_CROWD_PATH"Crowd-goal2.mp3"
    #define GOAL_SCORED3 FX_CROWD_PATH"Crowd-goal3.mp3"
    #define GOAL_SCORED4 FX_CROWD_PATH"Crowd-exciting.mp3"
    
    
    //FX GAME
    #define NET_1 FX_GAME_PATH"Net1.mp3"
    #define NET_2 FX_GAME_PATH"Net2.mp3"
    
    #define KICK1 FX_GAME_PATH"Kick1.mp3"
    #define KICK2 FX_GAME_PATH"Kick2.mp3"
    #define KICK3 FX_GAME_PATH"Kick3.mp3"
   
    #define PASS1 FX_GAME_PATH"Pass1.mp3"
    #define PASS2 FX_GAME_PATH"Pass2.mp3"
    #define PASS3 FX_GAME_PATH"Pass3.mp3"
    
    #define GOALPOST1 FX_GAME_PATH"Goalpost1.mp3"
    #define GOALPOST2 FX_GAME_PATH"Goalpost2.mp3"
    #define CROSSBAR FX_GAME_PATH"Crossbar.mp3"
    
    
    #define WHISTLE_KICK_OFF FX_GAME_PATH"Whistle-kickoff.mp3"
    #define WHISTLE_FINAL1 FX_GAME_PATH"Whistle-final1.mp3"
    #define WHISTLE_FINAL2 FX_GAME_PATH"Whistle-final2.mp3"
    
    #define SLIDE_CLEAN FX_GAME_PATH"Tackle-clean.mp3"
    #define SLIDE_DIRTY FX_GAME_PATH"Tackle-violent2.mp3"
    
    //FX MISC
    
    
    #define KEEPER_BALL_DIFFICULTY_ON
    #define DO_SLIDE_DIFFICULTY_ON
    
   
    #define NORMAL_PITCH         0
    #define LIGHT_PITCH          1
    #define DARK_PITCH           2
    #define EXTRA_DARK_PITCH     3
    ////
    // test
    

    //
    #define RANDOM_BALL_COLOUR_RANGE 7 // higher number = more chance of white
    #define BALL_COL_RANDOM  0
    #define BALL_COL_WHITE   1
    #define BALL_COL_YELLOW  2
    #define BALL_COL_ORANGE  3
    #define BALL_COL_BLUE    4
    #define BALL_COL_MAGENTA 5
    
    //
    #define MINS_IN_SECS        60
    #define MINS_1  (1*MINS_IN_SECS)
    #define MINS_2  (2*MINS_IN_SECS)
    #define MINS_3  (3*MINS_IN_SECS)
    #define MINS_4  (4*MINS_IN_SECS)
    #define MINS_5  (5*MINS_IN_SECS)
    #define MINS_7  (7*MINS_IN_SECS)
    
    #define EASY    1
    #define MEDIUM  2
    #define HARD    3
    
    #define PLAYER_SPEED_INCREASE_EASY 1.4
    #define PLAYER_SPEED_INCREASE_MEDIUM 1.7
    #define PLAYER_SPEED_INCREASE_HARD 1.9
    
    #define HUMAN_PLAYER_SPEED_INCREASE 1.4
    
    #define PERCENT_100     100.0
    
    #define EASY_SPEED_PERC     10
    #define MEDIUM_SPEED_PERC   0
    #define HARD_SPEED_PERC     10
    
    #define OVERALL_SPEED_INCREASE_PERC     40
    
    #define EASY_SHOT_PERC          20
    #define MEDIUM_SHOT_PERC        10
    #define HARD_SHOT_PERC          5 // negative
    
    #define KEEPER_HOLD_BALL_RATIO_MAX_10 5
    #define HUMAN_KEEPER_HOLD_BALL_RATIO_MAX_10 8
    
    #define KEEPER_DIFFICULTY_PERC  20
    #define SLIDE_DIFFICULTY_PERC  20
    
    #define EASY_STANDOFF_CHANCE    2      // 1 in 2
    #define MEDIUM_STANDOFF_CHANCE  3      // 1 in 3
    #define HARD_STANDOFF_CHANCE    4      // 1 in 4
  
    
    #define STANDOFF_TIME_BASE    100
    #define EASY_STANDOFF_TIME_RANGE    400     // 1 in 2
    #define MEDIUM_STANDOFF_TIME_RANGE  3// 1 in 3
    #define HARD_STANDOFF_TIME_RANGE    200      // 1 in 4
    

    
    
    
    //#define DRAW_PLAYER_TARGET_VECTORS
    //#define DRAW_PLAYER_FEELER_VECTORS
    //#define DRAW_KEEPER_BALL_SAVE_LINES
    #define DRAW_PASS_LINES


    //#define AVOID_TEAM_MATES
    
    //#define DO_GET_TARGET_POSITION_OFFSET
    //#define DO_PLAYERS_COLLISION
    //#define TURN_OFF_TEAM2
    //#define TURN_OFF_KEEPERS
    #define DO_AFTER_PASS_STAND_STILL //HUMAN
    #define DO_AFTER_PASS_STAND_STILL_COMP
    
    #define STOP_BALL_WHEN_PLAYER_STOPS
    #define AVOID_PASSES_TO_SURROUNDED_PLAYER


    #define DO_CONTROLS_AFTER_PASS_STAND_STILL
    
    #define TURN_OFF_BACKWARD_PASS
    //#define DO_DOUBLE_TAP_PASS
    //#define IGNORE_USER_CON
    //#define DO_HOLD_DOWN_PASS
    
    //#define DO_NO_STANDOFF_IN_DEFENSE_ZONE
    //#define DO_NO_STANDOFF_IN_MIDFIELD_ZONE
    #define STANDOFF_DISTANCE  15//50
    #define STANDOFF_DISTANCE_MAX  30//50
    
    
    #define RESTRICT_ACTIVATION_DISTANCE_OF_SECOND_PLAYERS
    #define RESTRICT_ACTIVATION_DISTANCE 35

    #define NO_PASS_IF_PLAYER_THROUGH_ON_GOAL
    
    //#define DO_PRE_PASS
    //#define DO_PRE_SHOT
    
    //#define DO_KEEPER_SAVE_REBOUND_ONLY
    //#define DO_SWIPE_CONTROLS
    #define DO_SWIPE_SHOT
    #define DO_VARIED_TARGET_VECTOR
    //#define DO_ALT_RUNCOLLIDE
    #define DO_FIRST_TOUCH
    //#define DO_RICOCHET
    #define DO_NON_STICKY_BALL
    //#define DO_PLAY_PASS_AHEAD
    //#define DO_PLAY_PASS_SLIGHTLY_AHEAD
    
    #define ALT_CONTROLS
    #define ONLY_PASS_IF_FOOT_HEIGHT
    #define ONLY_PASS_IF_NOT_TOOCLOSE_TOBODY
    #define DO_LOW_SHOTS
    //#define WING_PLAY_ON
    #define ALLOW_PASSTHROUGH_STICKY_BALL
    #define DO_POTENTIALLY_OBSTRUCTED_PASS

    
    #define SCREEN_X_CENTER 240
    #define SCREEN_Y_CENTER 160
    
    //
    #define STAY_STILL_AFTER_PASS_TIME 20 //30
    #define STAY_STILL_AFTER_PASS_TIME_COMP 15
    #define CONTROLS_STAY_STILL_AFTER_PASS_TIME 120
    
    //
    #define PITCH_IMAGE_WIDTH   550 // 485
    #define PITCH_IMAGE_HEIGHT  1000 // 1000  //768*1024
    
    //
    #define MAX_NUM_PREVIOUS_POSITIONS  30
    #define PREVIOUS_POSITION_OFFSET  02 //29
    
    //
    #define KEEPER_ID   1
    #define PLAYER1_ID  2
    #define PLAYER2_ID  3
    #define PLAYER3_ID  4
    #define PLAYER4_ID  5
    #define PLAYER5_ID  6
    #define PLAYER6_ID  7
    #define PLAYER7_ID  8
    #define PLAYER8_ID  9
    #define PLAYER9_ID  10
    #define PLAYER10_ID  11
    
    
    //
    #define UPDATE_INTERVAL (1.0f/60.0f)
    #define MAX_CYCLES_PER_FRAME 5
    
    //
    #define PLAYING_UP      0
    #define PLAYING_DOWN    1

    //
    #define KICKOFF_LINEUP_STRIKER_POS1  ccp(PITCH_X_CENTER-10, PITCH_Y_CENTER)
    #define KICKOFF_LINEUP_STRIKER_POS2  ccp(PITCH_X_CENTER+26, PITCH_Y_CENTER)
    
    // Regular proportions : Goal Width/Height 24ft/8ft : 3/1
    // Game proportions : 2:1
    // Goal Height / Player Height : 8/6 : 4:3
    // Body width/height ration 1/3
    
    // WHat it should be?
    // Goal Width       - 90
    // Goal Height      - 30
    // Player Height    - 23
    // Player Width     - 8
    
    // WHat it will be
    // Goal Width       - 90        - 90
    // Goal Height      - 40        - 45
    // Player Height    - 30        - 35
    // Player Width     - 10        - 15
    
    //
    #define LOWEST_VALID_PASS_RATE  5 // otherwise it affects the ai for avoidance
    
    #define LOWEST_PASS_RATE_BASE 9  // actually the highest pass rate
    #define MEDIUM_PASS_RATE_BASE 7
    #define HIGHEST_PASS_RATE_BASE 5
    
    
    #define EASY_PASS_RATE_RANGE 5
    #define MEDIUM_PASS_RATE_RANGE 4
    #define HARD_PASS_RATE_RANGE 3
    
    
    //
    #define MOVE_CAMERA_DISTANCE    15
    #define ADVANCE_PLAYER_CAMERA_DISTANCE    1.50
    #define ADVANCE_PLAYER_HAS_BALL_CAMERA_SPEED 2.0
    #define ADVANCE_BALL_CAMERA_SPEED 0.75
    
    
    
    //
    #define TEAM1       0
    #define TEAM2       1
    
    //
    #define PLAYER_SPRITE_SCALE   0.90
    #define KEEPER_UPDIVE_SPRITE_SCALE   0.90
    
    //
    #define PLAYER_HEIGHT   30//60
    #define PLAYER_WAIST_HEIGHT   PLAYER_HEIGHT/2
    #define PLAYER_WIDTH    15
    #define PLAYER_FOOT_HEIGHT   5 // 7
    #define KEEPER_HIGH_DIVE_HEIGHT   PLAYER_HEIGHT/2
    
    //
    #define RUNOUT_SPEED    150 //110
    #define RUNOUT_START_X  (PITCH_RIGHT+50)
    #define RUNOUT_START_Y  (PITCH_Y_CENTER)
    #define RUNOUT_X_GAP    20
    #define RUNOUT_Y_GAP    22
    #define RUNOUT_DIVERGE_X (PITCH_X_CENTER+250)
    #define RUNOUT_STAIRS_DIVERGE_X PITCH_RIGHT
    
    
    //
    #define KICKOFF_TIME    2
    #define RANDOM_KEEPER_HAS_BALL_TIME_BASE   50
    #define RANDOM_KEEPER_HAS_BALL_TIME_RANGE  150
    
    #define KEEPER_HAS_BALL_TIME    3
    #define KEEPER_PRACTICE_HAS_BALL_TIME    2
    #define BALL_OUT_OF_BOUNDS_TIME    2
    
    #define GOAL_CELEB_TIME         10
    #define GOAL_PRACTICE_CELEB_TIME     2
    
    
    #define HALFTIME_TIME 7
    #define HALFTIME_INFO_TIME 3
    
    
    //
    #define IS_BALL_COMING_TOWARDS_PLAYER_DISTANCE   30
    
    //
    
#if __CC_PLATFORM_ANDROID
    #define HIGH_PASS_BUTTOM_TIME_THRESHOLD     8
#else
    #define HIGH_PASS_BUTTOM_TIME_THRESHOLD     2
#endif

    // Pass heights
    #define LOW_PASS_HEIGHT 0.5
    #define MEDIUM_PASS_HEIGHT 1.0
    #define HIGH_PASS_HEIGHT 1.5
    #define MEDIUM_PASS_RANGE 250
    #define LONG_PASS_RANGE 300 //350
    
    #define BACKWARDS_MAX_PATH_LENGTH 85 //PITCH_WIDTH/2 //350
    #define BACKWARDS_CROSS_LENGTH 300
    
    
    // Shot Height
    #define SHOT_HEIGHT 4
    #define SHOT_HEIGHT_RANDOM_RANGE 2
    #define MAX_SWIPE_SHOT_HEIGHT   6
    #define MAX_SWIPE_SHOT_POWER    300 // 500
    
    
    // Cross Height
    #define CROSS_HEIGHT 5
    #define CROSS_HEIGHT_BASE 1
    #define CROSS_HEIGHT_RANGE 4


    // Gravity
    #define GRAVITY 6
    #define AIR_FRICTION            0.99
    #define NET_FRICTION            0.20
    #define GROUND_FRICTION         0.98 // 0.97
    #define BOUNCE_FACTOR           0.80
    #define GOALNET_BOUNCE_FACTOR   0.40

    // Buttons
    #define SHOT_BUTTON_DISTANCE_FROM_BOTTOM    135 //115
    #define PASS_BUTTON_DISTANCE_FROM_BOTTOM    50 //45
    
    #define SHOT_BUTTON_DISTANCE_FROM_SIDE    35
    #define PASS_BUTTON_DISTANCE_FROM_SIDE    55
    
    //
    #define SLIDE_SPEED             1.5
    #define HUMAN_SLIDE_SPEED       2.0
    
    
    // Match Length
    #define MATCH_LENGTH    6
    #define MATCH_HALF_LENGTH MATCH_LENGTH/2

    
    //
    #define JOYSTICK_DEADZONE_SIZE  6
    #define JOYSTICK_DISTANCE_FROM_CENTER 40.0
    #define JOYSTICK_CENTER_X   70
    #define JOYSTICK_CENTER_Y   67
    
    
    //
    #define KEEPER_DIVE_VECTOR  3.0     // 3.5
    
    //
    #define  GOAL_Z_ORDER_LEVEL 10
    #define  BALL_GOALSCORED_Z_ORDER_LEVEL 5
    #define  BALL_ABOVE_PLAYER_Z_ORDER_LEVEL 15 //20
    #define  BALL_ABOVE_GOAL_Z_ORDER_LEVEL 20

    #define  PLAYER_Z_ORDER_LEVEL 15    // BASE LEVEL
    #define  KEEPER_Z_ORDER_LEVEL 15
    
    //
    #define MOVE_TO_BALLS_ADVANCED_POSITION
    //#define DO_PLAYER_AUTO_ASSIST_MOVEMENT      // move player to ball automatically when he isnt usign the controls
    #define PARTIAL_ASSIST_DISTANCE    50
    #define BALL_OUT_OF_CONTROL_RANGE_DISTANCE 35
    #define DO_ATTACHED_BALL_RANGE_CHECK
    
    #define AUTO_CONTROLS_DELAY_TIME        60  // 60=1 second
    #define DISPLAY_PLAYER_ARROW_TIME_IN_SECS 3
    
    //
    #define PITCH_ZONE_SIZE 20
    
    #define PITCH_TOP       755 //729 //689  // 644
    #define PITCH_BOTTOM    -75 //-50 //-5 // 40
    #define PITCH_LEFT      -3 // -3
    #define PITCH_RIGHT     720 //665 //501
    #define PITCH_WIDTH     (PITCH_RIGHT-PITCH_LEFT)
    #define PITCH_HEIGHT     (PITCH_TOP-PITCH_BOTTOM)
    
    #define PITCH_EDGE_BOUNDARY_DEPTH   20  // 626
    
    #define PITCH_CAMERA_X_OFFSET    455 //437 // 368 //210
    #define PITCH_X_CENTER  (PITCH_RIGHT-PITCH_LEFT)/2 //240 //(PITCH_RIGHT-PITCH_LEFT)/2      //
    #define PITCH_Y_CENTER ((PITCH_TOP-PITCH_BOTTOM)/2)+PITCH_BOTTOM //340 // (PITCH_TOP-PITCH_TOP)/2     //

    #define ZOOM_X_SCROLL_OFFSET    275 // (PITCH_TOP-PITCH_TOP)/2     //

    
    //
    #define PLAYER_BALL_COLLISION_DIST  10.0 //7.0 //8.0
    #define HUMAN_PLAYER_BALL_COLLISION_DIST 15.0 //15.0
    #define HUMAN_PLAYER_BALL_COLLISION_DIST_FIRST_TOUCH 20
    #define KEEPER_BALL_COLLISION_DIST  6.0     //10.0 //8.0 //8.0 //12.0 //10.00
    #define KEEPER_BALL_INTERSECTION_COLLISION_DIST 25.0
    #define BALL_TOO_CLOSE_DISTANCE   4.0
    #define BALL_KEEPER_INTERSECTION_WIDTH   10.0 //14.0  // 14 // for intersction
    #define KEEPER_MOVE_TO_BALL_DISTANCE     75
    #define MAX_KEEPER_FROM_GOAL_DISTANCE    125 //150
    
    //
    #define OPP_PLAYERS_TOO_CLOSE_DISTANCE  30
    
    //
    #define TOP_GOAL_CENTER_POS ccp(PITCH_X_CENTER,PITCH_TOP)
    #define BOTTOM_GOAL_CENTER_POS ccp(PITCH_X_CENTER,PITCH_BOTTOM)
    
    //
    #define TOP_GOAL_CENTER_CROSS_POS ccp(PITCH_X_CENTER,PITCH_TOP-100)
    #define BOTTOM_GOAL_CENTER_CROSS_POS ccp(PITCH_X_CENTER,PITCH_BOTTOM+100)
    
    //
    #define GOALPOST_WIDTH   10 //7
    #define CROSSBAR_HEIGHT  20 //10
    
    //
    #define GOAL_HEIGHT     50  //45 //80
    #define GOAL_WIDTH      132 //136 //90
    #define GOAL_DEPTH      63 //50
    #define GOAL_PERSPECTIVE_Y_OFFSET   23 // 26 //23
    #define GOAL_PERSPECTIVE_Y_RATIO    GOAL_PERSPECTIVE_Y_OFFSET/GOAL_HEIGHT
    
    #define GOAL_AREA_WIDTH 300 //265
    #define GOAL_AREA_DEPTH 130 //90

    
    #define TOP_GOAL_BACKNET  (PITCH_TOP+GOAL_DEPTH)
    #define BOTTOM_GOAL_BACKNET  (PITCH_BOTTOM-GOAL_DEPTH)
    
    #define GOAL_LEFT_SIDENET  (PITCH_X_CENTER-(GOAL_WIDTH/2))
    #define GOAL_RIGHT_SIDENET  (PITCH_X_CENTER+(GOAL_WIDTH/2))
    
    #define KEEPER_TOP_LINE (PITCH_TOP - 10)
    #define KEEPER_BOTTOM_LINE (PITCH_BOTTOM + 10)
    
    #define SHOT_DISTANCE 100*100//200*200
    #define SHOT_DISTANCE_CLOSE 100*100//200*200
    #define SHOT_DISTANCE_MEDIUM 200*200//200*200
    #define SHOT_DISTANCE_FAR 300*300//250*250 //200*200
    
    #define SHOT_DISTANCE_MEDIUM_RATIO  20//10
    #define SHOT_DISTANCE_FAR_RATIO  30//50
    
    #define SHOT_BASE_STRENGTH 250
    #define SHOT_STRENGTH_RANGE 100
    
    
    //
    #define SLIDE_DISTANCE 80 //20
    #define DO_SLIDE_TIMER 60 //60
    #define CANT_SLIDE_TIMER 200 //300
    #define HUMAN_CANT_SLIDE_TIMER 50 //300
    
    //
    #define OVERRIDE_ACTIVE_PLAYER_TIME     120
    #define ACTIVE_PLAYER_SAME_DISTANCE_THRESHOLD   5
    
    //
    #define AVOID_PLAYER_ANGLE      10 //10
    #define AVOID_PLAYER_BIGGER_ANGLE      25 //25
    
    
    #define FEELER_LENGTH    50.0
    #define OPP_PLAYER_AHEAD_CHECK_DISTANCE     75.0  // 100
    #define DO_AVOID_PLAYER_WIDTH  30
    
    //
    #define PLAYER_ROTATION_ANGLE 10.0
    #define AVOID_ANY_PLAYER_ROTATION_ANGLE 10.0
    #define TURN_RIGHT -1
    #define TURN_LEFT 1
    #define NO_PLAYER_AHEAD 0
    
    //
    #define ACTIVE_PLAYER_SPRITE_ROTATION 10
    #define ACTIVE_TARGET_SPRITE_ROTATION 2
    
    
    //
    //#define PLAYER_MENU_FONT "MarkerFelt"
    #define PLAYER_MENU_FONT "Kiloton"
    #define MENU_FONT "KILOTON1.TTF"
    #define MENU_FONT_SIZE 16 //25 25
    #define MENU_TITLE_FONT_SIZE 26
    #define MATCH_INFO_FONT_SIZE 12
    #define MATCH_INFO_BIG_BUTTON_FONT_SIZE 14
    #define INFO_LABEL_FONT_SIZE 8
    
    #define GAME_INFO_TITLE_FONT_SIZE   20
    #define GAME_INFO_1_FONT_SIZE       20
    #define GAME_INFO_4_FONT_SIZE       20
    
    
    #define CHOOSE_TEAM_PLAYER_NAME_FONT_SIZE 12
    #define CHOOSE_TEAM_FONT_SIZE 14
    #define CHOOSE_TEAM_TITLE_FONT_SIZE 16
    #define CHOOSE_TEAM__TEAM_TITLE_FONT_SIZE 20
    #define CHOOSE_TEAM_FORMATION_NAME_FONT_SIZE 5 //6
    #define FORMATION_LABEL_FONT_SIZE 26
    
    #define NEXT_FORWARD_BUTTON_FONT_SIZE 16

    #define HELP_FONT_SIZE  12
    
    
    //
    #define BACK_BUTTON "BACK"
    #define FORWARD_BUTTON "NEXT"

    //
    #define ACTIVE_PLAYER_ORIGINAL_SCALE   0.4
    #define ACTIVE_PLAYER_POSSESION_SCALE   0.3
    
    #define ACTIVE_PLAYER_ORIGINAL_OPACITY  0.90
    #define ACTIVE_PLAYER_POSSESION_OPACITY 0.60
    
    #define TARGET_PLAYER_ORIGINAL_SCALE   0.4
    #define TARGET_PLAYER_ORIGINAL_OPACITY   0.95
    
    
   // #define MENU_BG @"splash3.png"
    //#define MENU_BG @"soccerBG5.jpg"
    #define MENU_BG @"menuBackground.png"
    
    
    #define MENU_BG_SCALE 0.5
    //#define MENU_BG @"pixelbackground.png"
    #define MENU_BG2
    #define MENU_BG_POS ccp(240,180)
    
    //
    #define BUTTON_WIDTH 40.0
    
    
}

@end
