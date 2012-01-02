//
//  Session.m
//  FlipView
//
//  Created by Taimur Shah on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Session.h"


@implementation Session

static Me* _me = nil;

+(Me*) getUser
{
    if(_me == nil)
        _me = [[Me alloc] initWithLoginData:@"taimur@clossit.com" withPw:@"Engin33r"];
    return _me;
}

@end