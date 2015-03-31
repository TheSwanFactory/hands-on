//
//  ViewController.m
//  HandsOn
//
//  Created by Pasquale Barilla on 28/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.heartView.layer.cornerRadius = 5.0f;
    self.diamondView.layer.cornerRadius = 5.0f;
    self.spadeView.layer.cornerRadius = 5.0f;
    self.clubView.layer.cornerRadius = 5.0f;
    
    [self.heartView setClipsToBounds:YES];
    [self.diamondView setClipsToBounds:YES];
    [self.spadeView setClipsToBounds:YES];
    [self.clubView setClipsToBounds:YES];
    
    self.heartView.backgroundColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.443 alpha:1];
    self.diamondView.backgroundColor = [UIColor colorWithRed:0.608 green:0.349 blue:0.714 alpha:1];
    self.spadeView.backgroundColor = [UIColor colorWithRed:0.906 green:0.298 blue:0.235 alpha:1];
    self.clubView.backgroundColor = [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:1];
    
    self.topView.backgroundColor = [UIColor colorWithRed:0.204 green:0.286 blue:0.369 alpha:1];
    
    [self.heartCollectionView registerNib:[UINib nibWithNibName:@"SWANHeartCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"HeartCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (IBAction)heartButtonTapped:(id)sender {
    NSLog(@"Heart Tapped");
}

- (IBAction)diamondButtonTapped:(id)sender {
    NSLog(@"Diamond Tapped");
    self.diamondMainView.alpha = 0.0;
    [self.view insertSubview:self.diamondMainView belowSubview:self.topView];
    [UIView animateWithDuration:0.5 animations:^{
        self.diamondMainView.alpha = 1.0;
    }];
    

}

- (IBAction)spadeButtonTapped:(id)sender {
    NSLog(@"Spade Tapped");

}

- (IBAction)clubButtonTapped:(id)sender {
    NSLog(@"Club Tapped");

}

-(SWANDiamondView *)diamondMainView {
    if (!_diamondMainView) {
        _diamondMainView = [[[NSBundle mainBundle] loadNibNamed:@"SWANDiamondView" owner:self options:nil] objectAtIndex:0];
        _diamondMainView.delegate = self;
    }
    return _diamondMainView;
}

-(void)diamondViewShouldDisplayImagePicker {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [self.diamondMainView setSelectedImageView:chosenImage];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma mark - heart stuff

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.heartDataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SWANHeartCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeartCell" forIndexPath:indexPath];
    cell.text.text = @"Text Goes Here";
    cell.image.backgroundColor = [UIColor orangeColor];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

-(NSMutableArray *)heartDataSource {
    if (!_heartDataSource) {
        _heartDataSource = [[NSMutableArray alloc]initWithArray:@[@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1,@1, @1, @1, @1, @1]];
    }
    return _heartDataSource;
}

@end
