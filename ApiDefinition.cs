using System;
using Foundation;
using ObjCRuntime;

namespace EventKitPermissions {
    [BaseType(typeof(NSObject))]
    interface EventKitPermissionsWrapper {
        
        [Export("authorizationStatusForEvents")]
        long AuthorizationStatusForEvents();

        [Export("authorizationStatusForReminders")]
        long AuthorizationStatusForReminders();
        
        [Export("requestFullAccessToEventsWithCompletion:")]
        void RequestFullAccessToEvents(Action<bool, NSError> completion);
        
        [Export("requestWriteOnlyAccessToEventsWithCompletion:")]
        void RequestWriteOnlyAccessToEvents(Action<bool, NSError> completion);
        
        [Export("requestFullAccessToRemindersWithCompletion:")]
        void RequestFullAccessToReminders(Action<bool, NSError> completion);
    }
}
