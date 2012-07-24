//
//  GetEdfRecipesResponse.m
//  
//
//  Created by ___FULLUSERNAME___ on 7/24/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "GetEdfRecipesResponse.h"

#import "EdfRecipe.h"

@implementation GetEdfRecipesResponse

@synthesize data = _Data;
@synthesize error = error;

+ (GetEdfRecipesResponse *)instanceFromDictionary:(NSDictionary *)aDictionary {

    GetEdfRecipesResponse *instance = [[GetEdfRecipesResponse alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:@"#data"]) {

        if ([value isKindOfClass:[NSArray class]]) {

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                EdfRecipe *populatedMember = [EdfRecipe instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.Data = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"#data"]) {
        [self setValue:value forKey:@"Data"];
    } else if ([key isEqualToString:@"#error"]) {
        [self setValue:value forKey:@"Error"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


@end
