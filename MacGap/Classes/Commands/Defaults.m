#import "Defaults.h"

@implementation Defaults

- (id) init {
    if (self = [super init]) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }

    return self;
}


- (NSData *)get:(NSString*)key {
    return [self.userDefaults objectForKey:key];
}

#pragma mark WebScripting Protocol

/* checks whether a selector is acceptable to be called from JavaScript */
+ (BOOL) isSelectorExcludedFromWebScript:(SEL)selector
{
    return NO;
}

+ (NSString*) webScriptNameForSelector:(SEL)selector
{
	id	result = nil;

	if (selector == @selector(get:)) {
		result = @"get";
    }

	return result;
}

// right now exclude all properties (eg keys)
+ (BOOL) isKeyExcludedFromWebScript:(const char*)name
{
	return NO;
}

@end
