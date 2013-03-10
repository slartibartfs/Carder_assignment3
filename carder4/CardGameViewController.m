//
//  CardGameViewController.m
//  Carder
//
//  Created by Michael Schack on 29.01.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"
#import "PlayingCardCollectionViewCell.h"


@interface CardGameViewController ()

@end

@implementation CardGameViewController


-(PlayingCardDeck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}


-(NSUInteger) startingCardCount
{
    return 22;
    
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).PlayingCardView;
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            playingCardView.faceUp = playingCard.isFaceUp;
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}




@end
