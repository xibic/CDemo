//
//  Vehicle.m
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

- (instancetype)initWithDictionary:(NSDictionary *)vehicleDictionary{
    self = [super init];
    if (self) {
        self.vrm = [vehicleDictionary valueForKey:@"vrm"];
        self.prettyVrm = [vehicleDictionary valueForKey:@"prettyVrm"];
        self.make = [vehicleDictionary valueForKey:@"make"];
        self.model = [vehicleDictionary valueForKey:@"model"];
        self.variant = [vehicleDictionary valueForKey:@"variant"];
        self.color = [vehicleDictionary valueForKey:@"color"];
    }
    return self;
}


@end
