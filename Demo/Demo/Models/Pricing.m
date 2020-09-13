//
//  Pricing.m
//  Demo
//
//  Created by xibic on 7/30/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "Pricing.h"

@implementation Pricing

- (instancetype)initWithDictionary:(NSDictionary *)pricingDictionary{
    self = [super init];
    if (self) {
        self.underwriter_premium = [pricingDictionary valueForKey:@"underwriter_premium"];
        self.commission = [pricingDictionary valueForKey:@"commission"];
        self.total_premium = [pricingDictionary valueForKey:@"total_premium"];
        self.ipt = [pricingDictionary valueForKey:@"ipt"];
        self.ipt_rate = [pricingDictionary valueForKey:@"ipt_rate"];
        self.extra_fees = [pricingDictionary valueForKey:@"extra_fees"];
        self.vat = [pricingDictionary valueForKey:@"vat"];
        self.deductions = [pricingDictionary valueForKey:@"deductions"];
        self.total_payable = [pricingDictionary valueForKey:@"total_payable"];
    }
    return self;
}

@end
