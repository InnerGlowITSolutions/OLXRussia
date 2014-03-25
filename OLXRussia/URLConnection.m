//
//  URLConnection.m
//  OLXRussia
//
//  Created by Rejo Joseph on 21/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "URLConnection.h"
#import "HomeViewController.h"
#import "CategoryListViewController.h"
#import "SubcatListViewController.h"
@implementation URLConnection
@synthesize delgateObject,urlData;
@synthesize setIdentifier;


- (id) initWithMethodNameRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg identifier:(NSString *)checkIdentity{
    self = [super initWithRequest:requestArg delegate:self];
    setIdentifier=checkIdentity;
    if (self != nil) {
        self.delgateObject=delegateArg;
    }
    return self;
}

- (id) initWithMethodRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg{
    self = [super initWithRequest:requestArg delegate:self];
    if (self != nil) {
        self.delgateObject=delegateArg;
    }
    return self;
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   if ([setIdentifier isEqualToString:@"MainMenuList"]) {
        [self.delgateObject receivedMainMenuResponse:urlData];
    } else
        if ([setIdentifier isEqualToString:@"CategoryList"]) {
            [self.delgateObject categoryListResponse:urlData];
        }else
    if ([setIdentifier isEqualToString:@"SubCategoryList"]) {
            [self.delgateObject subcategoryListResponse:urlData];
    }//else
//                if ([setIdentifier isEqualToString:@"topHits"]) {
//                    [self.delgateObject receivedHitsResponse:urlData];
//                }else
//                    if ([setIdentifier isEqualToString:@"forgotPassword"]) {
//                        [self.delgateObject forgetPwdResponse:urlData];
//                    }else
//                        if ([setIdentifier isEqualToString:@"listMessage"]) {
//                            [self.delgateObject messageListResponse:urlData];
//                        }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:
(NSError *)error
{
    
   // NSString *localerror=[error localizedDescription];
    //NSString *strerror=NSLocalizedString(localerror, nil);
    if (![setIdentifier isEqualToString:@"synchrequest"]){
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	if(!urlData){
        urlData = [[NSMutableData alloc] init];
        [urlData setLength:0];
    }
    [urlData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[urlData setLength:0];
}


@end
