//
//  AbstractCreator.h
//  Test
//
//  Created by Slavko Krucaj on 30.12.2012..
//  Copyright (c) 2012. slavko.krucaj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractProdcut.h"

@interface AbstractCreator : NSObject

- (AbstractProdcut *)createMethod;

@end
