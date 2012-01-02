//
//  Me.m
//  FlipView
//
//  Created by Taimur Shah on 1/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Me.h"
#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_DIGEST_LENGTH 16
@implementation Me
@synthesize apiKey;



-(Me*) initWithLoginData:(NSString*) email withPw: (NSString*) pw
{
    if(self == [super init])
    {
    //generate apiKey
    NSLog(@"Me init called.");
    apiKey = [self md5:[[email stringByAppendingString:@":"] stringByAppendingString:pw]];

    //download json
    NSURL *url = [NSURL URLWithString:[@"http://api.clossit.com/api/User.aspx?q=basic&key=" stringByAppendingString:apiKey]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    [self initFromString:json_string];
    }
    
    return self;
}
@end
