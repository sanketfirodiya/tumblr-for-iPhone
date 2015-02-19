//
//  ViewController.m
//  AbraCodeChallenge
//
//  Created by Kateryna Sytnyk on 2/19/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import "ViewController.h"
#import "TMAPIClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[TMAPIClient sharedInstance] posts:@"abratest" type:nil parameters:nil callback:^(id result, NSError *error) {
        NSLog(@"Result returned from Tumblr API is: %@", result);
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
