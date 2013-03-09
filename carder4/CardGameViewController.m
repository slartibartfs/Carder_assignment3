//
//  CardGameViewController.m
//  Carder
//
//  Created by Michael Schack on 29.01.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultOfLastFlipLabel;
@property (strong, nonatomic) CardGame *game;



@end

@implementation CardGameViewController



-(CardGame *)game
{
    if (!_game) {
        
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
        self.game.resultOfLastFlip = [NSString stringWithFormat:@" - "];

    }
    return _game;
    
}



-(void)updateUI
{
    UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];

    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        if (!cardButton.selected)[cardButton setImage:cardBackImage forState:UIControlStateNormal]; else [cardButton setImage:nil forState:UIControlStateNormal];
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        
    }


    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.resultOfLastFlipLabel.text = [NSString stringWithFormat:@"%@", self.game.resultOfLastFlip];
    if (self.game.gameOver)
        {
            self.resultOfLastFlipLabel.text = [NSString stringWithFormat:@"Game Over!"];
        }
                                                                   
    
}









@end
