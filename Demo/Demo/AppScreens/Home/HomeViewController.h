//
//  HomeViewController.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "CommonViewController.h"
#import "AppRouter.h"
#import "HomeViewModel.h"


@interface HomeViewController : CommonViewController

@property (nonatomic, strong) HomeViewModel *homeViewModel;
@property (nonatomic, strong) AppRouter *appRouter;

@end

 
