//
//  Documents.m
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "Documents.h"

@implementation Documents

- (instancetype)initWithDictionary:(NSDictionary *)documentsDictionary{
    self = [super init];
    if (self) {
        self.certificate_url = [documentsDictionary valueForKey:@"certificate_url"];
        self.terms_url = [documentsDictionary valueForKey:@"terms_url"];
    }
    return self;
}


@end
