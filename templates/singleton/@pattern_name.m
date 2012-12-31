//
//  Singleton implementation. Created by patternizer.
//

#import "<%= @pattern_name %>.h"

@implementation <%= @pattern_name %>

static <%= @pattern_name %>* _instance = nil;

+ (<%= @pattern_name %>*) instance
{
    @synchronized(self)
    {
        if (_instance == nil)
        {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}


- (id)init
{
    if(self == [super init])
    {
    }
    return self;
}

@end
