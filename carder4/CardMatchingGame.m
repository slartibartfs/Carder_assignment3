//
//  CardMatchingGame.m
//  Carder
//
//  Created by Michael Schack on 01.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()


@end

@implementation CardMatchingGame

-(BOOL)checkForGameOver
{
    BOOL gameOver=TRUE;
    
    for (int i=0; i<[self.cards count]; i++) {
        for (int k=0;k<[self.cards count];k++) {
            if (i!=k){
                            
                Card *card1 = [self cardAtIndex:i];
                Card *card2= [self cardAtIndex:k];
                if (!card1.isUnplayable && !card2.isUnplayable)
                {
                    int matchScore = [card1 match:@[card2]];
                    
                    if (matchScore) {
                        gameOver=FALSE;
                        break;
                    }
                }
            }
        }
        if (!gameOver) break;
    }
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
            
            self.resultOfLastFlip = [NSString stringWithFormat:@"%@ flipped @ cost of %d", card.contents, FLIP_COST];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    self.otherCards[otherCardCount] = otherCard;
                    otherCardCount++;
                }
            }

            if (otherCardCount==1)
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
                    self.resultOfLastFlip = [NSString stringWithFormat:@"scored %d!", matchScore * MATCH_BONUS];
                } else
                {
                    for (Card *sampleCard in self.otherCards)
                    {
                        sampleCard.faceUp = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                    self.resultOfLastFlip = [NSString stringWithFormat:@"Penalty %d", MISMATCH_PENALTY];
                }
            }

        } else [self.recentlyPlayedCards removeLastObject];
        card.faceUp = !card.isFaceUp;
               
        self.gameOver=[self checkForGameOver];
        if (self.gameOver) {
            for (int i=0; i<[self.cards count]; i++) {
                Card *thiscard = [self cardAtIndex:i];
                thiscard.unplayable=TRUE;
                    //thiscard.FaceUp=TRUE;
            }
            NSLog(@"Game Over");
        }
    }
}

@end
