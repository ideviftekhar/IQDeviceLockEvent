//
//  OnOffEvent.h
//  Geo
//
//  Created by Iftekhar 10 on 5/14/13.
//
//

#import <Foundation/Foundation.h>

typedef enum
{
    IQdeviceLockStateUnlocked   =   0,
    IQDeviceLockStateLocked     =   1,
}IQDeviceLockState;


@interface IQDeviceLockEvent : NSObject

+(IQDeviceLockState)lockState;

@end


extern NSString *const IQDeviceLockStateDidChangeNotification;

extern NSString *const IQDeviceLockStateKey;
