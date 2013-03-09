//
//  CardGameBaseController.h
//  carder4
//
//  Created by Michael Schack on 09.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardGame.h"
#import "GameResults.h"

@protocol CardGameController
@required
- (void)updateUI;
- (CardGame *)game;

@end



@interface CardGameBaseController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) GameResults *gameResults;




@end
