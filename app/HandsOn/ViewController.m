//
//  ViewController.m
//  HandsOn
//
//  Created by Pasquale Barilla on 31/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MainCell"];
    self.headerDataSource = @[@"Produce", @"Share", @"Commit"];
    self.labelDataSource = @[@"Visionaries", @"Connectors", @"Doers"];
    self.subtitleDataSource = @[@"Voice your hopes",
                                @"Build the tribe",
                                @"Find your purpose"];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)oneTapped:(id)sender {
    SWANProducerViewController *producerView = [[SWANProducerViewController alloc]initWithNibName:@"SWANProducerViewController" bundle:[NSBundle mainBundle]];
    [self presentViewController:producerView animated:YES completion:nil];
}

- (IBAction)twoTapped:(id)sender {
    SWANShareViewController *shareView = [[SWANShareViewController alloc]initWithNibName:@"SWANShareViewController" bundle:[NSBundle mainBundle]];
    [self presentViewController:shareView animated:YES completion:nil];
}

- (IBAction)threeTapped:(id)sender {
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.headerDataSource.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.headerDataSource[section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCel"];
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MainCell"];
    cell.textLabel.text = self.labelDataSource[indexPath.section];
    cell.detailTextLabel.text = self.subtitleDataSource[indexPath.section];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        SWANProducerViewController *producerView = [[SWANProducerViewController alloc]initWithNibName:@"SWANProducerViewController" bundle:[NSBundle mainBundle]];
        producerView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:producerView animated:YES completion:nil];
    } else if (indexPath.section == 1) {
        SWANShareViewController *shareView = [[SWANShareViewController alloc]initWithNibName:@"SWANShareViewController" bundle:[NSBundle mainBundle]];
        shareView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

        [self presentViewController:shareView animated:YES completion:nil];
    } else {
        SWANListenerView *listenerView = [[SWANListenerView alloc]initWithNibName:@"SWANListenerView" bundle:[NSBundle mainBundle]];
        listenerView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:listenerView animated:YES completion:nil];
    }
}
@end
