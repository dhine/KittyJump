//
//  carEnemy.h
//  KittyJump
//
//  Created by David Hine on 4/17/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Common.h"
typedef enum enemyCarType {
    enemyCarPolice = 0,
    enemyCarBlue,
    enemyCarRed,
    enemyCarBrown
}enemyCarType;


@interface carEnemy : SKSpriteNode

@property (assign,nonatomic) enemyCarType carType;

@end
