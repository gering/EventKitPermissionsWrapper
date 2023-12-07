//
//  EventKitPermissionsWrapper.h
//  EventKitPermissionsWrapper
//
//  Created by Robert Gering on 06.12.23.
//

#import <Foundation/Foundation.h>
#import <EventKit/EKEventStore.h>

typedef NS_ENUM(NSInteger, AuthorizationStatus) {
    AuthorizationStatusNotDetermined = 0,
    AuthorizationStatusRestricted,
    AuthorizationStatusDenied,
    AuthorizationStatusAuthorized
};

@interface EventKitPermissionsWrapper : NSObject

- (AuthorizationStatus)authorizationStatusForEvents;
- (AuthorizationStatus)authorizationStatusForReminders;
- (void)requestFullAccessToEventsWithCompletion:(void (^)(BOOL granted, NSError *error))completion;
- (void)requestWriteOnlyAccessToEventsWithCompletion:(void (^)(BOOL granted, NSError *error))completion;
- (void)requestFullAccessToRemindersWithCompletion:(void (^)(BOOL granted, NSError *error))completion;

@end
