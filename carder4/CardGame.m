//
//  CardGame.m
//  carder4
//
//  Created by Michael Schack on 09.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardGame.h"

@interface CardGame()


@end

@implementation CardGame

-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
        
    }
    return _cards;
}

-(NSMutableArray *)otherCards
{
    if (!_otherCards) {
        _otherCards = [[NSMutableArray alloc] init];
        
    }
    return _otherCards;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

-(NSMutableArray *)recentlyPlayedCards
{
    if (!_recentlyPlayedCards) {
        _recentlyPlayedCards = [[NSMutableArray alloc] init];
        
    }
    return _recentlyPlayedCards;
}

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
        
    }
    return self;
}

/*
-(void)flipCardAtIndex:(NSUInteger)index;
{
        //abstract
}*/

@end
