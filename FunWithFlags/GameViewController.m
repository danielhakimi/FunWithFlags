//
//  GameViewController.m
//  FunWithFlags
//
//  Created by Daniel Hakimi-Nayeri on 06/07/2012.
//  Copyright (c) 2012 Lola Cars. All rights reserved.
//

#import "GameViewController.h"
#import "ViewController.h"
#import "FlagImages.h"

@implementation GameViewController
@synthesize questionLabel;
@synthesize answerButton1;
@synthesize answerButton2;
@synthesize answerButton3;
@synthesize answerButton4;
@synthesize flagImage;
@synthesize questionNumberLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void) initQuestionsAndAnswers
{
    vc = [[ViewController alloc] init];
    flag = [[FlagImages alloc] init];
    
    NSString *questionFile = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    vc.questions = [[NSDictionary alloc] initWithContentsOfFile:questionFile];   
    vc.questionKeys = [vc.questions allKeys];
    
    NSString *answerFile = [[NSBundle mainBundle] pathForResource:@"Answers" ofType:@"plist"];
    vc.answers = [[NSDictionary alloc] initWithContentsOfFile:answerFile];   
    vc.answerKeys = [vc.answers allKeys];
     
    NSUInteger indexKey = 1;   
    NSString *index;
    
    // populate flag dictionary with keys that correspond 
    // to the questions and answer plists 
    for (UIImage *img in flag.flags) {
        index = [NSString stringWithFormat:@"%i", indexKey];
        [flag.flagDictionary setObject:img forKey:index];
        indexKey++;
    }
    
    // random number for question pick
    int questionIndex = arc4random() % [vc.questionKeys count];
    
    for (int i = 0; i < [vc.questionKeys count]; i++) 
    {
        if (questionIndex == i) key = [vc.answerKeys objectAtIndex:i];        
    }
     
    // get random question and answer and set the flag image
    question = [vc.questions valueForKey:key];
    answer = [vc.answers valueForKey:key];
    [flagImage setImage:[flag.flagDictionary valueForKey:key]];
 
    /* used for debugging 
    for (int i = 0; i < [vc.questionKeys count]; i++) 
    {
        id thing = [vc.questionKeys objectAtIndex:i];
       NSLog(@"%@ \t %@", [vc.questionKeys objectAtIndex:i], [vc.questions valueForKey:thing]);
        
    }
   
    NSLog(@"the question is %@ and the answer is %@", question, answer);
     */
}

-(void) loadQuestionsAndAnswers
{
    NSArray *answerButtons = [[NSArray alloc] initWithObjects:
                              answerButton1,
                              answerButton2,
                              answerButton3, 
                              answerButton4, nil];
    
    int index = arc4random() % [answerButtons count];
    
    // random button with answer
    UIButton *b = [answerButtons objectAtIndex:index];
    [b setTitle:answer forState:UIControlStateNormal];
  
    id answerIndex;
    NSString *otherAnswers = [NSString string];
    NSMutableSet* existingAnswers = [NSMutableSet set];
    
    for (UIButton *button in answerButtons) 
    {
        while (button.titleLabel.text == nil) 
        {   
            if (button.titleLabel.text == nil) {
                
                // keep randomising number if it is the same number as the answer
                do 
                {
                    answerIndex = [vc.answerKeys objectAtIndex:arc4random() % [vc.answerKeys count]];                
                } while (answerIndex == key );
                
                otherAnswers = [vc.answers valueForKey:answerIndex];
                
                // check if otherAnswers is the same as the existing answer string
                while (otherAnswers == answer) 
                {           
                    answerIndex  = [vc.answerKeys objectAtIndex:arc4random() % [vc.answerKeys count]];
                    otherAnswers = [vc.answers valueForKey:answerIndex];
                }
                
                // if answer is not already in array, add to array 
                if (![existingAnswers containsObject:otherAnswers]) 
                {
                    [existingAnswers addObject:otherAnswers];
                    [button setTitle:otherAnswers forState:UIControlStateNormal];
                    NSLog(@"button text = %@", button.titleLabel.text);
                }          
            }
             
        }   
    }  
    
}

-(void) alert:(UIButton *) button
{
    if (button.titleLabel.text == answer)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct" 
                                                        message:@"Well done" 
                                                       delegate:self 
                                              cancelButtonTitle:nil 
                                              otherButtonTitles:@"OK", nil];
        
        score++;        
        questionNumber++;  
        NSString *questionNumberString = [[NSString alloc] initWithFormat:@"%i", questionNumber];
        questionNumberLabel.text = [questionNumberString stringByAppendingString:questionNumberTotal];
        
        if (questionNumber == 11){
            
            NSString *message = [[NSString alloc] initWithString:@"You scored "];           
            
            UIAlertView *finalScoreMessage = [[UIAlertView alloc] initWithTitle:@"Total questions 10" 
                                                                        message:[message stringByAppendingString: [NSString stringWithFormat:@"%i", score]]
                                                                       delegate:nil 
                                                              cancelButtonTitle:nil
                                                              otherButtonTitles:@"OK", nil];
            [self dismissModalViewControllerAnimated:YES];
            [finalScoreMessage show];
            
        } else 
        {              
            [alert show];
        }
    }
    else        
    {
        NSString *message = [[NSString alloc] initWithString:@"The answer is "];
                
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong" 
                                                        message:[message stringByAppendingString:answer]
                                                       delegate:self 
                                              cancelButtonTitle:nil 
                                              otherButtonTitles:@"OK", nil];
        questionNumber++;    
        NSString *questionNumberString = [[NSString alloc] initWithFormat:@"%i", questionNumber];
        questionNumberLabel.text = [questionNumberString stringByAppendingString:questionNumberTotal];
        
        if (questionNumber == 11){
            
            NSString *message = [[NSString alloc] initWithString:@"You scored "];           
            
            UIAlertView *finalScoreMessage = [[UIAlertView alloc] initWithTitle:@"Total questions 10" 
                                                                        message:[message stringByAppendingString: [NSString stringWithFormat:@"%i", score]]
                                                                       delegate:nil 
                                                              cancelButtonTitle:nil
                                                              otherButtonTitles:@"OK", nil];
            [self dismissModalViewControllerAnimated:YES];
            [finalScoreMessage show];            
        } 
        else 
        {              
            [alert show];
        }
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad
{
    [super viewDidLoad]; 
    [self initQuestionsAndAnswers];
    [self loadQuestionsAndAnswers];    
    score = 0;  
    questionNumber = 1;
    questionNumberTotal = @"/10";
    NSString *questionNumberString = [[NSString alloc] initWithFormat:@"%i", questionNumber];
    questionNumberLabel.text = [questionNumberString stringByAppendingString:questionNumberTotal];
}


- (void)viewDidUnload
{
    [self setQuestionLabel:nil];
    [self setAnswerButton1:nil];
    [self setAnswerButton2:nil];
    [self setAnswerButton3:nil];
    [self setAnswerButton4:nil];
    [self setFlagImage:nil];
    [self setQuestionNumberLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)answerButton1:(UIButton *)button 
{
    [self alert:button];
    [self performSelector:@selector(title:) withObject:button afterDelay:0];
}

- (IBAction)answerButton2:(UIButton *)button 
{
    [self alert:button];
    [self performSelector:@selector(title:) withObject:button afterDelay:0];
}

- (IBAction)answerButton3:(UIButton *)button 
{
    [self alert:button];    
    [self performSelector:@selector(title:) withObject:button afterDelay:0];
}

- (IBAction)answerButton4:(UIButton *)button
{
    [self alert:button];
    [self performSelector:@selector(title:) withObject:button afterDelay:0];
}

- (IBAction)title:(id)sender
{
    [sender setTitle:nil forState:UIControlStateNormal];
    answerButton1.titleLabel.text = nil;
    answerButton2.titleLabel.text = nil;
    answerButton3.titleLabel.text = nil;
    answerButton4.titleLabel.text = nil;
    [self initQuestionsAndAnswers];
    [self loadQuestionsAndAnswers];
}



@end
