//
//  Vehicle.h
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "JSONModel.h"

@interface Vehicle : NSObject

@property (nonatomic) NSString *vrm;
@property (nonatomic) NSString *prettyVrm;
@property (nonatomic) NSString *make;
@property (nonatomic) NSString *model;
@property (nonatomic) NSString *variant;
@property (nonatomic) NSString *color;

- (instancetype)initWithDictionary:(NSDictionary *)vehicleDictionary;

@end
