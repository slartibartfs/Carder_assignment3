//
//  SetCardGameViewController.m
//  Carder
//
//  Created by Michael Schack on 11.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardGameDeck.h"
#import "SetCardGame.h"

@interface SetCardGameViewController ()
@property (strong, nonatomic) CardGame *game;
@property (weak, nonatomic) IBOutlet UILabel *recentlyPlayedCardsLabel;

        
@end

@implementation SetCardGameViewController


- (NSAttributedString *)getSymbol: (NSNumber *)cardSymbol
              withNumberOfSymbols: (NSUInteger)cardNumber
                        withColor: (NSNumber *)cardColor
                       andShading: (NSNumber *)cardShading

{
    NSDictionary *cardSymbols = @{@1: @"●", @2: @"▲", @3: @"■"};
    NSDictionary *cardColors = @{@1:[UIColor orangeColor], @2:[UIColor blueColor], @3:[UIColor redColor]};
    NSDictionary *cardShadings = @{@1:@1.0, @2:@0.4, @3:@0.0};

    NSMutableString *result = [[NSMutableString alloc] init];
    for (int i=1; i<=cardNumber;i++)
    {
        [result appendString:cardSymbols[cardSymbol]];
    }
    
    NSMutableAttributedString *cardTitle = [[NSMutableAttributedString alloc] initWithString:result];
    NSRange range = [[cardTitle string] rangeOfString:[cardTitle string]];

        
    [cardTitle addAttribute:NSStrokeColorAttributeName value:cardColors[cardColor] range:range];
    [cardTitle addAttribute:NSStrokeWidthAttributeName value:@-10 range:range];
    [cardTitle addAttribute:NSForegroundColorAttributeName value:[cardColors[cardColor] colorWithAlphaComponent:[cardShadings[cardShading] floatValue]] range:range];

    
    return cardTitle;
                                     
}

-(void)updateUI
{
    /*
    for (UIButton *cardButton in self.cardButtons)
    {
        SetPlayingCard *card = (SetPlayingCard *)[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
    
        [cardButton setAttributedTitle:[self getSymbol:card.cardSymbol
                                   withNumberOfSymbols:card.cardNumber
                                             withColor:card.cardColor
                                            andShading:card.cardShading] forState:UIControlStateNormal];
    
        

        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        
        cardButton.alpha = card.isUnplayable ? 0.0 : 1.0;
        cardButton.backgroundColor = card.isFaceUp ? [UIColor colorWithWhite:0.9 alpha:1.0] : nil;
    }
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    
        NSMutableAttributedString *rlabelText = [[NSMutableAttributedString alloc] initWithString:@"Played: "];
    
        NSMutableAttributedString *spacer = [[NSMutableAttributedString alloc] initWithString:@" + "];
        int i=0;
    
        for (SetPlayingCard *result in self.game.recentlyPlayedCards)
            {
            
            if (i>0) [rlabelText appendAttributedString:spacer];
            
            [rlabelText appendAttributedString: [self getSymbol:result.cardSymbol
                                           withNumberOfSymbols:result.cardNumber
                                                     withColor:result.cardColor
                                                    andShading:result.cardShading]];
            i++;
            
            }
        
    [self.recentlyPlayedCardsLabel setAttributedText:rlabelText];
    
    */
    
}






@end
