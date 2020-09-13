//
//  Documents.h
//  Demo
//
//  Created by xibic on 7/29/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "JSONModel.h"

@interface Documents : NSObject

@property (nonatomic) NSString *certificate_url;
@property (nonatomic) NSString *terms_url;

- (instancetype)initWithDictionary:(NSDictionary *)documentsDictionary;

@end
