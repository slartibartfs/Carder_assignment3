//
//  CardGameBaseController.h
//  carder4
//
//  Created by Michael Schack on 09.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardGame.h"
#import "GameResults.h"

@interface CardGameBaseController : UIViewController

-(Deck *) createDeck; //abstract
-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card; //abstract
                   

@property (nonatomic) NSUInteger startingCardCount; //abstract


@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultOfLastFlipLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) GameResults *gameResults;




@end
