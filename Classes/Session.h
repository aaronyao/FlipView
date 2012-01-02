//
//  Session.h
//  FlipView
//
//  Created by Taimur Shah on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Me.h"



@interface Session : NSObject 
{
  
}
	
+(Me*) getUser;
+(NSString*) getImage:(NSString*) url;
+(NSString*) md5:(NSString*) input;

@end