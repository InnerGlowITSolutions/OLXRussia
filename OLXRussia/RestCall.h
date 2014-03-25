//
//  RestCall.h
//  OLXRussia
//
//  Created by Rejo Joseph on 21/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestCall : NSObject


+(NSMutableURLRequest *)getMainMenuList:(NSString * )urlStr;
+(NSMutableURLRequest *)getCategoryList:(NSString * )urlStr;


@end

