//
//  AppRouter.m
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "AppRouter.h"

#import "HomeViewModel.h"
#import "HomeViewController.h"

#import "PolicyViewModel.h"
#import "PolicyViewController.h"

#import "ReceiptViewModel.h"
#import "ReceiptViewController.h"


@interface AppRouter()

@property UINavigationController *navigationController;

@property (nonatomic) HomeViewModel *homeViewModel;
@property (nonatomic) PolicyViewModel *policyViewModel;
@property (nonatomic) ReceiptViewModel *receiptViewModel;

@end

@implementation AppRouter

#pragma mark - Init
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    self = [super init];
    if(!self) return nil;
    
    _navigationController = navigationController;
    _navigationController.navigationBarHidden = TRUE;
    
    return self;
}

#pragma mark - Start - First Scene
- (void)start{
    [self showHomeView];
}


#pragma mark - Home
- (void)didTapHomeViewCell:(NSString *)cellID {
    
}
//Show home Scene
- (void)showHomeView {
    self.homeViewModel = [[HomeViewModel alloc] init];
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    homeViewController.homeViewModel = self.homeViewModel;
    homeViewController.appRouter = self;
    [self.navigationController pushViewController:homeViewController animated:NO];
}

#pragma mark - Policy
- (void)didTapPolicyViewCell:(NSString *)cellID {
    
}

//Show Policy Scene
- (void)showPolicylView {
    self.policyViewModel = [[PolicyViewModel alloc] init];
    PolicyViewController *policyViewController = [[PolicyViewController alloc] init];
    policyViewController.policyViewModel = self.policyViewModel;
    policyViewController.appRouter = self;
    [self.navigationController pushViewController:policyViewController animated:YES];
}

#pragma mark - Receipt
- (void)didTapReceiptViewCell:(NSString *)cellID {
    
}

//Show Receipt Scene
- (void)showReceiptView {
    self.receiptViewModel = [[ReceiptViewModel alloc] init];
    ReceiptViewController *receiptViewController = [[ReceiptViewController alloc] init];
    receiptViewController.receiptViewModel = self.receiptViewModel;
    receiptViewController.appRouter = self;
    [self.navigationController pushViewController:receiptViewController animated:YES];
}


@end
