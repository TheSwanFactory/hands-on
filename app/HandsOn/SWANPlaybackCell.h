//
//  SWANPlaybackCell.h
//  HandsOn
//
//  Created by Pasquale Barilla on 2/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <M13ProgressSuite/M13ProgressViewBorderedBar.h>
#import <AVFoundation/AVFoundation.h>


@interface SWANPlaybackCell : UITableViewCell <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *producerImage;
@property (weak, nonatomic) IBOutlet UILabel *recordingName;
@property (weak, nonatomic) IBOutlet UILabel *producerName;
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
- (IBAction)playPauseButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet M13ProgressViewBorderedBar *progressBar;

-(void)configureWithDictionary:(NSDictionary *)dictionary;

@property (strong, nonatomic) NSURL *filePath;

@property CGFloat playbackPercentage;
@property BOOL isPlaying;
- (IBAction)shareButtonTapped:(id)sender;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *playbackTimer;

@end
