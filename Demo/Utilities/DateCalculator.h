//
//  DateCalculator.h
//  Demo
//
//  Created by xibic on 7/30/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SERVER_DATE_FORMAT @"yyyy-MM-dd'T'HH:mm:ss.SSSZ"
#define APP_DATE_FORMAT @"EEEE, d MMM yyyy"

@interface DateCalculator : NSObject

//Check if current time is between Two dates
+ (BOOL)currentTimeInBetween:(NSString *)startdate endDate:(NSString *)enddate;

//Check if a date is later than another
+ (BOOL)checkDate:(NSString *)firstdate greaterThanDate:(NSString *)seconddate;

//Format the date for UI
+ (NSString *)beautifyDateTime:(NSString *)stringdatetime;

@end
