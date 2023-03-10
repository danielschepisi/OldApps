//
//  PlayingCardDesk.m
//  Card Matching Game Standford
//
//  Created by Daniel Schepisi on 27/10/2017.
//  Copyright © 2017 Daniel Schepisi. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


- (instancetype) init
{
    
    
    self = [super init];
    
    if (self)
    {
        for (NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++)
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
        
    }
    
    

    
    return self;
    
    
}



@end
