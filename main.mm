#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <liblockdown.h>
#include <stdio.h>
 
int main(int argc, char *argv[]) {
	// FIXME: Do we need a NSAutoreleasePool here?
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	LockdownConnectionRef connection = lockdown_connect();
	
	CFStringRef udid = (CFStringRef)lockdown_copy_value(connection, NULL, kLockdownUniqueDeviceIDKey);
	CFShow(udid);
	
	lockdown_disconnect(connection);
	[pool drain];
	return 0;
}