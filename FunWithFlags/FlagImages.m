//
//  FlagImages.m
//  FunWithFlags
//
//  Created by Daniel Hakimi-Nayeri on 16/07/2012.
//  Copyright (c) 2012 Lola Cars. All rights reserved.
//

#import "FlagImages.h"

@implementation FlagImages

@synthesize flagDictionary, flags;

-(id)init
{
    self = [super init];
    
    if (self) 
    {
        
        UIImage *myImage1 = [UIImage imageNamed:@"england-flag.gif"];
        UIImage *myImage2 = [UIImage imageNamed:@"wales-flag.gif"];
        UIImage *myImage3 = [UIImage imageNamed:@"scotland-flag.gif"];
        UIImage *myImage4 = [UIImage imageNamed:@"france-flag.gif"];
        UIImage *myImage5 = [UIImage imageNamed:@"sweden-flag.gif"];
        UIImage *myImage6 = [UIImage imageNamed:@"portugal-flag.gif"];
        UIImage *myImage7 = [UIImage imageNamed:@"norway-flag.gif"];
        UIImage *myImage8 = [UIImage imageNamed:@"ireland-flag.gif"];
        UIImage *myImage9 = [UIImage imageNamed:@"greece-flag.gif"];
        UIImage *myImage10 = [UIImage imageNamed:@"germany-flag.gif"];
        UIImage *myImage11 = [UIImage imageNamed:@"united-kingdom-flag.gif"];
        UIImage *myImage12 = [UIImage imageNamed:@"spain-flag.gif"];
        UIImage *myImage13 = [UIImage imageNamed:@"italy-flag.gif"];
        UIImage *myImage14 = [UIImage imageNamed:@"scotland-flag.gif"];
      
        
        flags = [[NSMutableArray alloc] initWithObjects:myImage1, myImage2, myImage3, myImage4, myImage5, myImage6, myImage7, myImage8, myImage9, myImage10,
                 myImage11, myImage12, myImage13,
                 myImage14, nil];
        flagDictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}
@end
