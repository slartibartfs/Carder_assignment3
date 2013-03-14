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
#import "SetCardGameCollectionViewCell.h"

@interface SetCardGameViewController ()
@property (strong, nonatomic) CardGame *game;
@property (weak, nonatomic) IBOutlet UILabel *recentlyPlayedCardsLabel;

        
@end

@implementation SetCardGameViewController

@synthesize game = _game;

-(Deck *) createDeck
{
    return [[SetCardGameDeck alloc] init];
}

-(CardGame *)game
{
    if (!_game){
        
        _game = [[SetCardGame alloc] initWithCardCount:self.startingCardCount
                                                  usingDeck:[self createDeck]];
        
    }
    return _game;
    
}


-(NSUInteger) startingCardCount
{
    return 12;
    
}



-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[SetCardGameCollectionViewCell class]]) {
        SetGameCardView *setGameCardview = ((SetCardGameCollectionViewCell *)cell).SetGameCardView;
        if ([card isKindOfClass:[SetPlayingCard class]]) {
            SetPlayingCard *setPlayingCard = (SetPlayingCard *)card;
            setGameCardview.cardColor = setPlayingCard.cardColor;
            setGameCardview.cardShading = setPlayingCard.cardShading;
            setGameCardview.cardSymbol = setPlayingCard.cardSymbol;
            setGameCardview.cardNumber = setPlayingCard.cardNumber;
            setGameCardview.faceUp = setPlayingCard.isFaceUp;
            /*
            if ((setGameCardview.faceUp != setPlayingCard.isFaceUp)) {
                
                setGameCardview.faceUp = setPlayingCard.isFaceUp;
            }*/
            
            setGameCardview.alpha = setPlayingCard.isUnplayable ? 0.3 : 1.0;
          
            
        }
    }
}

 /*
-(void)updateUI
{
    
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]){
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card];
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
    
    
    
}

*/




@end
