//
//  OnOffEvent.m
//  Geo
//
//  Created by Iftekhar 10 on 5/14/13.
//
//

#import "IQDeviceLockEvent.h"
#import <notify.h>

//Global lockState. Because device lock state is common for whole app.
IQDeviceLockState lockState = IQdeviceLockStateUnlocked;

NSString *const IQDeviceLockStateDidChangeNotification  =   @"IQDeviceLockStateDidChangeNotification";

NSString *const IQDeviceLockStateKey            =   @"IQDeviceLockState";

@implementation IQDeviceLockEvent

+(void)load
{
    int notifyToken;
    notify_register_dispatch("com.apple.springboard.lockstate", &notifyToken, dispatch_get_main_queue(), ^(int token){
        uint64_t state = 0;
        notify_get_state(token, &state);
        
        lockState = (IQDeviceLockState)state;
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInteger:lockState],IQDeviceLockStateKey,
                              nil];

        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:IQDeviceLockStateDidChangeNotification object:nil userInfo:dict];
        });
    });
}

+(IQDeviceLockState)lockState
{
    return lockState;
}

@end
