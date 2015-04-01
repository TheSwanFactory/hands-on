//
//  SWANFollowerView.m
//  HandsOn
//
//  Created by Pasquale Barilla on 2/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANFollowerView.h"

@interface SWANFollowerView ()

@end

@implementation SWANFollowerView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.amFollowing.layer.cornerRadius = self.amFollowing.frame.size.width/2;
    [self.amFollowing setClipsToBounds:YES];
    //78, 205, 196
    self.amFollowing.layer.borderColor = [UIColor colorWithRed:78.0f/255.0f green:205.0f/255.0f blue:196.0f/255.0f alpha:1.0].CGColor;
    self.amFollowing.layer.borderWidth = 3.0f;
    
    self.theUser.layer.cornerRadius = self.theUser.frame.size.width/2;
    [self.theUser setClipsToBounds:YES];
    self.theUser.layer.borderColor = [UIColor colorWithRed:78.0f/255.0f green:205.0f/255.0f blue:196.0f/255.0f alpha:1.0].CGColor;
    self.theUser.layer.borderWidth = 3.0f;
    
    self.connectedThrough.layer.cornerRadius = self.connectedThrough.frame.size.width/2;
    [self.connectedThrough setClipsToBounds:YES];
//    [self.connectedThrough setBackgroundColor:[UIColor colorWithRed:78.0f/255.0f green:205.0f/255.0f blue:196.0f/255.0f alpha:1.0]];
    self.connectedThrough.layer.borderColor = [UIColor colorWithRed:78.0f/255.0f green:205.0f/255.0f blue:196.0f/255.0f alpha:1.0].CGColor;
    self.connectedThrough.layer.borderWidth = 3.0f;
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    visualEffectView.frame = self.backgroundImage.bounds;
    [self.backgroundImage addSubview:visualEffectView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
