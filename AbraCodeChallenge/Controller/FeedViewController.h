//
//  ViewController.h
//  AbraCodeChallenge
//
//  Created by Kateryna Sytnyk on 2/19/15.
//  Copyright (c) 2015 Abra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *iboTableView;

@end

