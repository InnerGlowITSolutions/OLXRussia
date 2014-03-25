//
//  RestCall.m
//  OLXRussia
//
//  Created by Rejo Joseph on 21/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "RestCall.h"


@implementation NSURLRequest(DataController)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
	return YES;
}
@end


@implementation RestCall

NSMutableURLRequest *theRequest;

+(NSMutableURLRequest *)getMainMenuList:(NSString * )urlStr{
    NSString *urlString=urlStr;
    NSLog(@"urlString:%@",urlString);
    theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [theRequest setHTTPMethod:@"GET"];
   	return theRequest;
}

+(NSMutableURLRequest *)getCategoryList:(NSString * )urlStr;
{
    NSString *urlString=urlStr;
    NSLog(@"urlString:%@",urlString);
    theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [theRequest setHTTPMethod:@"GET"];
    return theRequest;
}


@end
