//
//  VehiclePolicies.h
//  Demo
//
//  Created by xibic on 7/30/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//
#import "Vehicle.h"

@interface VehiclePolicies : NSObject

@property (nonatomic) Vehicle *vehicle;
@property (nonatomic) NSMutableArray *policyArray;
@property (nonatomic) NSMutableArray *extensionPolicyArray;
@property (nonatomic) NSMutableArray *financialTransactionArray;

@end
