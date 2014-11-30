@interface MPAVController:NSObject {}

	- (unsigned int)_displayPlaybackState;
	- (void)endSeek;
@end


@interface MPMusicPlayerController:NSObject {}
  + (id)systemMusicPlayer;
	- (void)skipToNextItem;
  - (void)skipToPreviousItem;
@end

%hook MPAVController

-(void)endSeek {


	switch ( [self _displayPlaybackState] )
	{
   		case 4:
   		{	
        %orig;
  			[[MPMusicPlayerController systemMusicPlayer] skipToNextItem];
    		break;
      }
   		case 5:
    	{
      	%orig;
  			[[MPMusicPlayerController systemMusicPlayer] skipToPreviousItem];
    		break;
      }
   		default:
      {
    		%orig;
     		break; 
      } 
	}

}

%end