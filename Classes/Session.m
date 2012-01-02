//
//  Session.m
//  FlipView
//
//  Created by Taimur Shah on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Session.h"
#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_DIGEST_LENGTH 16

@implementation Session

static Me* _me = nil;

+(Me*) getUser
{
    if(_me == nil)
        _me = [[Me alloc] initWithLoginData:@"admin@clossit.com" withPw:@"Engin33r"];
    return _me;
}

+(NSString*) getImage:(NSString *)url
{
    NSString* filename = [self md5:url];
    filename = [filename stringByAppendingString:@".png"];
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *pngFilePath = [NSString stringWithFormat:@"%@/%@",docDir, filename];
    
    
    if([[NSFileManager defaultManager] fileExistsAtPath:pngFilePath])
        return pngFilePath;
    
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    
    
	// If you go to the folder below, you will find those pictures
	NSLog(@"%@",docDir);
    
	NSLog(@"saving png");
	NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(img)];
	[data1 writeToFile:pngFilePath atomically:YES];
    
	NSLog(@"saving image done");
    return pngFilePath;
}

+(NSString*) md5:(NSString *)input
{
        const char *cStr = [input UTF8String];
        unsigned char digest[16];
        CC_MD5(cStr, strlen(cStr), digest ); // This is the md5 call
        
        NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
        
        for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
            [output appendFormat:@"%02x", digest[i]];
        
        return  output;
}
@end