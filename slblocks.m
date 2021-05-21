function blkStruct = slblocks
% This function specifies that the library 'ssrlib'
% should appear in the Library Browser with the 
% name 'Smooth step/ramp'

    Browser.Library = 'ssrlib';
    % 'ssrlib' is the name of the library

    Browser.Name = 'Smooth step/ramp';
    % 'Smooth step/ramp' is the library name that appears
    % in the Library Browser

    blkStruct.Browser = Browser;