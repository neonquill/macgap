#import "Defaults.h"

@implementation Defaults

- (id) init {
    if (self = [super init]) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }

    return self;
}

// Look up an arbitrary key queried from javascript.
// http://www.cimgf.com/2008/04/15/cocoa-tutorial-get-the-most-out-of-key-value-coding-and-observing/
- (id) valueForUndefinedKey:(NSString*) key {
    id value = [self.userDefaults objectForKey:key];
    return value;
}

// Set an arbitrary key.
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [self.userDefaults setValue:value forKey:key];
}

// Apparently this has to be defined for valueForUndefinedKey to work.
// https://lists.webkit.org/pipermail/webkit-dev/2009-November/010567.html
- (id)invokeUndefinedMethodFromWebScript:(NSString *)name withArguments:(NSArray *)args {
    return nil;
}

#pragma mark WebScripting Protocol

/* checks whether a selector is acceptable to be called from JavaScript */
+ (BOOL) isSelectorExcludedFromWebScript:(SEL)selector
{
    return NO;
}

// right now exclude all properties (eg keys)
+ (BOOL) isKeyExcludedFromWebScript:(const char*)name
{
	return NO;
}

@end
