//
//  CardGame.h
//  carder4
//
//  Created by Michael Schack on 09.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@protocol cardGame
@required
-(BOOL)checkForGameOver;
-(void)flipCardAtIndex:(NSUInteger)index;

@end

@interface CardGame : NSObject

-(Card *)cardAtIndex:(NSUInteger)index;
-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;

@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *otherCards;
@property (nonatomic) int score;
@property (nonatomic) int gameMode;
@property (nonatomic) BOOL gameOver;
@property (strong, nonatomic) NSMutableArray *recentlyPlayedCards;


@end
