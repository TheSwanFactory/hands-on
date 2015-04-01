//
//  SWANShareViewController.m
//  HandsOn
//
//  Created by Pasquale Barilla on 1/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANShareViewController.h"

@interface SWANShareViewController ()

@property (strong, nonatomic) NSDictionary *dataSource;
@property (strong, nonatomic) NSDictionary *connectionDictionary;

@end

@implementation SWANShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];

//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SWANShareCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
    self.dataSource = @{@"Social" :@[@"Facebook", @"Twitter", @"Email"],
                        @"Circles" : @[@"Basketball", @"Prayer", @"Team"],
                        @"Communities" : @[@"Work", @"Church", @"Neighborhood"],
                        @"Integration" : @[@"Calendar", @"Alarm", @"Reminder"],
                        @"Connection" :@[@"Follow", @"Link", @"Mute"]};
    
    self.connectionDictionary = @{@"Facebook" : @"132 Friends",
                                  @"Twitter" : @"432 Followers",
                                  @"Email" : @"923 Connections",
                                  @"Basketball" :@"12 People",
                                  @"Prayer" : @"45 People",
                                  @"Team" : @"33 People",
                                  @"Work" : @"88 Co-workers",
                                  @"Church" : @"80 People",
                                  @"Neighborhood" : @"30 Neighbours",
                                  @"Calendar" : @"23 Events",
                                  @"Alarm" : @"3 Alarms",
                                  @"Reminder" : @"12 Reminders",
                                  @"Follow" : @"",
                                  @"Link" : @"",
                                  @"Mute" : @""};
    // Do any additional setup after loading the view from its nib.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CALayer *layer = self.topView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSArray *keys = [self.dataSource allKeys];
//    NSArray *array = self.dataSource[keys[section]];
//    return array.count;
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *keys = [self.dataSource allKeys];
    NSArray *array = self.dataSource[keys[indexPath.section]];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
//    cell.textLabel.text = array[indexPath.row];
//    cell.detailTextLabel.text = self.connectionDictionary[array[indexPath.row]];
//    return cell;
    SWANShareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell configureWithArray:array];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray *keys = [self.dataSource allKeys];
    return keys.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *keys = [self.dataSource allKeys];
    return keys[section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *keys = [self.dataSource allKeys];
    NSArray *array = self.dataSource[keys[indexPath.section]];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Share to %@", array[indexPath.row]] message:[NSString stringWithFormat:@"Share to %@", self.connectionDictionary[array[indexPath.row]]] delegate:nil cancelButtonTitle:@"Nope" otherButtonTitles:@"Okay!", nil];
    [alert show];
    
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
