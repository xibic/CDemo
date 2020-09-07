//
//  HomeViewModel.m
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "HomeViewModel.h"
#import "DataManager.h"
#import "PolicyEvent.h"
#import "Payload.h"
#import "Vehicle.h"
#import "Documents.h"
#import "Pricing.h"
#import "VehiclePolicies.h"
#import "DateCalculator.h"

@interface HomeViewModel(){
    DataManager *dataManager;
    NSMutableArray *vehicleArray;
    NSMutableArray *finacialTransactionArray;
    NSMutableArray *activePolicyVehicleArray;
    NSMutableArray *inactivePolicyVehicleArray;
    BOOL loadingData;
}
@end

@implementation HomeViewModel

#pragma mark - Init
- (instancetype)init{
    self = [super init];
    if(!self) return nil;
    
    vehicleArray = [[NSMutableArray alloc] init];
    finacialTransactionArray = [[NSMutableArray alloc] init];
    activePolicyVehicleArray = [[NSMutableArray alloc] init];
    inactivePolicyVehicleArray = [[NSMutableArray alloc] init];
    
    dataManager = [[DataManager alloc] init];
    
    loadingData = NO;
    
    return self;
}

#pragma mark -
#pragma mark - Load Data
- (void)loadData:(dataLoading_Completion_Handler)completion {
    loadingData = YES;
    [dataManager getPolicyEventData:^(BOOL success, NSArray *resultDataArray) {
        if (success) {
            //Process data
            for (NSDictionary *dic in resultDataArray) {
                PolicyEvent *policyEventItem = [[PolicyEvent alloc] initWithDictionary:dic];
                [self updateVehicleArray:policyEventItem];
                
            }
            
            //3 Steps to process the policy data for UI represtations
            //1 - Figure out the Extension Policies First
            [self sortOutExtensionPolicies];
            
            //2 - Sort out the policies with financial transactions
            [self sortOutPolicyFinancialTransactions];
            
            //3 - List Active policies
            [self sortOutActivePolicies];
            
            completion(TRUE);
        }
    }];
}

- (BOOL)isLoadingData {
    return loadingData;
}

#pragma mark - Table
- (NSInteger)numberOfSections {
    if(activePolicyVehicleArray.count == 0) return 1;
    return 2;
}
- (NSInteger)numberOfRowsForSection:(NSInteger)sectionIndex {
    if(sectionIndex == 0 && activePolicyVehicleArray.count != 0) return activePolicyVehicleArray.count;
    return inactivePolicyVehicleArray.count;
}

#pragma mark - Vehicle
- (NSString *)vehicleImage {
    VehiclePolicies *vp = [inactivePolicyVehicleArray objectAtIndex:0];
    return vp.vehicle.make;
}
- (NSString *)vehiclePrettyVrm {
    VehiclePolicies *vp = [inactivePolicyVehicleArray objectAtIndex:0];
    return vp.vehicle.prettyVrm;
}
- (NSString *)vehicleMake {
    VehiclePolicies *vp = [inactivePolicyVehicleArray objectAtIndex:0];
    return vp.vehicle.make;
}
- (NSString *)vehicleModel {
    VehiclePolicies *vp = [inactivePolicyVehicleArray objectAtIndex:0];
    return vp.vehicle.model;
}

- (NSString *)vehicleColor {
    VehiclePolicies *vp = [inactivePolicyVehicleArray objectAtIndex:0];
    return vp.vehicle.color;
}

#pragma mark -
#pragma mark - Policy Event Process

- (void)updateVehicleArray:(PolicyEvent *)pevent{
    
    //Check if the policy is Created
    if ([pevent.type isEqualToString:@"policy_created"]) {
       
        VehiclePolicies *newVehicleItem = [[VehiclePolicies alloc] init];
        newVehicleItem.vehicle = pevent.payload.vehicle;
        for (VehiclePolicies *vehicleItem in vehicleArray) {
            if([vehicleItem.vehicle.vrm isEqualToString:newVehicleItem.vehicle.vrm]){
                //Check if its a original policy - then add it to policy array
                if([pevent.payload.policy_id isEqualToString:pevent.payload.original_policy_id]){
                    [vehicleItem.policyArray addObject:pevent];
                    if([DateCalculator currentTimeInBetween:pevent.payload.start_date endDate:pevent.payload.end_date]){
                        pevent.policyActive = YES;
                    }
                }
                //Its a extension policy, save it for later processing
                else{
                    [vehicleItem.extensionPolicyArray addObject:pevent];
                }
                
                return;
            }
        }
        //Its a policy for new Vehicle - add to vehicle array
        [newVehicleItem.policyArray addObject:pevent];
        [vehicleArray addObject:newVehicleItem];
    }
    //Check if the policy is Financial Transaction
    else if([pevent.type isEqualToString:@"policy_financial_transaction"]){
        [finacialTransactionArray addObject:pevent];
    }
    //Check if the policy is canceled
    else if([pevent.type isEqualToString:@"policy_cancelled"]){
        //[finacialTransactionArray addObject:pevent];
    }
}

- (void)sortOutExtensionPolicies {
    for (VehiclePolicies *vehicle in vehicleArray) {
        for (PolicyEvent *extensionPolicy in vehicle.extensionPolicyArray) {
            
            for (PolicyEvent *originalPolicy in vehicle.policyArray) {
                if([originalPolicy.payload.policy_id isEqualToString:extensionPolicy.payload.original_policy_id]){
                    //NSLog(@"FOUND CHILD - %@",extensionPolicy.payload.policy_id);
                    [originalPolicy.childPolicy addObject:extensionPolicy];
                    NSString *startdate = originalPolicy.payload.start_date;
                    NSString *enddate = extensionPolicy.payload.end_date;
                    if([DateCalculator currentTimeInBetween:startdate endDate:enddate]){
                        originalPolicy.policyActive = YES;
                    }
                    break;
                }
            }
        }
    }
}

- (void)sortOutPolicyFinancialTransactions {
    for (PolicyEvent *fintrans in finacialTransactionArray) {
        for (VehiclePolicies *vehicle in vehicleArray) {
            for (PolicyEvent *originalPolicy in vehicle.policyArray) {
                if([originalPolicy.payload.policy_id isEqualToString:fintrans.payload.policy_id]){
                    [originalPolicy.financialTransaction addObject:fintrans];
                    break;
                }
            }
        }
    }
}

- (void)sortOutActivePolicies {
    for (VehiclePolicies *vehicle in vehicleArray) {
        BOOL vehicleHaveActivePolicy = NO;
        for (PolicyEvent *policy in vehicle.policyArray) {
            if(policy.policyActive){
                vehicleHaveActivePolicy = YES;
            }
        }
        if(vehicleHaveActivePolicy) [activePolicyVehicleArray addObject:vehicle];
        else [inactivePolicyVehicleArray addObject:vehicle];
    }
}


@end
