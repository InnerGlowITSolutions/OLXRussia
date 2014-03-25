//
//  URLConnection.h
//  OLXRussia
//
//  Created by Rejo Joseph on 21/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLConnection : NSURLConnection {
	id delgateObject;
    NSMutableData *urlData;
    NSString *setIdentifier;
}

@property(nonatomic,retain)id delgateObject;
@property(nonatomic,retain)NSMutableData *urlData;
@property(nonatomic,retain)NSString *setIdentifier;

- (id) initWithMethodNameRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg identifier:(NSString *)checkIdentity;
- (id) initWithMethodRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg;

@end