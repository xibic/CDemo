//
//  PolicyEvent.m
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "PolicyEvent.h"

@implementation PolicyEvent

- (instancetype)initWithDictionary:(NSDictionary *)policyEventDictionary{
    self = [super init];
    if (self) {
        self.type = [policyEventDictionary valueForKey:@"type"];
        self.unique_key = [policyEventDictionary valueForKey:@"unique_key"];
        self.timestamp = [policyEventDictionary valueForKey:@"timestamp"];
        NSDictionary *payloadDic = [policyEventDictionary valueForKey:@"payload"];
        if(payloadDic != nil){
            self.payload = [[Payload alloc] initWithDictionary:payloadDic];
        }
        self.childPolicy = [[NSMutableArray alloc] init];
        self.financialTransaction = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
