//
//  SWANShareViewController.h
//  HandsOn
//
//  Created by Pasquale Barilla on 1/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWANShareCell.h"

@interface SWANShareViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
- (IBAction)backTapped:(id)sender;

@end
