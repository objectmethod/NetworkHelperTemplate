//
//  GetEdfRecipesResponse.h
//  
//
//  Created by ___FULLUSERNAME___ on 7/24/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetEdfRecipesResponse : NSObject {
    NSArray *Data;
    BOOL Error;
}

@property (nonatomic, copy) NSArray *Data;
@property (nonatomic, assign) BOOL Error;

+ (GetEdfRecipesResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
