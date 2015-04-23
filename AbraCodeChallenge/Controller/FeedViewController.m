//
//  ViewController.m
//  AbraCodeChallenge
//
//  Created by Kateryna Sytnyk on 2/19/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import "FeedViewController.h"
#import "TMAPIClient.h"
#import "PostsHelper.h"

@interface FeedViewController ()

@property (nonatomic, strong) NSMutableArray *posts;

@end

@implementation FeedViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[TMAPIClient sharedInstance] posts:@"abratest" type:nil parameters:nil callback:^(id result, NSError *error) {
        //NSLog(@"Result returned from Tumblr API is: %@", result);
        
        [PostsHelper buildPostsFromDictionary:result];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table delegates

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

@end
