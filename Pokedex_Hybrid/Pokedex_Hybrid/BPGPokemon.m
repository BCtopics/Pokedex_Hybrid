//
//  BPGPokemon.m
//  Pokedex_Hybrid
//
//  Created by Bradley GIlmore on 6/20/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGPokemon.h"

@implementation BPGPokemon

- (instancetype)init
{
    return [self initWithName:@"" identifier:0 abilities:@[]];
}

- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation BPGPokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilityDictionaries = dictionary[@"abilities"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilityDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in abilityDictionaries) {
        
        NSString *abilityName = dictionary[@"ability"][@"name"];
        if (!abilityName) {continue; }
        [abilities addObject:abilityName];
    }
    
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
