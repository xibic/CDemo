//
//  HomeViewModel.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^dataLoading_Completion_Handler)(BOOL success);

@interface HomeViewModel : NSObject

//Return Data Loading State
- (BOOL)isLoadingData;

//Load Data with Completion
- (void)loadData:(dataLoading_Completion_Handler)completion;

//Return Number of Sections
- (NSInteger)numberOfSections;

//Return Number of Rows for each sections
- (NSInteger)numberOfRowsForSection:(NSInteger)sectionIndex;

//Return Vehicle Image Name
- (NSString *)vehicleImage;
//Return Vehicle VRM for UI
- (NSString *)vehiclePrettyVrm;
//Return Vehicle Brand
- (NSString *)vehicleMake;
//Return Vehicle Model
- (NSString *)vehicleModel;
//Return Vehicle Color
- (NSString *)vehicleColor;

@end

 
