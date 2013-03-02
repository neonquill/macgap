#import "Defaults.h"

@implementation Defaults

- (id) init {
    if (self = [super init]) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }

    return self;
}

// Look up an arbitrary key queried from javascript.
- (id) valueForUndefinedKey:(NSString*) key {
    id value = [self.userDefaults objectForKey:key];
    return value;
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
