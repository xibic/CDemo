//
//  DataSource.m
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "DataManager.h"
#import "WebService.h"
#import "LocalService.h"

#define POLICY_EVENT_URL @"https://cuvva.herokuapp.com/"

@interface DataManager(){
    BOOL isOnline;
    WebService *webService;
}



@end

@implementation DataManager

#pragma mark - init
- (id)init{
    self = [super init];
    if (self) {
        
        webService = [[WebService alloc] init];
        isOnline = YES; //Set Online = YES, as we are getting Data from Server
        
    }
    return self;
}

#pragma mark - Policy Event
// Get Policy Event List
- (void)getPolicyEventData:(api_Completion_Handler_Data)completion {
    
    if (isOnline){
        //Get Data on Separate Thread
        dispatch_queue_t backgroundQueue = dispatch_queue_create("Background Queue", NULL);
        dispatch_async(backgroundQueue, ^{
            [self->webService getRequestWithURL:POLICY_EVENT_URL withResponseCallback:^(NSArray *responseJsonData) {
                if (responseJsonData!=nil) {
                    //Return Data to Main thread
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //Save data for offline access
                        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:responseJsonData]
                                                                  forKey:POLICY_EVENT_URL];
                        //Return
                        completion(TRUE,responseJsonData);
                        [XIBActivityIndicator dismissActivity];
                    });
                }else{
                    //Return Nil to Main thread
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(FALSE,nil);
                    });
                }
            }];
            
        });
        
    }
    // - Offline
    else{
        //Get Data From store
        NSData *dataRepresentingSavedArray = [[NSUserDefaults standardUserDefaults] objectForKey:POLICY_EVENT_URL];
        NSArray *storedData = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        //Return previously stored data
        if(storedData != nil) completion(TRUE,storedData);
        //no data found
        else completion(FALSE,nil);
        
    }
}

#pragma mark - Standard Text
// Get Standard Text
- (void)geStandardTextData:(api_Completion_Handler_Data)completion{
    
    if (isOnline){
        
    }
    // - Offline
    else{
        //Get Data From DB
    }
    
}

#pragma mark - Store Policy Event Data
- (void)savePolicyEventData:(NSArray *)policyEventData {
    
}

@end
