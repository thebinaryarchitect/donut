//
//  TBABannerViewController.m
//  Donut
//
//  Copyright (C) 2015 Xiao Yao. All Rights Reserved.
//  See LICENSE.txt for more information.
//

#import "TBABannerViewController.h"

#pragma mark - TBABannerViewController

@interface TBABannerViewController()
@property (nonatomic, strong, readwrite) UIViewController *contentViewController;
@end

@implementation TBABannerViewController

#pragma mark Lifecycle

- (instancetype)initWithContentViewController:(UIViewController *)contentViewController {
    self = [super init];
    if (self) {
        self.contentViewController = contentViewController;
    }
    return self;
}

@end
