classdef StepOrder < Simulink.Mask.EnumerationBase
    %STEPORDER Summary of this class goes here
    %   Detailed explanation goes here
    enumeration
        Velocity (1, 'Velocity (1)')
        Acceleration (2, 'Acceleration (2)')
        Jerk (3, 'Jerk/Jolt (3)')
        Snap (4, 'Snap/Jounce (4)')
        Crackle (5, 'Crackle/Flounce (5)')
        Pop (6, 'Pop/Pounce (6)')
    end
end

