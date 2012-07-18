//
//  GameViewController.h
//  FunWithFlags
//
//  Created by Daniel Hakimi-Nayeri on 06/07/2012.
//  Copyright (c) 2012 Lola Cars. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
@class FlagImages;

@interface GameViewController : UIViewController
{
    ViewController *vc;
    FlagImages *flag;
    id question;
    id answer;
    id key;
    int score;
    int questionNumber;
    BOOL answerSelected; 
    NSString *questionNumberTotal;
}
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerButton1;
@property (weak, nonatomic) IBOutlet UIButton *answerButton2;
@property (weak, nonatomic) IBOutlet UIButton *answerButton3;
@property (weak, nonatomic) IBOutlet UIButton *answerButton4;
@property (strong, nonatomic) IBOutlet UIImageView *flagImage;
@property (weak, nonatomic) IBOutlet UILabel *questionNumberLabel;

- (IBAction)answerButton1:(id)sender;
- (IBAction)answerButton2:(id)sender;
- (IBAction)answerButton3:(id)sender;
- (IBAction)answerButton4:(id)sender;

@end
