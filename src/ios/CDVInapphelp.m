//Copyright (c) 2014 Inapphelp (http://inapphelp.com)
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

#import <Cordova/CDV.h>
#import "CDVInapphelp.h"
#import "CDVInapphelp.h"
#import "IAHHelpDesk.h"

@implementation CDVInapphelp

- (void)init:(CDVInvokedUrlCommand*)command{
    NSString* appId = [command.arguments objectAtIndex:0];
    NSString* appKey = [command.arguments objectAtIndex:1];
    NSString* company = [command.arguments objectAtIndex:2];
    [[IAHHelpDesk instance] initWithCompanyName:company withAppId:appId withAppKey:appKey];
}

- (void)setUserId:(CDVInvokedUrlCommand*)command {
    NSString* userId = [command.arguments objectAtIndex:0];
    [[IAHHelpDesk instance] setUserId:userId];
};

- (void)setUserSecret:(CDVInvokedUrlCommand*)command{
    NSString* userSecret = [command.arguments objectAtIndex:0];
    [[IAHHelpDesk instance] setUserSecret:userSecret];
};

- (void)showHelp:(CDVInvokedUrlCommand*)command{
    [[IAHHelpDesk instance] showHelp:[[[[UIApplication sharedApplication] delegate] window] rootViewController]];
};

- (void)handlePushNotification:(CDVInvokedUrlCommand*)command {
    NSDictionary* push = [command.arguments objectAtIndex:0];
    BOOL foreground = [command.arguments objectAtIndex:1];
    NSLog(foreground ? @"Yes foreground" : @"No foreground");
    [[IAHHelpDesk instance] handlePush:push withViewController:[[[[UIApplication sharedApplication] delegate] window] rootViewController] launchedFromPush:!foreground];
};

- (void)setPushToken:(CDVInvokedUrlCommand*)command{
    NSString* token = [command.arguments objectAtIndex:0];
    [[IAHHelpDesk instance] setPushTokenString:token];
};


@end
