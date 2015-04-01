//
//  SWANListenerView.m
//  HandsOn
//
//  Created by Pasquale Barilla on 2/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANListenerView.h"

@interface SWANListenerView ()

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation SWANListenerView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"SWANPlaybackCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PlayCell"];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
    self.dataSource = [[NSUserDefaults standardUserDefaults]objectForKey:@"kRecordings"];
    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(shouldShowShareView:) name:@"kShowShare" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)shouldShowShareView:(id)sender {
    SWANShareViewController *shareView = [[SWANShareViewController alloc]initWithNibName:@"SWANShareViewController" bundle:[NSBundle mainBundle]];
    shareView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:shareView animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWANPlaybackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayCell"];
    NSDictionary *dictionary = self.dataSource[indexPath.row];
    [cell configureWithDictionary:dictionary];
    
//    cell.textLabel.text = dictionary[@"name"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (IBAction)backTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
