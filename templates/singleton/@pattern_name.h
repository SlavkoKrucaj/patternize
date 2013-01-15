//
//  <%= @pattern_name %>.h
//  <%= @project_name %>
//
//  Created by <%= @author %> on <%= Time.now.strftime('%d.%m.%Y.') %>
//  Copyright (c) <%= Time.now.strftime( '%Y' ) %>. <%= @company %>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface <%= @pattern_name %> : NSObject

+ (<%= @pattern_name %>*) instance;

@end