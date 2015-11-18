//
//  ViewController.m
//  Donut
//
//  Copyright (C) 2015 Xiao Yao. All Rights Reserved.
//  See LICENSE.txt for more information.
//

#import "ViewController.h"

#pragma mark - ViewController

@interface ViewController ()

@end

#pragma mark Lifecycle

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Show Banner View" style:UIBarButtonItemStylePlain target:self action:@selector(toggleBannerView:)];
    vc.navigationItem.rightBarButtonItem = item;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    self = [super initWithContentViewController:navController];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)toggleBannerView:(UIBarButtonItem *)item {
    if (self.shouldShowBannerView) {
        [self hideBannerView:YES];
        item.title = @"Show Banner View";
    } else {
        [self showBannerView:YES];
        item.title = @"Hide Banner View";
    }
}

@end
