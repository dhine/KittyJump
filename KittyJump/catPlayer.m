//
//  catPlayer.m
//  KittyJump
//
//  Created by David Hine on 3/19/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "catPlayer.h"

@implementation catPlayer

-(instancetype)init
{
    self = [super initWithImageNamed:@"mainCharacter.png"];
    self.name = mainPlayer;
    self.zPosition = 10;
    return self;
}

@end
