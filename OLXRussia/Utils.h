//
//  Utils.h
//  Tabbar
//
//  Created by railsfactory on 20/02/13.
//  Copyright (c) 2013 railsfactory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject{
    
}
+(void) showProgress;
+ (void) hideAlert;
+(void) showAlertMessage:(NSString *)message;
+(BOOL) validateEmail:(NSString *)emailAddress;
+(void)resetToken;
+(NSString *)get_time:(NSString *)param;
@end
