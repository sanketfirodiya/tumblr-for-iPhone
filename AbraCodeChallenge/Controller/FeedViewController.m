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
        NSLog(@"[NSThread currentThread] in completion block - %@", [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[NSThread currentThread] in dispatch_get_main_queue- %@", [NSThread currentThread]);
            NSLog(@"self.posts.count - %ld", (long)self.posts.count);
            [self.iboTableView reloadData];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table delegates

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    Post *post = [self.posts objectAtIndex:indexPath.row];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    //imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:post.photo.photoURL]]];
    
    [post.photo downloadPhotoWithCompletionBlock:^(BOOL success){
        if (success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UITableViewCell *cell = [self.iboTableView cellForRowAtIndexPath:indexPath];
            if (cell) {
                NSLog(@"Photo download complete for image at index - %ld", (long)indexPath.row);
                imageView.image = post.photo.photoImage;
            }
            
        });
        }
    }];
    
    UIWebView *webView = (UIWebView *)[cell viewWithTag:2];
    NSMutableString *html = [NSMutableString stringWithString:kHtmlPre];
    if (post.caption && post.caption.length > 0) {
        [html appendString:post.caption];
    }
    [html appendString:kHtmlPost];
    [webView loadHTMLString:[html description] baseURL:nil];
    
    //[self showCaptionForCellAtIndexPath:indexPath];

    UILabel *dateLabel = (UILabel *)[cell viewWithTag:3];
    //dateLabel.text = post.timeStamp
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

#pragma mark - WebView helper method

- (void)showCaptionForCellAtIndexPath:(NSIndexPath *)indexPath {
    
    Post *post = [self.posts objectAtIndex:indexPath.row];
    
    NSMutableString *html = [NSMutableString stringWithString:kHtmlPre];
    if (post.caption && post.caption.length > 0) {
        [html appendString:post.caption];
    }
    [html appendString:kHtmlPost];
    
    UITableViewCell *cell = [self.iboTableView cellForRowAtIndexPath:indexPath];
    UIWebView *webView = (UIWebView *)[cell viewWithTag:2];
    
    [webView loadHTMLString:[html description] baseURL:nil];
}

@end
