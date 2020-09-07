//
//  DateCalculator.m
//  Demo
//
//  Created by xibic on 7/30/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "DateCalculator.h"

@implementation DateCalculator

#pragma mark -
+ (BOOL)currentTimeInBetween:(NSString *)startdate endDate:(NSString *)enddate {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:SERVER_DATE_FORMAT];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *startDate = [dateFormatter dateFromString:startdate];
    NSDate *endDate = [dateFormatter dateFromString:enddate];
    
    // get current date/time
    NSDate *currentTime = [NSDate date];
    if ( ([currentTime compare:startDate] == NSOrderedDescending) &&
         ([currentTime compare:endDate] == NSOrderedAscending) ) {
        return YES;
    }
 
    return NO;
}

#pragma mark -
+ (BOOL)checkDate:(NSString *)firstdate greaterThanDate:(NSString *)seconddate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:SERVER_DATE_FORMAT];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *firstDate = [dateFormatter dateFromString:firstdate];
    NSDate *secondDate = [dateFormatter dateFromString:seconddate];
    //NSDate *maxDate = firstDate;
    NSTimeInterval ti = [secondDate timeIntervalSinceDate:firstDate];
    if (ti < 0){
        return YES;
    }
    return NO;
}

#pragma mark - Date Formatter - UI
+ (NSString *)beautifyDateTime:(NSString *)stringdatetime {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:APP_DATE_FORMAT];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *converteddate = [dateFormatter dateFromString:stringdatetime];
    
    NSString *beautyStringDate = [dateFormatter stringFromDate:converteddate];
    NSLog(@"%@", beautyStringDate);
    return beautyStringDate;
}

@end
