//
//  SOCQ.m
//  SOCQ
//
//  Created by Adam Burkepile on 2/4/12.
//  Copyright (c) 2012 Adam Burkepile. All rights reserved.
//

#import "SOCQ+NSArray.h"

@implementation NSArray (SOCQ)

- (NSArray*)take:(NSUInteger)inCount {
    NSMutableArray* retArray = [NSMutableArray new];
    
    NSUInteger count = inCount > [self count] ? [self count] : inCount ;
    
    for (int i = 0; i < count; i++) {
        [retArray addObject:[self objectAtIndex:i]];
    }

    return [retArray copy];
}

- (NSArray*)skip:(NSUInteger)inCount {
    NSUInteger position = inCount > [self count] ? [self count] : inCount ;
    NSUInteger size = [self count] - position;
    
    NSRange range;
    range.location = position;
    range.length = size;
    
    return [self subarrayWithRange:range];
}

- (NSArray*)skip:(NSUInteger)inSkip take:(NSUInteger)inTake {
    return [[self skip:inSkip] take:inTake];
}

@end
