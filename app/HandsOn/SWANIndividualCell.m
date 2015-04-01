//
//  SWANIndividualCell.m
//  HandsOn
//
//  Created by Pasquale Barilla on 1/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANIndividualCell.h"

@implementation SWANIndividualCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)configWithTitle:(NSString *)title {
    self.label.text = title;
    UIImage *image = [UIImage imageNamed:title];
    [self.imageView setImage:image];

    [self.imageView setClipsToBounds:YES];
}

@end
