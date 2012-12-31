//
//  ConcreteCreator.m
//  Test
//
//  Created by Slavko Krucaj on 30.12.2012..
//  Copyright (c) 2012. slavko.krucaj. All rights reserved.
//

#import "ConcreteCreator.h"
#import "ConcreteProduct.h"

@implementation ConcreteCreator

- (<%= @pattern_name %>Prodcut *)createMethod {
    return [[ConcreteProduct alloc] init];
}

@end
