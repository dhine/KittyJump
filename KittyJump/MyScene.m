//
//  MyScene.m
//  KittyJump
//
//  Created by David Hine on 3/17/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "MyScene.h"
#import "catPlayer.h"
@implementation MyScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        self.currentBackground = [Background generateNewBackground];
        [self addChild:self.currentBackground];
        
        catPlayer *player = [[catPlayer alloc] init];
        player.position = CGPointMake(120, 65);
        [self addChild:player];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKAction *jumpUp = [SKAction moveBy:CGVectorMake(0, 100) duration:0.5];
    SKAction *fallDown = [SKAction moveBy:CGVectorMake(0, -100) duration:0.3];
    
    SKAction *superJumpUp = [SKAction moveBy:CGVectorMake(0, 50) duration:0.5];
    SKAction *superFallDown = [SKAction moveBy:CGVectorMake(0, -150) duration:0.6];
    
    SKAction *jumpSequence = [SKAction sequence:@[jumpUp,fallDown]];
    catPlayer *player = (catPlayer *) [self childNodeWithName:mainPlayer];
    
    [player runAction:jumpSequence];
    
}
-(void)update:(NSTimeInterval)currentTime {
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) {
        timeSinceLast = 1.0 / 60.0;
    }
    
    [self enumerateChildNodesWithName:backgroundName usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - backgroundMoveSpeed * timeSinceLast, node.position.y);
    if (node.position.x < -(node.frame.size.width + 100)) {
        [node removeFromParent];
    }}];
    if (self.currentBackground.position.x < -500) {
        Background *temp = [Background generateNewBackground];
        temp.position = CGPointMake(self.currentBackground.position.x + self.currentBackground.frame.size.width, 0);
        [self addChild:temp];
        self.currentBackground = temp;
    }
}

@end
