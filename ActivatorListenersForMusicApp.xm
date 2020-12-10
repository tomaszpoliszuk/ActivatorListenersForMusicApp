/* Activator Listeners for Music App
 * Copyright (C) 2020 Tomasz Poliszuk
 *
 * Activator Listeners for Music App is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Activator Listeners for Music App is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Activator Listeners for Music App. If not, see <https://www.gnu.org/licenses/>.
 */


#import <libactivator/libactivator.h>
#import <UIKit/UIKit.h>

@interface SBMediaController : NSObject
+ (id)sharedInstance;
- (bool)_sendMediaCommand:(unsigned int)arg1 options:(id)arg2;
- (bool)likeTrackForEventSource:(long long)arg1;
- (bool)banTrackForEventSource:(long long)arg1;
@end

@interface MPMusicPlayerController : NSObject
+ (id)iPodMusicPlayer;
- (long long)repeatMode;
- (void)setRepeatMode:(long long)arg1;
- (void)setShuffleMode:(long long)arg1;
- (double)currentPlaybackTime;
- (void)setCurrentPlaybackTime:(double)arg1;
@end

@interface ActivatorListenersForMusicAppLikeTrack : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppLikeTrack
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.liketrack"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBMediaController) sharedInstance] likeTrackForEventSource:nil];
}
@end

@interface ActivatorListenersForMusicAppDislikeTrack : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppDislikeTrack
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.disliketrack"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBMediaController) sharedInstance] banTrackForEventSource:nil];
}
@end

@interface ActivatorListenersForMusicAppBackwardSeekEnd : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppBackwardSeekEnd
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.backwardseekend"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBMediaController) sharedInstance] _sendMediaCommand:11 options:0];
}
@end

@interface ActivatorListenersForMusicAppBackwardSeekStart : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppBackwardSeekStart
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.backwardseekstart"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBMediaController) sharedInstance] _sendMediaCommand:10 options:0];
}
@end

@interface ActivatorListenersForMusicAppForwardSeekStart : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppForwardSeekStart
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.forwardseekstart"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBMediaController) sharedInstance] _sendMediaCommand:8 options:0];
}
@end

@interface ActivatorListenersForMusicAppForwardSeekEnd : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppForwardSeekEnd
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.forwardseekend"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBMediaController) sharedInstance] _sendMediaCommand:9 options:0];
}
@end

@interface ActivatorListenersForMusicAppRepeatOff : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppRepeatOff
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.repeatoff"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setRepeatMode:0];
}
@end

@interface ActivatorListenersForMusicAppRepeatOne : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppRepeatOne
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.repeatone"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setRepeatMode:2];
}
@end

@interface ActivatorListenersForMusicAppRepeatAll : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppRepeatAll
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.repeatall"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setRepeatMode:3];
}
@end

@interface ActivatorListenersForMusicAppShuffleOff : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppShuffleOff
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.shuffleoff"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setShuffleMode:0];
}
@end

@interface ActivatorListenersForMusicAppShuffleOn : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppShuffleOn
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.shuffleon"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setShuffleMode:2];
}
@end

@interface ActivatorListenersForMusicAppSkip05SecondsBackward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip05SecondsBackward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go05secondsbackward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime-5];
}
@end

@interface ActivatorListenersForMusicAppSkip05SecondsForward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip05SecondsForward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go05secondsforward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime+5];
}
@end

@interface ActivatorListenersForMusicAppSkip10SecondsBackward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip10SecondsBackward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go10secondsbackward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime-10];
}
@end

@interface ActivatorListenersForMusicAppSkip10SecondsForward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip10SecondsForward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go10secondsforward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime+10];
}
@end

@interface ActivatorListenersForMusicAppSkip15SecondsBackward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip15SecondsBackward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go15secondsbackward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime-15];
}
@end

@interface ActivatorListenersForMusicAppSkip15SecondsForward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip15SecondsForward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go15secondsforward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime+15];
}
@end

@interface ActivatorListenersForMusicAppSkip30SecondsBackward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip30SecondsBackward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go30secondsbackward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime-30];
}
@end

@interface ActivatorListenersForMusicAppSkip30SecondsForward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip30SecondsForward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go30secondsforward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime+30];
}
@end

@interface ActivatorListenersForMusicAppSkip45SecondsBackward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip45SecondsBackward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go45secondsbackward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime-45];
}
@end

@interface ActivatorListenersForMusicAppSkip45SecondsForward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip45SecondsForward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go45secondsforward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime+45];
}
@end

@interface ActivatorListenersForMusicAppSkip60SecondsBackward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip60SecondsBackward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go60secondsbackward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime-60];
}
@end

@interface ActivatorListenersForMusicAppSkip60SecondsForward : NSObject <LAListener>
@end
@implementation ActivatorListenersForMusicAppSkip60SecondsForward
+ (void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersformusicapp.go60secondsforward"];
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	double currentPlaybackTime = [[%c(MPMusicPlayerController) iPodMusicPlayer] currentPlaybackTime];
	[[%c(MPMusicPlayerController) iPodMusicPlayer] setCurrentPlaybackTime:currentPlaybackTime+60];
}
@end
