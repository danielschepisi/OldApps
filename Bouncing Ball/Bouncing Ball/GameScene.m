//
//  GameScene.m
//  Bouncing Ball
//
//  Created by Daniel Schepisi on 14/5/19.
//  Copyright © 2019 Daniel Schepisi. All rights reserved.
//

#import "GameScene.h"

@interface GameScene() <SKPhysicsContactDelegate>

@end

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKShapeNode *_redBall;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    self.name = @"fence";
    self.physicsWorld.contactDelegate = self;
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeFill;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.usesPreciseCollisionDetection = YES;
    self.physicsBody.contactTestBitMask = 1.0;
    
    _redBall = [SKShapeNode shapeNodeWithCircleOfRadius:30.0];
    _redBall.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:30.0];
    _redBall.fillColor = [SKColor redColor];
    _redBall.physicsBody.usesPreciseCollisionDetection = YES;
    _redBall.physicsBody.dynamic = YES;
    _redBall.physicsBody.contactTestBitMask = 1.0;
    
    
    _redBall.position = CGPointMake(self.size.height/4 - 500.0, self.size.width/2);
    
    _redBall.physicsBody.restitution = 1.0;
    _redBall.physicsBody.velocity = CGVectorMake(50.0, 0.0);
    
    [self addChild:_redBall];
    
    
    
//    NSString *burstPath = [[NSBundle mainBundle] pathForResource:@"SceneKit Particle System" ofType:@"scnp"];
//    SKEmitterNode *burstEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:burstPath];
//
//    burstEmitter.position = CGPointMake(self.size.width/2.0, self.size.height/2.0);
//
//    [self addChild:burstEmitter];
    
    
    
    
    
    // Get label node from scene and store it for use later
    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    
    _label.alpha = 0.0;
    [_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    _spinnyNode.lineWidth = 2.5;
    
    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
    [_spinnyNode runAction:[SKAction sequence:@[
                                                [SKAction waitForDuration:0.5],
                                                [SKAction fadeOutWithDuration:0.5],
                                                [SKAction removeFromParent],
                                                ]]];
}

-(void) didBeginContact:(SKPhysicsContact *)contact{
    
    //involves contactPoint
    
    SKAction *action = [SKAction playSoundFileNamed:@"boing.aif" waitForCompletion:YES];
    [self runAction:action];
    
    NSString *burstPath = [[NSBundle mainBundle] pathForResource:@"spark" ofType:@"sks"];
    SKEmitterNode *burstEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:burstPath];
    burstEmitter.position = contact.contactPoint;
    [self addChild:burstEmitter];
    
}

-(void) didEndContact:(SKPhysicsContact *)contact{
    
}



- (void)touchDownAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor greenColor];
    [self addChild:n];
    
    SKAction *action = [SKAction playSoundFileNamed:@"boing.aif" waitForCompletion:YES];
    [self runAction:action];
    
}

- (void)touchMovedToPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor blueColor];
    [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor redColor];
    [self addChild:n];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
//    [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
//    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
    
    SKAction *action = [SKAction playSoundFileNamed:@"boing.aif" waitForCompletion:YES];
    [self runAction:action];
    
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}

    
//    SKAction *action = [SKAction playSoundFileNamed:@"boing.aif" waitForCompletion:YES];
//    [self runAction:action];
//
//    NSString *burstPath = [[NSBundle mainBundle] pathForResource:@"spark" ofType:@"sks"];
//        SKEmitterNode *burstEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:burstPath];
//        burstEmitter.position = _redBall.position;
//        [self addChild:burstEmitter];
    
    
    
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
