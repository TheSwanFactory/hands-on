//
//  SWANDiamondView.h
//  HandsOn
//
//  Created by Pasquale Barilla on 28/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiamondViewDelegete <NSObject>
- (void) diamondViewShouldDisplayImagePicker;
@end

@interface SWANDiamondView : UIView <UITextViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) id <DiamondViewDelegete> delegate;


@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
- (IBAction)closeDiamondView:(id)sender;
- (IBAction)selectImage:(id)sender;

-(void)setSelectedImageView:(UIImage *)image;

@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property BOOL shouldShowPlaceholderText;

- (IBAction)createHopeTapped:(id)sender;


@end
