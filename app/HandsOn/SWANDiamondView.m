//
//  SWANDiamondView.m
//  HandsOn
//
//  Created by Pasquale Barilla on 28/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANDiamondView.h"
#import "Hope.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation SWANDiamondView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib {
    self.shouldShowPlaceholderText = YES;
    
    self.mainView.layer.cornerRadius = 5.0f;
    [self.mainView setClipsToBounds:YES];
    
    self.createButton.layer.cornerRadius = 5.0f;
    self.createButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.createButton.layer.borderWidth = 1.0f;
    [self.createButton setClipsToBounds:YES];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(shouldHideKeyboard:)];
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:downSwipe];
}

-(void)shouldHideKeyboard:(id)sender {
    if (self.titleField.isFirstResponder) {
        [self.titleField resignFirstResponder];
    } else {
        [self.textView resignFirstResponder];
    }
}

- (IBAction)closeDiamondView:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];
}

- (IBAction)selectImage:(id)sender {
    [self.delegate diamondViewShouldDisplayImagePicker];
}

-(void)setSelectedImageView:(UIImage *)image {
    self.imageView.image = image;
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    [UIView animateWithDuration:0.3f animations:^ {
        self.frame = CGRectMake(0, -160, 320, 480);
    }];
}

-(void)keyboardWillHide {
    // Animate the current view back to its original position
    [UIView animateWithDuration:0.3f animations:^ {
        self.frame = CGRectMake(0, 0, 320, 480);
    }];
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.shouldShowPlaceholderText) {
        textView.text = @"";
        self.shouldShowPlaceholderText = NO;
    }
}

- (IBAction)createHopeTapped:(id)sender {
    NSLog(@"Create hope tapped!");
    RLMArray *array = [Hope allObjects];
    
    [MBProgressHUD showHUDAddedTo:self animated:YES];
    [[RLMRealm defaultRealm]beginWriteTransaction];
    Hope *theHope = [Hope new];
    theHope.hopeTitle = self.titleField.text;
    theHope.hopeText = self.textView.text;
    theHope.hopeImageURL = @"";
    [Hope createInDefaultRealmWithObject:theHope];
    [[RLMRealm defaultRealm]commitWriteTransaction];
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
}
@end
