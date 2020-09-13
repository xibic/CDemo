//
//  Payload.h
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "Vehicle.h"
#import "Documents.h"
#import "Pricing.h"

@interface Payload : NSObject

@property (nonatomic) NSString *user_id;
@property (nonatomic) NSString *user_revision;
@property (nonatomic) NSString *policy_id;
@property (nonatomic) NSString *original_policy_id;
@property (nonatomic) NSString *reference_code;
@property (nonatomic) NSString *start_date;
@property (nonatomic) NSString *end_date;
@property (nonatomic) NSString *incident_phone;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *newenddate;

@property (strong, nonatomic) Vehicle<Optional>* vehicle;
@property (strong, nonatomic) Documents<Optional>* documents;
@property (strong, nonatomic) Pricing<Optional>* pricing;

- (instancetype)initWithDictionary:(NSDictionary *)payloadDictionary;

@end
