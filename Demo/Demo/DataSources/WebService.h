//
//  WebService.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#define SERVER_BASE_URL @"http://202.84.35.90:16019/mobile"

@interface WebService : NSObject

//Get
- (void)getRequestWithURL:(NSString*)urlString withResponseCallback:(void (^)(NSArray *responseJsonData))callback;

/* Should add later*/

//Post
//- (void)postRequestWithURL:(NSString*)urlString withResponseCallback:(void (^)(NSArray *responseJsonData))callback;

//Image downloader
//- (UIImage*)downloadImage:(NSString*)url;

@end
 
