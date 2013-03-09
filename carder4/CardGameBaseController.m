//
//  CardGameBaseController.m
//  carder4
//
//  Created by Michael Schack on 09.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardGameBaseController.h"

@interface CardGameBaseController()
@property (strong, nonatomic) CardGame *game;


@end


@implementation CardGameBaseController


-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}


- (IBAction)dealButton:(id)sender {
    
    self.game = nil;
    self.flipCount = 0;
    self.gameResults = nil;    
    [self updateUI];
    
}

-(void)updateUI
{
        //abstract
}

- (IBAction)flipCard:(UIButton *)sender
{
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    self.gameResults.score = self.game.score;
    [self updateUI];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        // Do any additional setup after loading the view.
    
    self.flipCount=0;
    [self updateUI];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            // Custom initialization
    }
    return self;
}


@end
