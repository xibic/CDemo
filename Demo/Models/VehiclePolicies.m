//
//  VehiclePolicies.m
//  Demo
//
//  Created by xibic on 7/30/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "VehiclePolicies.h"

@implementation VehiclePolicies

- (instancetype)init{
    self = [super init];
    if (self) {
        self.policyArray = [[NSMutableArray alloc] init];
        self.extensionPolicyArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
