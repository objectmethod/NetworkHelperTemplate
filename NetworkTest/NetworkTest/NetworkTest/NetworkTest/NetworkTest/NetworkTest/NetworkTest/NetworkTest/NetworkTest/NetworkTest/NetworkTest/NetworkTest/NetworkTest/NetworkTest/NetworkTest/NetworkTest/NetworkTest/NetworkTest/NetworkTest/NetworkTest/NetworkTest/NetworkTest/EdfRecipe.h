//
//  EdfRecipe.h
//  
//
//  Created by ___FULLUSERNAME___ on 7/24/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EdfRecipe : NSObject {
    NSString *nid;
    NSString *nodeChanged;
}

@property (nonatomic, copy) NSString *nid;
@property (nonatomic, copy) NSString *nodeChanged;

+ (EdfRecipe *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
