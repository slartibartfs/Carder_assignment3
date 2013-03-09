//
//  SetCardGame.m
//  Carder
//
//  Created by Michael Schack on 11.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetCardGame.h"

@interface SetCardGame()

@end

@implementation SetCardGame

-(BOOL)checkForGameOver
{
    BOOL gameOver=FALSE;
    
    return gameOver;
}




#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define FLIP_COST 1

-(void)flipCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    int otherCardCount = 0;
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            self.score -= FLIP_COST;
            [self.recentlyPlayedCards addObject:card];
            if ([self.recentlyPlayedCards count]>3) [self.recentlyPlayedCards removeObjectAtIndex:0];
            
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    self.otherCards[otherCardCount] = otherCard;
                    otherCardCount++;
                }
            }
            if (otherCardCount>1)
                {
                int matchScore = [card match:self.otherCards];
                if (matchScore)
                    {
                    card.unplayable=YES;
                    for (Card *sampleCard in self.otherCards)
                        {
                        sampleCard.unplayable = YES;
                        }
                    self.score += matchScore * MATCH_BONUS;
                    } else
                        {
                        for (Card *sampleCard in self.otherCards)
                            {
                            sampleCard.faceUp = NO;
                            }
                        self.score -= MISMATCH_PENALTY;
                        }
                }
            
        } else [self.recentlyPlayedCards removeLastObject];
        card.faceUp = !card.isFaceUp;
        //NSLog(@"------card flipped------- %@",card.contents);
        //NSLog(@"recently played (%d): ",self.recentlyPlayedCards.count);
        //for (Card *rcard in self.recentlyPlayedCards) NSLog(@" %@ ",rcard.contents);
                
    }
}


@end
