//
//  SWANProducerViewController.m
//  HandsOn
//
//  Created by Pasquale Barilla on 31/03/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANProducerViewController.h"
#import "SWANShareViewController.h"

#define kRecordIncrementTime @0.33
#define kRecordingMaxTime @12

@interface SWANProducerViewController ()

@property BOOL isRecording;
@property (strong, nonatomic) NSTimer *recordingLabelTimer;
@property (strong, nonatomic) NSArray *recordLabels;
@property NSInteger currentRecordLabelArrayPointer;

@property CGFloat recordingSecond;
@property CGFloat recordingCompleteAsPercentage;

@property NSString *recordLocationURL;

@end

@implementation SWANProducerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareAudioControllers];
    
    self.isRecording = NO;
    self.recordingSecond = 0.0;
    self.recordingCompleteAsPercentage = 0.0;
    self.currentRecordLabelArrayPointer = 0;
    self.recordProgressBar.progressDirection = M13ProgressViewBorderedBarProgressDirectionLeftToRight;
    self.recordProgressBar.cornerType = M13ProgressViewBorderedBarCornerTypeCircle;
    [self.recordProgressBar performAction:M13ProgressViewActionFailure animated:YES];
    
    self.recordLabels = @[@"Recording", @"Recording.", @"Recording..", @"Recording..."];
    // Do any additional setup after loading the view from its nib.
    self.mainImage.layer.cornerRadius = self.mainImage.frame.size.width/2;
    [self.mainImage setClipsToBounds:YES];
    self.mainImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.mainImage.layer.borderWidth = 2.0f;
    
    self.recordButton.layer.cornerRadius = 3.0f;
    [self.recordButton setClipsToBounds:YES];
    
    self.playButton.layer.cornerRadius = 3.0f;
    [self.playButton setClipsToBounds:YES];
    
    self.shareButton.layer.cornerRadius = 3.0f;
    [self.shareButton setClipsToBounds:YES];
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    visualEffectView.frame = self.backgroundImage.bounds;
    [self.backgroundImage addSubview:visualEffectView];
}

-(void)prepareAudioControllers {
     // Set the audio file
     NSArray *pathComponents = [NSArray arrayWithObjects:
     [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
     @"MyAudioMemo.m4a",
     nil];
     NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
     
     // Setup audio session
     AVAudioSession *session = [AVAudioSession sharedInstance];
     [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
     
     // Define the recorder setting
     NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
     
     [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
     [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
     [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
     
     // Initiate and prepare the recorder
     self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
     self.audioRecorder.delegate = self;
     self.audioRecorder.meteringEnabled = YES;
     [self.audioRecorder prepareToRecord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)recordButtonTapped:(id)sender {
    // stop the playback if its playing
    if (self.audioPlayer.isPlaying) {
        [self.audioPlayer stop];
    }
    
    /*
     if (!recorder.recording) {
     AVAudioSession *session = [AVAudioSession sharedInstance];
     [session setActive:YES error:nil];
     
     // Start recording
     [recorder record];
     [recordPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
     
     } else {
     
     // Pause recording
     [recorder pause];
     [recordPauseButton setTitle:@"Record" forState:UIControlStateNormal];
     }
     */
    
    if (!self.isRecording) {
        self.isRecording = YES;
        [self startRecording];
    } else {
        self.isRecording = NO;
        [self pauseRecording];
    }
}

-(void)setRecordButtonTextToString:(NSString *)string {
//    [UIView animateWithDuration:0.01 animations:^{
        [self.recordButton setTitle:string forState:UIControlStateNormal];
//    }];

}

-(void)incrementRecordTitle:(id)sender {
    if (self.isRecording) {
        self.recordingSecond = self.recordingSecond + kRecordIncrementTime.floatValue;
        self.recordingCompleteAsPercentage = self.recordingSecond/kRecordingMaxTime.floatValue;
        [self.recordProgressBar setProgress:self.recordingCompleteAsPercentage animated:YES];
        // should the recording finish?
        if (self.recordingSecond > kRecordingMaxTime.floatValue) {
            self.isRecording = NO;
            [self setRecordButtonTextToString:@"Finished"];
            [self.recordingLabelTimer invalidate];
            [self.recordProgressBar performAction:M13ProgressViewActionSuccess animated:YES];
            return;
        }
        
        NSLog(@"Recording Second:%f", self.recordingSecond);
        NSLog(@"Recording Percentage:%f", self.recordingCompleteAsPercentage);
        [self setRecordButtonTextToString:self.recordLabels[self.currentRecordLabelArrayPointer]];
        if (self.currentRecordLabelArrayPointer >= self.recordLabels.count-1) {
            self.currentRecordLabelArrayPointer = 0;
        } else {
            self.currentRecordLabelArrayPointer++;
        }
    } else {
        [self.recordingLabelTimer invalidate];
    }
    
}

- (IBAction)playButtonTapped:(id)sender {
    [self playbackRecording];
}

- (IBAction)shareButtonTapped:(id)sender {
    SWANShareViewController *shareView = [[SWANShareViewController alloc]initWithNibName:@"SWANShareViewController" bundle:[NSBundle mainBundle]];
    [self presentViewController:shareView animated:YES completion:nil];
    
}
- (IBAction)trashButtonTapped:(id)sender {
    self.isRecording = NO;
    [self.recordingLabelTimer invalidate];
    [self pauseRecording];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Delete Current Recording" message:@"Are you sure you'd like to delete the current recording? This cannot be undone." delegate:nil cancelButtonTitle:@"Nope" otherButtonTitles:@"I'm Sure!" , nil];
    alert.tag = 001;
    alert.delegate = self;
    [alert show];
    [UIView animateWithDuration:0.5 animations:^{
        self.trashButton.alpha = 1.0;
    }];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //NSLog(@"button index %i", buttonIndex);
    if (alertView.tag == 001) {
        if (buttonIndex == 1) {
            // delete the recording
            [self deleteRecording];
        }
    }
}

-(void)startRecording {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    
    // Start recording
    [self.audioRecorder record];
    
    // do all the UI stuff
    [self incrementRecordTitle:nil];
    self.recordingLabelTimer = [NSTimer scheduledTimerWithTimeInterval:kRecordIncrementTime.floatValue target:self selector:@selector(incrementRecordTitle:) userInfo:nil repeats:YES];
    [UIView animateWithDuration:0.5 animations:^{
        self.playButton.alpha = 1.0;
        self.shareButton.alpha = 1.0;
        self.trashButton.alpha = 1.0;
    }];
}

-(void)pauseRecording {
    [self setRecordButtonTextToString:@"Stopped"];
    [self.audioRecorder stop];

}

-(void)playbackRecording {
    if (!self.audioRecorder.isRecording) {
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.audioRecorder.url error:nil];
        [self.audioPlayer setDelegate:self];
        [self.audioPlayer play];
    }
}

-(void)deleteRecording {
    self.recordingSecond = 0.0;
    self.recordingCompleteAsPercentage = 0.0;
    [self.recordProgressBar setProgress:0.0 animated:YES];
    [self.recordProgressBar performAction:M13ProgressViewActionFailure animated:YES];
    [self setRecordButtonTextToString:@"Tap to Record"];
    [UIView animateWithDuration:0.5 animations:^{
        self.playButton.alpha = 0.0;
        self.shareButton.alpha = 0.0;
        self.trashButton.alpha = 0.0;
    }];
}


- (IBAction)backTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
