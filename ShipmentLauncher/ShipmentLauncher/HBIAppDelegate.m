//
//  HBIAppDelegate.m
//  ShipmentLauncher
//
//  Created by Dallas Brown on 8/4/13.
//  Copyright (c) 2013 HashBang Industries. All rights reserved.
//

#import "HBIAppDelegate.h"

@implementation HBIAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Check if main app is already running; if yes, do nothing and terminate helper app
    BOOL alreadyRunning = NO;
	BOOL isActive = NO;
	
	NSArray *running = [[NSWorkspace sharedWorkspace] runningApplications];
	
	for (NSRunningApplication *app in running)
	{
        if ([[app bundleIdentifier] isEqualToString:@"com.hashbangind.shipment"])
		{
            alreadyRunning = YES;
			isActive = [app isActive];
        }
    }
	
    if (!alreadyRunning || !isActive)
	{
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSArray *p = [path pathComponents];
        NSMutableArray *pathComponents = [NSMutableArray arrayWithArray:p];
        [pathComponents removeLastObject];
        [pathComponents removeLastObject];
        [pathComponents removeLastObject];
		[pathComponents removeLastObject];

        NSString *newPath = [NSString pathWithComponents:pathComponents];
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObject:@"Shipment"], NSWorkspaceLaunchConfigurationArguments, nil];
        [[NSWorkspace sharedWorkspace] launchApplicationAtURL:[NSURL fileURLWithPath:newPath]
                                                      options:NSWorkspaceLaunchWithoutActivation
                                                configuration:dict
                                                        error:nil];
    }
	
    [NSApp terminate:nil];
}

@end
