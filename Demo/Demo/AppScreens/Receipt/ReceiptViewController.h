//
//  ReceiptViewController.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "CommonViewController.h"
#import "AppRouter.h"
#import "ReceiptViewModel.h"

@interface ReceiptViewController : CommonViewController
@property (nonatomic, weak) ReceiptViewModel *receiptViewModel;
@property (nonatomic, weak) AppRouter *appRouter;
@end

 
