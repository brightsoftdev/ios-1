#import "OpenALManager.h"


@implementation OpenALManager

@synthesize sources;


static OpenALManager * openALManagerInstance = NULL;

+ (OpenALManager *)instance {
	if( openALManagerInstance == NULL ) {
		openALManagerInstance = [[self alloc] init];
	}
	return openALManagerInstance;
}


-(id)init {
	if( self = [super init] ) {
		sources = [[NSMutableDictionary alloc] init];
		device = alcOpenDevice(NULL);
		if( device ) {
			context = alcCreateContext( device, NULL );
			alcMakeContextCurrent( context );
		}
	}
	return self;
}


- (void)dealloc {
	alcDestroyContext( context );
	alcCloseDevice( device );
	[super dealloc];
}

@end
