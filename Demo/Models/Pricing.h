//
//  Pricing.h
//  Demo
//
//  Created by xibic on 7/30/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

@interface Pricing : NSObject

@property (nonatomic) NSString *underwriter_premium;
@property (nonatomic) NSString *commission;
@property (nonatomic) NSString *total_premium;
@property (nonatomic) NSString *ipt;
@property (nonatomic) NSString *ipt_rate;
@property (nonatomic) NSString *extra_fees;
@property (nonatomic) NSString *vat;
@property (nonatomic) NSString *deductions;
@property (nonatomic) NSString *total_payable;

- (instancetype)initWithDictionary:(NSDictionary *)pricingDictionary;

@end
