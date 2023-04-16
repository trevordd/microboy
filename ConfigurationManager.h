#import "cocos2d.h"

#import <Foundation/Foundation.h>

@interface ConfigurationManager : NSObject {
	NSString *pathAppConfig, *pathAppRuntimeConfig,*appFileElementAvailable;
    NSMutableDictionary *appConfigData,*appRuntimeData;
}

@property (readwrite) NSMutableDictionary *appConfigData;
@property (readwrite,nonatomic) NSMutableDictionary *appRuntimeData;

+(ConfigurationManager *)sharedConfigurationMgr;

- (void) pathSetup;

- (void) saveConfig;

- (void) substitueRuntimeSettings;

- (void) loadRuntimeConfig:(NSString*) file;

- (id) getConfigValue:(NSString*) key;

- (id) getConfigValueForSet:(NSString*) key andKey:(NSString*)set;

- (void) setConfigValue:(id) value forKey:(NSString*) key;

- (void) setRuntimeConfigValue:(id) value forKey:(NSString*) key forSet:(NSString *)set;

- (void) setRuntimeConfigValueFullSet:(id) value forKey:(NSString*) key;

- (id) getRuntimeConfigSet:(NSString*) key;

- (id) getRuntimeConfigElementForSet:(NSString*) set andKey:(NSString *)key;

- (NSString*) checkRuntimeFileExistance:(NSString*) file;

+ (id) allocWithZone:(NSZone *)zone;

+ (id) copyWithZone:(NSZone *)zone;

- (id) retain;

- (NSUInteger) retainCount;

- (void) release;

- (id) autorelease;

@end
