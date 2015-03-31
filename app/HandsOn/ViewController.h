//
//  ViewController.h
//  HandsOn
//
//  Created by Pasquale Barilla on 28/03/2015.
//  Copyright (c) 2015 The Swan Factory, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWANDiamondView.h"
#import "SWANHeartCell.h"
#import "Hope.h"

@interface ViewController : UIViewController <DiamondViewDelegete, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *heartView;
@property (weak, nonatomic) IBOutlet UIView *diamondView;
@property (weak, nonatomic) IBOutlet UIView *spadeView;
@property (weak, nonatomic) IBOutlet UIView *clubView;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UICollectionView *heartCollectionView;

- (IBAction)heartButtonTapped:(id)sender;
- (IBAction)diamondButtonTapped:(id)sender;
- (IBAction)spadeButtonTapped:(id)sender;
- (IBAction)clubButtonTapped:(id)sender;

@property (strong, nonatomic) SWANDiamondView *diamondMainView;

@property (strong, nonatomic) NSMutableArray *heartDataSource;
@property (strong, nonatomic) RLMArray<Hope> *heartArray;

@end

