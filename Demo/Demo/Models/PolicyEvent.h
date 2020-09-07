//
//  PolicyEvent.h
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "Payload.h"


@interface PolicyEvent : NSObject

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *timestamp;
@property (nonatomic) NSString *unique_key;

@property (strong, nonatomic) Payload *payload;

@property (strong, nonatomic) NSMutableArray *childPolicy;
@property (strong, nonatomic) NSMutableArray *financialTransaction;
@property (assign) BOOL policyActive;

- (instancetype)initWithDictionary:(NSDictionary *)policyEventDictionary;

@end
