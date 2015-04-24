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
#import "Photo.h"
#import "NSDateFormatterStringLongStyle.h"

@interface FeedViewController ()

@property (nonatomic, strong) NSArray *posts;

@end

static NSString *kBlogName = @"abratest";
static NSString *kCellIdentifier = @"PostCell";
static NSString *kHtmlPre = @"<html><head><title></title></head><body style=\"background:transparent;\">";
static NSString *kHtmlPost = @"</body></html>";

@implementation FeedViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.posts = [[NSArray alloc] init];
    
    [[TMAPIClient sharedInstance] posts:kBlogName type:nil parameters:nil callback:^(id result, NSError *error) {
        self.posts = [PostsHelper buildPostsFromDictionary:result];
        [self.iboTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table delegates

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    Post *post = [self.posts objectAtIndex:indexPath.section];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    
    if (post.photo.photoImage) {
        imageView.image = post.photo.photoImage;
        
    } else {
        imageView.image = nil;
        [post.photo downloadPhotoWithCompletionBlock:^(BOOL success){
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UITableViewCell *cell = [self.iboTableView cellForRowAtIndexPath:indexPath];
                    if (cell) {
                        imageView.image = post.photo.photoImage;
                    }
                });
            }
        }];
    }
    
    UIWebView *webView = (UIWebView *)[cell viewWithTag:2];
    NSMutableString *html = [NSMutableString stringWithString:kHtmlPre];
    if (post.caption && post.caption.length > 0) {
        [html appendString:post.caption];
    }
    [html appendString:kHtmlPost];
    [webView loadHTMLString:[html description] baseURL:nil];
    
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:3];
    
    dateLabel.text = [[NSDateFormatterStringLongStyle sharedNSDateFormatterStringLongStyle]
                      .NSDateFormatter stringFromDate:post.timeStamp];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 450;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return [self.posts count];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

@end
