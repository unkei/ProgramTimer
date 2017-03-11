#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "iosidletimer.h"

void IosIdleTimer::setTimerDisabled() {
    [[UIApplication sharedApplication] setIdleTimerDisabled: YES];
}
