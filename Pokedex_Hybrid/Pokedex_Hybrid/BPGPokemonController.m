//
//  BPGPokemonController.m
//  Pokedex_Hybrid
//
//  Created by Bradley GIlmore on 6/20/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGPokemonController.h"
#import "Pokedex_Hybrid-Swift.h"
#import "BPGPokemon.h"

static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation BPGPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm
                       completion:(void (^)(BPGPokemon * _Nullable))completion
{
    if (!completion) { completion = ^(BPGPokemon *pokemon) { }; }
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    [NetworkController performRequestFor:searchURL httpMethod:@"GET" urlParameters:nil body:nil completion:^(NSData * data, NSError * error) {
        
        if (error) {
            NSLog(@"Error getting pokemon for search term %@: %@", searchTerm, error);
            completion(nil);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error parsing json: %@", error);
            completion(nil);
            return;
        }
        
        BPGPokemon *pokemon = [[BPGPokemon alloc] initWithDictionary:dictionary];
        completion(pokemon);
    }];
    
}

@end
