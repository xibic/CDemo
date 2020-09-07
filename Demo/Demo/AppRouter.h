//
//  AppRouter.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppRouter : NSObject

//Init
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

//Start point for the Application - First scene
- (void)start;

//Home
- (void)didTapHomeViewCell:(NSString *)cellID;

//Policy
- (void)didTapPolicyViewCell:(NSString *)cellID;

//Receipt
- (void)didTapReceiptViewCell:(NSString *)cellID;

@end
