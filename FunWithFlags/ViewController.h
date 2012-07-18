//
//  ViewController.h
//  FunWithFlags
//
//  Created by Daniel Hakimi-Nayeri on 05/07/2012.
//  Copyright (c) 2012 Lola Cars. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController 

@property (nonatomic, strong) NSDictionary *questions;
@property (nonatomic, strong) NSArray *questionKeys;

@property (nonatomic, strong) NSDictionary *answers;
@property (nonatomic, strong) NSArray *answerKeys;

@property (nonatomic, strong) NSDictionary *images;
@property (nonatomic, strong) NSArray *imageKeys;
@end
