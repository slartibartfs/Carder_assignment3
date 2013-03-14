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
#import "PlayingCardCollectionViewCell.h"


@interface CardGameViewController ()

@end

@implementation CardGameViewController

@synthesize game = _game;

-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}


-(NSUInteger) startingCardCount
{
    return 22;
    
}


-(CardGame *)game
{
    if (!_game){
        
        _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                          usingDeck:[self createDeck]];
        
    }
    return _game;
    
}


-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).PlayingCardView;
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            
            if ((playingCardView.faceUp != playingCard.isFaceUp)) {
                
                
                
                [UIView transitionWithView:playingCardView
                              duration:0.3
                               options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                                   playingCardView.faceUp = playingCard.isFaceUp;


                               }
             
                            completion:NULL];
            } 
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;

        }
    }
}




@end
