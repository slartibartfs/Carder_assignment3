//
//  CardGameBaseController.m
//  carder4
//
//  Created by Michael Schack on 09.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardGameBaseController.h"


@interface CardGameBaseController () <UICollectionViewDataSource, UICollectionViewDelegate>


@property (strong, nonatomic) CardGame *game;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;


@end


@implementation CardGameBaseController

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)asker
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.startingCardCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card];
    return cell;
    
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
        //abstract
}

-(CardGame *)game
{
    if (!_game) {
        
        _game = [[CardGame alloc] initWithCardCount:self.startingCardCount
                                                  usingDeck:[self createDeck]];
    }
    return _game;
    
}

-(Deck *) createDeck
{
    return nil; //abstract
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
        //UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];
    
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]){
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.resultOfLastFlipLabel.text = [NSString stringWithFormat:@"%@", self.game.resultOfLastFlip];
    if (self.game.gameOver)
        {
        self.resultOfLastFlipLabel.text = [NSString stringWithFormat:@"Game Over!"];
        }
    
    
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        [self.game flipCardAtIndex:indexPath.item];
        self.flipCount++;
        self.gameResults.score = self.game.score;
        [self updateUI];
    }
    
    
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
