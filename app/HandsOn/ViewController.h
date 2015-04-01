//
//  ViewController.h
//  HandsOn
//
//  Created by Pasquale Barilla on 31/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWANProducerViewController.h"
#import "SWANShareViewController.h"
//#import "SWANFollowerView.h"
#import "SWANListenerView.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//- (IBAction)oneTapped:(id)sender;
//- (IBAction)twoTapped:(id)sender;
//- (IBAction)threeTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *headerDataSource;
@property (strong, nonatomic) NSArray *labelDataSource;
@property (strong, nonatomic) NSArray *subtitleDataSource;


@end

