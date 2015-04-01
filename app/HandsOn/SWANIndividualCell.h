//
//  SWANIndividualCell.h
//  HandsOn
//
//  Created by Pasquale Barilla on 1/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWANIndividualCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

-(void)configWithTitle:(NSString *)title;

@end
