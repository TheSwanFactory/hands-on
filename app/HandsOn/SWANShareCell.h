//
//  SWANShareCell.h
//  HandsOn
//
//  Created by Pasquale Barilla on 1/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWANIndividualCell.h"

@interface SWANShareCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *dataSource;

-(void)configureWithArray:(NSArray *)array;

@end
