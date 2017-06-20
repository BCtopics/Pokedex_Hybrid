//
//  BPGPokemon.h
//  Pokedex_Hybrid
//
//  Created by Bradley GIlmore on 6/20/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPGPokemon : NSObject

- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;

#pragma mark - Properties

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

@end


@interface BPGPokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
