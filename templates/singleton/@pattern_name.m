//
//  <%= @pattern_name %>.m
//  <%= @project_name %>
//
//  Created by <%= @author %> on <%= Time.now.strftime('%d.%m.%Y.') %>
//  Copyright (c) <%= Time.now.strftime( '%Y' ) %>. <%= @company %>. All rights reserved.
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
