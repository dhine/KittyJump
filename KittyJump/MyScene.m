//
//  MyScene.m
//  KittyJump
//
//  Created by David Hine on 3/17/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "MyScene.h"
@implementation MyScene

//initialize nodes in scene
-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        self.currentBackground = [Background generateNewBackground];
        [self addChild:self.currentBackground];
        self.physicsWorld.contactDelegate = self;
        
        self.player = [[catPlayer alloc] init];
        self.player.position = CGPointMake(120, 65);
        [self addChild:self.player];
        
        self.physicsWorld.gravity = CGVectorMake(0, globalGravity);
        
       
    }
    return self;
}

-(void)tappedScreen
{
    
    [self.player doJump:self.player.playerState];
}

-(void)createEnemy
{
    carEnemy *theBadGuy = [[carEnemy alloc] init];
    theBadGuy.position = CGPointMake(520,65);
    [self addChild:theBadGuy];
    
}

-(void) didMoveToView:(SKView *)view
{
    if (self.player != nil){
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedScreen)];
    [view addGestureRecognizer:tap];
    }
}

//Called each Clock Cycle
-(void)update:(NSTimeInterval)currentTime {
    
    //Find out time since last update and assign current frame (Runs at 60 FPS)
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    //60 FPS
    if (timeSinceLast > 1) {
        timeSinceLast = 1.0 / 60.0;
    }
    //Infinite Background
    
        //Move background's "X" position by "backgroundmovespeed" each frame
    [self enumerateChildNodesWithName:backgroundName usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - backgroundMoveSpeed * timeSinceLast, node.position.y);
        //If Background is off screen, remove from scene
    if (node.position.x < -(node.frame.size.width + 100)) {
        [self createEnemy];
        [node removeFromParent];
    }}];
        //When background goes on screen by entire width of background...generate new backgroung (previous block removes old background)
    if (self.currentBackground.position.x < -400) {
        //Generate new background off screen
        Background *temp = [Background generateNewBackground];
        //when on screen...add to screen
        temp.position = CGPointMake(self.currentBackground.position.x + self.currentBackground.frame.size.width - 5, 0);
        [self addChild:temp];
        self.currentBackground = temp;
    }
    
    [self enumerateChildNodesWithName:redCarEnemy usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - backgroundMoveSpeed * timeSinceLast, node.position.y);
        if (node.position.x < -20) {
            [node removeFromParent];
        }
    }];
    
}
-(void)didBeginContact:(SKPhysicsContact *)contact {
    
    SKPhysicsBody * notThePlayer;
    
    //find out which body is not the player
    if (contact.bodyB.categoryBitMask != playerCategory) {
        notThePlayer = contact.bodyB;
    } else {
        notThePlayer = contact.bodyA;
    }
    //If player hits background element...set state to Running
    if (notThePlayer.categoryBitMask == backgroundCategory)
    {
        self.player.playerState = playerStateRunning;
    }
    
    if (notThePlayer.categoryBitMask == enemyCategory)
    {
        GameOverScene * gameOver = [GameOverScene sceneWithSize:self.size];
        [self.view presentScene:gameOver transition:[SKTransition doorsCloseHorizontalWithDuration:1.0]];
    }
}
@end
