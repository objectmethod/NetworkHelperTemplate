//
//  GetEdfRecipesResponse.h
//  
//
//  Created by ___FULLUSERNAME___ on 7/24/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetEdfRecipesResponse : NSObject {
    NSArray *data;
    BOOL error;
}

@property (nonatomic, copy) NSArray *data;
@property (nonatomic, assign) BOOL error;

+ (GetEdfRecipesResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
