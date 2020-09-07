//
//  WebService.m
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "WebService.h"

@implementation WebService

#pragma mark - Server Request

#pragma mark - GET
- (void)getRequestWithURL:(NSString*)urlString withResponseCallback:(void (^)(NSArray *responseJsonData))callback {
    
    dispatch_queue_t apiQueue = dispatch_queue_create("API Queue", NULL);
    
    dispatch_async(apiQueue, ^{
        //Create HTTP Request
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"GET"];
        [request setURL:[NSURL URLWithString:urlString]];

        //Create URL Session
        [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                         completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response,
                                                             NSError * _Nullable error) {
            
            if (!error) {
                NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                //NSLog(@"#### %@ ####", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                if (httpResp.statusCode == 200) {
                    NSError *jsonError;
                    NSArray *jsonData =
                    [NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingAllowFragments
                                                      error:&jsonError];
                    if (!jsonError) {
                        //NSLog(@"jsonData # %@ - Data - %@",urlString,jsonData);
                        callback(jsonData);
                    }else{
                        //NSLog(@"JsonError # Error - %@",jsonError);
                        callback(nil);
                    }
                }
            }else{
                //NSLog(@"RequestError # Error - %@ \n\n",error);
                callback(nil);
            }
            
        }] resume];
    });
}


//- (void)postRequestWithURL:(NSString*)urlString withResponseCallback:(void (^)(NSArray *responseJsonData))callback {
//        
//}
//
//- (UIImage*)downloadImage:(NSString*)url{
//    
//}

@end
