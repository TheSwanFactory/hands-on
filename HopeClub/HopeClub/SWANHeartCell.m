//
//  SWANHeartCell.m
//  HopeClub
//
//  Created by Pasquale Barilla on 28/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANHeartCell.h"

@implementation SWANHeartCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.cornerRadius = 5.0f;
    [self setClipsToBounds:YES];
}

@end
