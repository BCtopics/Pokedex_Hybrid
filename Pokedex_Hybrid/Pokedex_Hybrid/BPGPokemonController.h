//
//  BPGPokemonController.h
//  Pokedex_Hybrid
//
//  Created by Bradley GIlmore on 6/20/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BPGPokemon;

@interface BPGPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm
                       completion: (void (^_Nullable)(BPGPokemon * _Nullable))completion;

@end
