//
//  TBABannerViewController.m
//  Donut
//
//  Copyright (C) 2015 Xiao Yao. All Rights Reserved.
//  See LICENSE.txt for more information.
//

#import "TBABannerViewController.h"

#pragma mark - TBABannerViewController

/**
 *  Duration for the banner view animation.
 */
CGFloat const BannerViewAnimationDuration = 0.25;

@interface TBABannerViewController() <ADBannerViewDelegate>
@property (nonatomic, strong, readwrite) UIViewController *contentViewController;
@property (nonatomic, strong, readwrite) ADBannerView *bannerView;
@property (nonatomic, assign, readwrite) BOOL shouldShowBannerView;

@end

@implementation TBABannerViewController

#pragma mark Lifecycle

- (instancetype)initWithContentViewController:(UIViewController *)contentViewController {
    self = [super init];
    if (self) {
        self.contentViewController = contentViewController;
        self.shouldShowBannerView = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.contentViewController.view];
    
    // Banenr view
    self.bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
}

- (void)viewDidLayoutSubviews {
    CGRect contentFrame = self.view.bounds, bannerFrame = CGRectZero;
    
    bannerFrame.size = [self.bannerView sizeThatFits:contentFrame.size];
    
    if (self.bannerView.bannerLoaded && self.view.window && self.shouldShowBannerView) {
        contentFrame.size.height -= bannerFrame.size.height;
        bannerFrame.origin.y = contentFrame.size.height;
    } else {
        bannerFrame.origin.y = contentFrame.size.height;
    }
    
    self.contentViewController.view.frame = contentFrame;
    self.bannerView.frame = bannerFrame;
}

#pragma mark Public

- (void)showBannerView:(BOOL)animated {
    if (!self.shouldShowBannerView) {
        self.shouldShowBannerView = YES;
        [self updateLayout:animated ? BannerViewAnimationDuration : 0.0];
    }
}

- (void)hideBannerView:(BOOL)animated {
    if (self.shouldShowBannerView) {
        self.shouldShowBannerView = NO;
        [self updateLayout:animated ? BannerViewAnimationDuration : 0.0];
    }
}

#pragma mark Private

- (void)updateLayout:(CGFloat)duration {
    [UIView animateWithDuration:duration animations:^{
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
}

#pragma mark ADBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [self updateLayout:BannerViewAnimationDuration];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    [self updateLayout:BannerViewAnimationDuration];
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    if (self.actionShouldBeginBlock) {
        self.actionShouldBeginBlock(banner, willLeave);
    }
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    if (self.actionDidFinishBlock) {
        self.actionDidFinishBlock(banner);
    }
}

@end
