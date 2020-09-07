//
//  Payload.m
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "Payload.h"

@implementation Payload

- (instancetype)initWithDictionary:(NSDictionary *)payloadDictionary{
    self = [super init];
    if (self) {
        self.user_id = [payloadDictionary valueForKey:@"user_id"];
        self.user_revision = [payloadDictionary valueForKey:@"user_revision"];
        self.policy_id = [payloadDictionary valueForKey:@"policy_id"];
        self.original_policy_id = [payloadDictionary valueForKey:@"original_policy_id"];
        self.reference_code = [payloadDictionary valueForKey:@"reference_code"];
        self.start_date = [payloadDictionary valueForKey:@"start_date"];
        self.end_date = [payloadDictionary valueForKey:@"end_date"];
        self.incident_phone = [payloadDictionary valueForKey:@"incident_phone"];
        self.type = [payloadDictionary valueForKey:@"type"];
        self.newenddate = [payloadDictionary valueForKey:@"new_end_date"];
        
        NSDictionary *vehicleDic = [payloadDictionary valueForKey:@"vehicle"];
        if(vehicleDic != nil){
            self.vehicle = [[Vehicle alloc] initWithDictionary:vehicleDic];
        }
        
        NSDictionary *docuDic = [payloadDictionary valueForKey:@"documents"];
        if(docuDic != nil){
            self.documents = [[Documents alloc] initWithDictionary:docuDic];
        }
        
        NSDictionary *pricingDic = [payloadDictionary valueForKey:@"pricing"];
        if(pricingDic != nil){
            self.pricing = [[Pricing alloc] initWithDictionary:pricingDic];
        }
        
    }
    return self;
}

@end
