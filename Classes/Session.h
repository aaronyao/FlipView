//
//  Session.h
//  FlipView
//
//  Created by Taimur Shah on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Me.h"

Me* User;

Me* getUser()
{
    if(User == Nil)
        User = [[Me alloc] initWithLoginData:@"taimur@clossit.com" withPw:@"Engin33r"];
    return User;
}
