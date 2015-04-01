//
//  SWANListenerView.h
//  HandsOn
//
//  Created by Pasquale Barilla on 2/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWANPlaybackCell.h"
#import "SWANShareViewController.h"


@interface SWANListenerView : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backTapped:(id)sender;

@end
