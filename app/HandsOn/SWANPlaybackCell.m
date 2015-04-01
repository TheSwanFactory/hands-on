//
//  SWANPlaybackCell.m
//  HandsOn
//
//  Created by Pasquale Barilla on 2/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANPlaybackCell.h"

@implementation SWANPlaybackCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)playPauseButtonTapped:(id)sender {
    UIButton *button = (UIButton *)sender;
    if ([button isSelected]) {
        [button setSelected:NO];
        [self.audioPlayer stop];
        [self.playbackTimer invalidate];
    } else {
        [button setSelected:YES];
        [self.audioPlayer play];
        self.playbackTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updatePlaybackProgress:) userInfo:nil repeats:YES];
    }
}

-(void)updatePlaybackProgress:(id)sender {
    if (self.audioPlayer) {
        float progress = self.audioPlayer.currentTime/self.audioPlayer.duration;
        if (progress > 1) {
            [self.progressBar setProgress:1 animated:YES];

            [self.playbackTimer invalidate];
            [self.playPauseButton setSelected:NO];
        } else {
            [self.progressBar setProgress:progress animated:YES];

        }
        
    }
    
}

-(void)configureWithDictionary:(NSDictionary *)dictionary {
    self.producerName.text = dictionary[@"producer"];
    self.recordingName.text = dictionary[@"name"];
//    self.producerImage.image = [UIImage imageNamed:@"ryan"];
    self.producerImage.layer.cornerRadius = self.producerImage.frame.size.width/2;
    [self.producerImage setClipsToBounds:YES];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.imageView.image = [UIImage imageNamed:@"ryan"];
//
//    });
    self.filePath = [NSURL URLWithString:dictionary[@"filepath"]];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.filePath error:nil];
    [self.audioPlayer setDelegate:self];

}
- (IBAction)shareButtonTapped:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kShowShare" object:nil];
}
@end
