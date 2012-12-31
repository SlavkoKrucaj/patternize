//
//  AbstractCreator.m
//  Test
//
//  Created by Slavko Krucaj on 30.12.2012..
//  Copyright (c) 2012. slavko.krucaj. All rights reserved.
//

#import "AbstractCreator.h"

@implementation AbstractCreator

- (AbstractProdcut *)createMethod {
    [NSException raise:@"Unimplemented method" format:@"You should override method in ConcreteCreator"];
    return nil;
}

@end
