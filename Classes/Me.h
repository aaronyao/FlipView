//
//  Me.h
//  FlipView
//
//  Created by Taimur Shah on 1/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClossitUser.h"

@interface Me : ClossitUser
{
    NSString* apiKey;

}

-(Me*)initWithLoginData:(NSString*) email withPw:(NSString*)pw;


@property (strong) NSString* apiKey;


@end
