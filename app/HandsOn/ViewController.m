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
    // Do any additional setup after loading the view, typically from a nib.
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
}

- (IBAction)threeTapped:(id)sender {
}
@end
