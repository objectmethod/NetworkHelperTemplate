//
//  EdfRecipe.m
//  
//
//  Created by ___FULLUSERNAME___ on 7/24/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "EdfRecipe.h"

@implementation EdfRecipe

@synthesize nid = _nid;
@synthesize nodeChanged = _nodeChanged;

+ (EdfRecipe *)instanceFromDictionary:(NSDictionary *)aDictionary {

    EdfRecipe *instance = [[EdfRecipe alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"node_changed"]) {
        [self setValue:value forKey:@"nodeChanged"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


@end
