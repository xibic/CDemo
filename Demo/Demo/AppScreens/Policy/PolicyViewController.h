//
//  PolicyViewController.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "CommonViewController.h"
#import "AppRouter.h"
#import "PolicyViewModel.h"

@interface PolicyViewController : CommonViewController
@property (nonatomic, weak) PolicyViewModel *policyViewModel;
@property (nonatomic, weak) AppRouter *appRouter;
@end

 
