//
//  SetGameCardView.m
//  carder4
//
//  Created by Michael Schack on 14.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetGameCardView.h"

@interface SetGameCardView()

@end

@implementation SetGameCardView


- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

- (void)setCardColor:(NSNumber *)cardColor
{
    _cardColor = cardColor;
    [self setNeedsDisplay];
}

- (void)setCardSymbol:(NSNumber *)cardSymbol
{
    _cardSymbol = cardSymbol;
    [self setNeedsDisplay];
}

- (void)setCardShading:(NSNumber *)cardShading
{
    _cardShading = cardShading;
    [self setNeedsDisplay];
}

- (void)setCardNumber:(NSUInteger)cardNumber
{
    _cardNumber = cardNumber;
    [self setNeedsDisplay];
}


- (NSAttributedString *) drawSymbol: (NSNumber *)cardSymbol
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







#define CORNER_RADIUS 12.0

- (void)drawRect:(CGRect)rect
{
        // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    
    [roundedRect addClip];
    
    
    
    [[UIColor greenColor] setFill];
    UIRectFill(self.bounds);
        
      NSMutableAttributedString *setCardText = [[NSMutableAttributedString alloc] initWithString:@"12345"];
    
        /* [setCardText appendAttributedString:[self drawSymbol:self.cardSymbol
 withNumberOfSymbols:self.cardNumber
           withColor:self.cardColor
          andShading:self.cardShading]];
    */
    CGPoint middle = CGPointMake(self.bounds.size.width/4, self.bounds.size.height/4);

    [setCardText drawAtPoint:middle];
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
}

#define PIP_FONT_SCALE_FACTOR 0.20
#define CORNER_OFFSET 2.0



#pragma mark - Initialization

- (void)setup
{
        // do initialization here

}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
