//
//  SWANProducerViewController.h
//  HandsOn
//
//  Created by Pasquale Barilla on 31/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <M13ProgressSuite/M13ProgressViewBorderedBar.h>
#import <AVFoundation/AVFoundation.h>

@interface SWANProducerViewController : UIViewController <UIAlertViewDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

- (IBAction)recordButtonTapped:(id)sender;
- (IBAction)playButtonTapped:(id)sender;
- (IBAction)shareButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet M13ProgressViewBorderedBar *recordProgressBar;

@property (weak, nonatomic) IBOutlet UIButton *trashButton;
- (IBAction)trashButtonTapped:(id)sender;

// audio stuff
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
