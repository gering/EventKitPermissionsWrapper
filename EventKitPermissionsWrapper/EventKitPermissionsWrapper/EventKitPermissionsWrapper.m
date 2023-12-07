//
//  EventKitPermissionsWrapper.m
//  EventKitPermissionsWrapper
//
//  Created by Robert Gering on 06.12.23.
//

#import "EventKitPermissionsWrapper.h"

@interface EventKitPermissionsWrapper ()
@property (retain) EKEventStore *eventStore;
@end


@implementation EventKitPermissionsWrapper

@synthesize eventStore;

- (id)init {
    self = [super init];
    if (self) {
        eventStore = [[EKEventStore alloc] init];
    }
    return self;
}

- (AuthorizationStatus)authorizationStatusForEvents {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType: EKEntityTypeEvent];
    switch (status) {
        case EKAuthorizationStatusDenied:
            return AuthorizationStatusDenied;
        case EKAuthorizationStatusFullAccess:
            return AuthorizationStatusAuthorized;
        case EKAuthorizationStatusRestricted:
        case EKAuthorizationStatusWriteOnly:
            return AuthorizationStatusRestricted;
        default:
            return AuthorizationStatusNotDetermined;
    }
}

- (AuthorizationStatus)authorizationStatusForReminders {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType: EKEntityTypeReminder];
    switch (status) {
        case EKAuthorizationStatusDenied:
            return AuthorizationStatusDenied;
        case EKAuthorizationStatusFullAccess:
            return AuthorizationStatusAuthorized;
        case EKAuthorizationStatusRestricted:
        case EKAuthorizationStatusWriteOnly:
            return AuthorizationStatusRestricted;
        default:
            return AuthorizationStatusNotDetermined;
    }
}

- (void)requestFullAccessToEventsWithCompletion:(void (^)(BOOL granted, NSError *error))completion {
    if (@available(iOS 17, *)) {
        [eventStore requestFullAccessToEventsWithCompletion: completion];
    } else {
        // Fallback for iOS 16 and below
        [eventStore requestAccessToEntityType: EKEntityTypeEvent completion: completion];
    }
}

- (void)requestWriteOnlyAccessToEventsWithCompletion:(void (^)(BOOL granted, NSError *error))completion {
    if (@available(iOS 17, *)) {
        [eventStore requestWriteOnlyAccessToEventsWithCompletion: completion];
    } else {
        // Fallback for iOS 16 and below
        [eventStore requestAccessToEntityType: EKEntityTypeEvent completion: completion];
    }
}

- (void)requestFullAccessToRemindersWithCompletion:(void (^)(BOOL granted, NSError *error))completion {
    if (@available(iOS 17, *)) {
        [eventStore requestFullAccessToRemindersWithCompletion: completion];
    } else {
        // Fallback for iOS 16 and below
        [eventStore requestAccessToEntityType: EKEntityTypeReminder completion: completion];
    }
}

@end
