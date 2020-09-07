//
//  DataSource.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

typedef void (^api_Completion_Handler_Status)(BOOL success);
typedef void (^api_Completion_Handler_Data)(BOOL success, NSArray *resultDataArray);

@interface DataManager : NSObject

// Polciy Event - Get data from Policty Event API endpoint
- (void)getPolicyEventData:(api_Completion_Handler_Data)completion;

// Standard Text - Get Data from Standard Text API endpoint
- (void)geStandardTextData:(api_Completion_Handler_Data)completion;

//Store data Locally
- (void)savePolicyEventData:(NSArray *)policyEventData;

@end

 
