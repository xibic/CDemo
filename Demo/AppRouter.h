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
+ (void)DidTapHomeViewCell:(NSString *)cellID;

//Policy
+ (void)DidTapPolicyViewCell:(NSString *)cellID;

//Receipt
+ (void)DidTapReceiptViewCell:(NSString *)cellID;

@end
