//
//  SetGameCardView.h
//  carder4
//
//  Created by Michael Schack on 14.03.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetGameCardView : UICollectionView

@property (strong, nonatomic) NSNumber *cardColor;
@property (strong, nonatomic) NSNumber *cardSymbol;
@property (strong, nonatomic) NSNumber *cardShading;
@property (nonatomic) NSUInteger cardNumber;

@property (nonatomic) BOOL faceUp;

    //- (void)pinch:(UIPinchGestureRecognizer *)gesture;


@end

