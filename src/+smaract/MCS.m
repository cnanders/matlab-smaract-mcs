classdef MCS < smaract.MCSAbstract
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Constant)

        % Constants pulled from the header file

        % general definitions
        SA_UNDEFINED = uint32(0)
        SA_FALSE = uint32(0)
        SA_TRUE = uint32(1)
        SA_DISABLED = uint32(0)
        SA_ENABLED = uint32(1)
        SA_FALLING_EDGE = uint32(0)
        SA_RISING_EDGE = uint32(1)
        SA_FORWARD = uint32(0)
        SA_BACKWARD = uint32(1)

        % component selectors
        SA_GENERAL = uint32(1)
        SA_DIGITAL_IN = uint32(2)
        SA_ANALOG_IN = uint32(3)
        SA_COUNTER = uint32(4)
        SA_CAPTURE_BUFFER = uint32(5)
        SA_COMMAND_QUEUE = uint32(6)
        SA_SOFTWARE_TRIGGER = uint32(7)
        SA_SENSOR = uint32(8)
        SA_MONITOR = uint32(9)

        % component sub selectors
        SA_EMERGENCY_STOP = uint32(1)
        SA_LOW_VIBRATION = uint32(2)

        SA_BROADCAST_STOP = uint32(4)
        SA_POSITION_CONTROL = uint32(5)

        SA_REFERENCE_SIGNAL = uint32(7)

        SA_POWER_SUPPLY = uint32(11)

        SA_SCALE = uint32(22)
        SA_ANALOG_AUX_SIGNAL = uint32(23)
        SA_QUIET_MODE = uint32(24)

        % component properties
        SA_OPERATION_MODE = uint32(1)
        SA_ACTIVE_EDGE = uint32(2)
        SA_TRIGGER_SOURCE = uint32(3)
        SA_SIZE = uint32(4)
        SA_VALUE = uint32(5)
        SA_CAPACITY = uint32(6)
        SA_DIRECTION = uint32(7)
        SA_SETPOINT = uint32(8)
        SA_P_GAIN = uint32(9)
        SA_P_RIGHT_SHIFT = uint32(10)
        SA_I_GAIN = uint32(11)
        SA_I_RIGHT_SHIFT = uint32(12)
        SA_D_GAIN = uint32(13)
        SA_D_RIGHT_SHIFT = uint32(14)
        SA_ANTI_WINDUP = uint32(15)
        SA_PID_LIMIT = uint32(16)
        SA_FORCED_SLIP = uint32(17)

        SA_THRESHOLD = uint32(38)
        SA_DEFAULT_OPERATION_MODE = uint32(45)

        SA_OFFSET = uint32(47)
        SA_DISTANCE_TO_REF_MARK = uint32(48)
        SA_REFERENCE_SPEED = uint32(49)

        % operation mode property values for SA_EMERGENCY_STOP sub selector
        SA_ESM_NORMAL = uint32(0)
        SA_ESM_RESTRICTED = uint32(1)
        SA_ESM_DISABLED = uint32(2)
        SA_ESM_AUTO_RELEASE = uint32(3)

        % configuration flags for SA_InitDevices
        SA_SYNCHRONOUS_COMMUNICATION = uint32(0)
        SA_ASYNCHRONOUS_COMMUNICATION = uint32(1)
        SA_HARDWARE_RESET = uint32(2)

        % return values from SA_GetInitState
        SA_INIT_STATE_NONE = uint32(0)
        SA_INIT_STATE_SYNC = uint32(1)
        SA_INIT_STATE_ASYNC = uint32(2)

        % return values for SA_GetChannelType
        SA_POSITIONER_CHANNEL_TYPE = uint32(0)
        SA_END_EFFECTOR_CHANNEL_TYPE = uint32(1)

        % Hand Control Module modes for SA_SetHCMEnabled
        SA_HCM_DISABLED = uint32(0)
        SA_HCM_ENABLED = uint32(1)
        SA_HCM_CONTROLS_DISABLED = uint32(2)

        % configuration values for SA_SetBufferedOutput_A
        SA_UNBUFFERED_OUTPUT = uint32(0)
        SA_BUFFERED_OUTPUT = uint32(1)

        % configuration values for SA_SetStepWhileScan_X
        SA_NO_STEP_WHILE_SCAN = uint32(0)
        SA_STEP_WHILE_SCAN = uint32(1)

        % configuration values for SA_SetAccumulateRelativePositions_X
        SA_NO_ACCUMULATE_RELATIVE_POSITIONS = uint32(0)
        SA_ACCUMULATE_RELATIVE_POSITIONS = uint32(1)

        % configuration values for SA_SetSensorEnabled_X
        SA_SENSOR_DISABLED = uint32(0)
        SA_SENSOR_ENABLED = uint32(1)
        SA_SENSOR_POWERSAVE = uint32(2)

        % movement directions for SA_FindReferenceMark_X
        SA_FORWARD_DIRECTION = uint32(0)
        SA_BACKWARD_DIRECTION = uint32(1)
        SA_FORWARD_BACKWARD_DIRECTION = uint32(2)
        SA_BACKWARD_FORWARD_DIRECTION = uint32(3)
        SA_FORWARD_DIRECTION_ABORT_ON_ENDSTOP = uint32(4)
        SA_BACKWARD_DIRECTION_ABORT_ON_ENDSTOP = uint32(5)
        SA_FORWARD_BACKWARD_DIRECTION_ABORT_ON_ENDSTOP = uint32(6)
        SA_BACKWARD_FORWARD_DIRECTION_ABORT_ON_ENDSTOP = uint32(7)

        % configuration values for SA_FindReferenceMark_X
        SA_NO_AUTO_ZERO = uint32(0)
        SA_AUTO_ZERO = uint32(1)

        % return values for SA_GetPhyscialPositionKnown_X
        SA_PHYSICAL_POSITION_UNKNOWN = uint32(0)
        SA_PHYSICAL_POSITION_KNOWN = uint32(1)

        % infinite timeout for functions that wait
        SA_TIMEOUT_INFINITE = uint32(0)

        % sensor types for SA_SetSensorType_X and SA_GetSensorType_X
        SA_NO_SENSOR_TYPE = uint32(0)
        SA_S_SENSOR_TYPE = uint32(1)
        SA_SR_SENSOR_TYPE = uint32(2)
        SA_ML_SENSOR_TYPE = uint32(3)
        SA_MR_SENSOR_TYPE = uint32(4)
        SA_SP_SENSOR_TYPE = uint32(5)
        SA_SC_SENSOR_TYPE = uint32(6)
        SA_M25_SENSOR_TYPE = uint32(7)
        SA_SR20_SENSOR_TYPE = uint32(8)
        SA_M_SENSOR_TYPE = uint32(9)
        SA_GC_SENSOR_TYPE = uint32(10)
        SA_GD_SENSOR_TYPE = uint32(11)
        SA_GE_SENSOR_TYPE = uint32(12)
        SA_RA_SENSOR_TYPE = uint32(13)
        SA_GF_SENSOR_TYPE = uint32(14)
        SA_RB_SENSOR_TYPE = uint32(15)
        SA_G605S_SENSOR_TYPE = uint32(16)
        SA_G775S_SENSOR_TYPE = uint32(17)
        SA_SC500_SENSOR_TYPE = uint32(18)
        SA_G955S_SENSOR_TYPE = uint32(19)
        SA_SR77_SENSOR_TYPE = uint32(20)
        SA_SD_SENSOR_TYPE = uint32(21)
        SA_R20ME_SENSOR_TYPE = uint32(22)
        SA_SR2_SENSOR_TYPE = uint32(23)
        SA_SCD_SENSOR_TYPE = uint32(24)
        SA_SRC_SENSOR_TYPE = uint32(25)
        SA_SR36M_SENSOR_TYPE = uint32(26)
        SA_SR36ME_SENSOR_TYPE = uint32(27)
        SA_SR50M_SENSOR_TYPE = uint32(28)
        SA_SR50ME_SENSOR_TYPE = uint32(29)
        SA_G1045S_SENSOR_TYPE = uint32(30)
        SA_G1395S_SENSOR_TYPE = uint32(31)
        SA_MD_SENSOR_TYPE = uint32(32)
        SA_G935M_SENSOR_TYPE = uint32(33)
        SA_SHL20_SENSOR_TYPE = uint32(34)
        SA_SCT_SENSOR_TYPE = uint32(35)
        SA_SR77T_SENSOR_TYPE = uint32(36)
        SA_SR120_SENSOR_TYPE = uint32(37)
        SA_LC_SENSOR_TYPE = uint32(38)
        SA_LR_SENSOR_TYPE = uint32(39)
        SA_LCD_SENSOR_TYPE = uint32(40)
        SA_L_SENSOR_TYPE = uint32(41)
        SA_LD_SENSOR_TYPE = uint32(42)
        SA_LE_SENSOR_TYPE = uint32(43)
        SA_LED_SENSOR_TYPE = uint32(44)
        SA_GDD_SENSOR_TYPE = uint32(45)
        SA_GED_SENSOR_TYPE = uint32(46)
        SA_G935S_SENSOR_TYPE = uint32(47)
        SA_G605DS_SENSOR_TYPE = uint32(48)
        SA_G775DS_SENSOR_TYPE = uint32(49)
        SA_G605L_SENSOR_TYPE = uint32(50)
        SA_G775L_SENSOR_TYPE = uint32(51)
        SA_G935L_SENSOR_TYPE = uint32(52)
        SA_G605LE_SENSOR_TYPE = uint32(53)
        SA_G775LE_SENSOR_TYPE = uint32(54)
        SA_G935LE_SENSOR_TYPE = uint32(55)
        SA_SI160_SENSOR_TYPE = uint32(56)

        % end effector types for SA_SetEndEffectorType_X and SA_GetEndEffectorType_X
        SA_ANALOG_SENSOR_END_EFFECTOR_TYPE = uint32(0)
        SA_GRIPPER_END_EFFECTOR_TYPE = uint32(1)
        SA_FORCE_SENSOR_END_EFFECTOR_TYPE = uint32(2)
        SA_FORCE_GRIPPER_END_EFFECTOR_TYPE = uint32(3)

        % packet types for asynchronous mode
        SA_NO_PACKET_TYPE = uint32(0)
        SA_ERROR_PACKET_TYPE = uint32(1)
        SA_POSITION_PACKET_TYPE = uint32(2)
        SA_COMPLETED_PACKET_TYPE = uint32(3)
        SA_STATUS_PACKET_TYPE = uint32(4)
        SA_ANGLE_PACKET_TYPE = uint32(5)
        SA_VOLTAGE_LEVEL_PACKET_TYPE = uint32(6)
        SA_SENSOR_TYPE_PACKET_TYPE = uint32(7)
        SA_SENSOR_ENABLED_PACKET_TYPE = uint32(8)
        SA_END_EFFECTOR_TYPE_PACKET_TYPE = uint32(9)
        SA_GRIPPER_OPENING_PACKET_TYPE = uint32(10)
        SA_FORCE_PACKET_TYPE = uint32(11)
        SA_MOVE_SPEED_PACKET_TYPE = uint32(12)
        SA_PHYSICAL_POSITION_KNOWN_PACKET_TYPE = uint32(13)
        SA_POSITION_LIMIT_PACKET_TYPE = uint32(14)
        SA_ANGLE_LIMIT_PACKET_TYPE = uint32(15)
        SA_SAFE_DIRECTION_PACKET_TYPE = uint32(16)
        SA_SCALE_PACKET_TYPE = uint32(17)
        SA_MOVE_ACCELERATION_PACKET_TYPE = uint32(18)
        SA_CHANNEL_PROPERTY_PACKET_TYPE = uint32(19)
        SA_CAPTURE_BUFFER_PACKET_TYPE = uint32(20)
        SA_TRIGGERED_PACKET_TYPE = uint32(21)
        SA_POSITIONER_TYPE_PACKET_TYPE = uint32(22)
        SA_INVALID_PACKET_TYPE = uint32(255)

        % channel status codes
        SA_STOPPED_STATUS = uint32(0)
        SA_STEPPING_STATUS = uint32(1)
        SA_SCANNING_STATUS = uint32(2)
        SA_HOLDING_STATUS = uint32(3)
        SA_TARGET_STATUS = uint32(4)
        SA_MOVE_DELAY_STATUS = uint32(5)
        SA_CALIBRATING_STATUS = uint32(6)
        SA_FINDING_REF_STATUS = uint32(7)
        SA_OPENING_STATUS = uint32(8)

        % compatibility definitions
        SA_NO_REPORT_ON_COMPLETE = uint32(0)
        SA_REPORT_ON_COMPLETE = uint32(1)

        % invalid system index for SA_GetPositionerTypeList,
        % SA_GetPositionerTypeName and SA_GetPositionerTypeProperty
        SA_INVALID_SYSTEM_INDEX =                     -1

        % positioner type info properties
        SA_MOVEMENT_TYPE_POS_INFO = uint32(1)
        SA_REFERENCE_TYPE_POS_INFO = uint32(2)

        % movement types
        SA_LINEAR_MOVEMENT_TYPE = uint32(0)
        SA_ROTATORY_MOVEMENT_TYPE = uint32(1)

        % reference types
        SA_NO_REF_TYPE = uint32(0)
        SA_END_STOP_REF_TYPE = uint32(1)
        SA_SINGLE_CODED_REF_TYPE = uint32(2)
        SA_DISTANCE_CODED_REF_TYPE = uint32(3)

    end
    
    properties (Access = private)
        
        % S
        % {char 1xm} tcp/ip host
        cHost = '192.168.20.24'
        cPort = '5000'
        
        cNameOfLib
        cPathDll
        cPathHeader
        
        u32Index % {uint 32 1x1} a libpointer is passed into SA_OpenSystem and populated with a uint32
        
        lDebug = false
    end
    
    methods
        function this = MCS(varargin)
            
            this.setDefaultPathOfDllAndHeader();

            for k = 1 : 2: length(varargin)
                this.msg(sprintf('passed in %s', varargin{k}));
                if this.hasProp( varargin{k})
                    this.msg(sprintf('settting %s', varargin{k}));
                    this.(varargin{k}) = varargin{k + 1};
                end
            end
            
            this.init()
        end
        
        
        
        

        
        %@param {uint32} absolute position to move to in nm
        function goToPositionAbsolute(this, u32Channel, u32Position)
            
            
             if (this.getIsMoving(u32Channel))
                 return
             end
            
%             % holdTime (unsigned 32bit), input - Specifies how long (in milliseconds) the position is actively held 
% after reaching the target. The valid range is 0..60,000. A 0 deactivates this feature, a value of 60,000 
% is infinite (until manually stopped, see SA_Stop_S)

            u32HoldTimeSeconds = uint32(60000);
            
            u32Status  = calllib(...
                this.cNameOfLib, ...
                'SA_GotoPositionAbsolute_S', ...
                this.u32Index, ...
                u32Channel, ...
                u32Position, ...
                u32HoldTimeSeconds ...
            );
        
            this.printStatusOfError(u32Status);
            
        end
        
        
        function findReferenceMark(this, u32Channel)

            u32HoldTimeSeconds = uint32(0);
            u32Status  = calllib(...
                this.cNameOfLib, ...
                'SA_FindReferenceMark_S', ...
                this.u32Index, ...
                u32Channel, ...
                this.SA_FORWARD_DIRECTION, ...
                u32HoldTimeSeconds, ...
                this.SA_AUTO_ZERO ...
            );
        
            this.printStatusOfError(u32Status);

        end

        
        function l = getIsReferenced(this, u32Channel)
            
            [u32Status, u32Known]  = calllib(...
                this.cNameOfLib, ...
                'SA_GetPhysicalPositionKnown_S', ...
                this.u32Index, ...
                u32Channel, ....
                0 ... % u32 pointer required
            );
        
            this.printStatusOfError(u32Status);
            l = u32Known == this.SA_PHYSICAL_POSITION_KNOWN;
            
        end
        
        
        function l = getIsMoving(this, u32Channel)
            u32Status = this.getStatusOfMovement(u32Channel);
            l = false;
            if (...
                u32Status == this.SA_TARGET_STATUS || ... 
                u32Status == this.SA_STEPPING_STATUS || ...
                u32Status == this.SA_SCANNING_STATUS ...
            ) 
                l = true;
            end
        end
        
        % returns the position of the sensor in nm
        function u32Position = getPosition(this, u32Channel)
            
            [u32Status, u32Position]  = calllib(...
                this.cNameOfLib, ...
                'SA_GetPosition_S', ...
                this.u32Index, ...
                u32Channel, ....
                0 ... % pointer required
            );
        
            this.printStatusOfError(u32Status);
            
        end
        
        function runTest(this)
            
            this.getSystemLocator();
            this.getSensorEnabled();
            
        end
        
        function delete(this)
            
            this.closeSystem()
        end
        
        
        
        

    end
    
    methods (Access = protected)
        
        function c = getSystemLocator(this)
            
            % Need to have a buffer size of 30 to accommodate the
            % longest possible locator which is formatted as
            % network:xxx.xxx.xxx.xxx:yyyy
            
            [u32Status, c, u32Size] = calllib(...
                this.cNameOfLib, ...
                'SA_GetSystemLocator', ...
                this.u32Index, ...
                blanks(30), ...
                30 ...
             );
            
         
            this.printStatusOfError(u32Status);
            
            %{
            
            % Create a variable to store the location to be populated
            cLoc = blanks(30);  % empty char class
            
            % Create a pointer to the location
            ptrLoc = libpointer('stringPtr', cLoc);
            
            % Create a variable to store the size of the populated output
            % buffer
            size = 30;
            % Create a pointer to it
            ptrSize = libpointer('uint32Ptr', size);
            
            
            [u32Status, cString, ptrA]  = calllib(...
                this.cNameOfLib, ...
                'SA_GetSystemLocator', ...
                this.u32Index, ...
                ptrLoc, ...
                ptrSize ...
            )
            %}
                
            
        end
        
        
        
        function closeSystem(this)
            
            u32Status = calllib(...
                this.cNameOfLib, ...
                'SA_CloseSystem', ...
                this.u32Index ...
            );
        
            this.printStatusOfError(u32Status)

            
        end

       
        function printStatusOfMovement(this, u32Status)
       
            if (~this.lDebug) 
                return; 
            end
            
            switch u32Status
            case 0
                c = 'SA_STOPPED_STATUS';
            case 1
                c = 'SA_STEPPING_STATUS';
            case 2
                c = 'SA_SCANNING_STATUS';
            case 3 
                c = 'SA_HOLDING_STATUS';
            case 4
                c = 'SA_TARGET_STATUS';
            case 5
                c = 'SA_MOVE_DELAY_STATUS';
            case 6
                c = 'SA_CALIBRATING_STATUS';
            case 7
                c = 'SA_FINDING_REF_STATUS';
            case 8
                c = 'SA_OPENING_STATUS';
                
            end
            
            fprintf('Status of movement: %u, %s\n', u32Status, c);

        end
        
        function printSensorMode(this, u32Mode)
            
            if (~this.lDebug) 
                return; 
            end
           
            switch u32Mode
                case 0
                    c = 'SA_SENSOR_DISABLED';
                case 1
                    c = 'SA_SENSOR_ENABLED';
                case 2
                    c = 'SA_SENSOR_POWERSAVE';
            end
            fprintf('Sensor mode: %u, %s\n', u32Mode, c);
                    
            
        end
        
        function printStatusOfError(this, u32Status)
            
            if (~this.lDebug) 
                return; 
            end
            
            switch u32Status
            case 0
                c = 'SA_OK';
            case 1
                c = 'SA_INITIALIZATION_ERROR';
            case 2
                c = 'SA_NOT_INITIALIZED_ERROR';
            case 3
                c = 'SA_NO_SYSTEMS_FOUND_ERROR';                 
            case 4
                c = 'SA_TOO_MANY_SYSTEMS_ERROR';
            case 5
                c = 'SA_INVALID_SYSTEM_INDEX_ERROR';    
            case 6 
                c='SA_INVALID_CHANNEL_INDEX_ERROR';
            case 7 
                c='SA_TRANSMIT_ERROR';
            case 8 
                c='SA_WRITE_ERROR';
            case 9 
                c='SA_INVALID_PARAMETER_ERROR';
            case 10 
                c='SA_READ_ERROR';
            case 12 
                c='SA_INTERNAL_ERROR';
            case 13 
                c='SA_WRONG_MODE_ERROR';
            case 14 
                c='SA_PROTOCOL_ERROR';
            case 15 
                c='SA_TIMEOUT_ERROR';
            case 17 
                c='SA_ID_LIST_TOO_SMALL_ERROR';
            case 18 
                c='SA_SYSTEM_ALREADY_ADDED_ERROR';
            case 19 
                c='SA_WRONG_CHANNEL_TYPE_ERROR';
            case 20 
                c='SA_CANCELED_ERROR';
            case 21
                c='SA_INVALID_SYSTEM_LOCATOR_ERROR';
            case 22 
                c='SA_INPUT_BUFFER_OVERFLOW_ERROR';
            case 23 
                c='SA_QUERYBUFFER_SIZE_ERROR';
            case 24 
                c='SA_DRIVER_ERROR';
            case 25 
                c='SA_COMPATIBILITY_ERROR';
            case 128 
                c='SA_NO_SUCH_SLAVE_ERROR';
            case 129 
                c='SA_NO_SENSOR_PRESENT_ERROR';
            case 130
                 c='SA_AMPLITUDE_TOO_LOW_ERROR';
            case 131 
                c='SA_AMPLITUDE_TOO_HIGH_ERROR';
            case 132 
                c='SA_FREQUENCY_TOO_LOW_ERROR';
            case 133 
                c='SA_FREQUENCY_TOO_HIGH_ERROR';
            case 135 
                c='SA_SCAN_TARGET_TOO_HIGH_ERROR';
            case 136 
                c='SA_SCAN_SPEED_TOO_LOW_ERROR';
            case 137 
                c='SA_SCAN_SPEED_TOO_HIGH_ERROR';
            case 140 
                c='SA_SENSOR_DISABLED_ERROR';
            case 141 
                c='SA_COMMAND_OVERRIDDEN_ERROR';
            case 142
                 c='SA_END_STOP_REACHED_ERROR';
            case 143
                 c='SA_WRONG_SENSOR_TYPE_ERROR';
            case 144 
                c='SA_COULD_NOT_FIND_REF_ERROR';
            case 145 
                c='SA_WRONG_END_EFFECTOR_TYPE_ERROR';
            case 146 
                c='SA_MOVEMENT_LOCKED_ERROR';
            case 147 
                c='SA_RANGE_LIMIT_REACHED_ERROR';
            case 148 
                c='SA_PHYSICAL_POSITION_UNKNOWN_ERROR';
            case 149 
                c='SA_OUTPUT_BUFFER_OVERFLOW_ERROR';
            case 150 
                c='SA_COMMAND_NOT_PROCESSABLE_ERROR';
            case 151 
                c='SA_WAITING_FOR_TRIGGER_ERROR';
            case 152 
                c='SA_COMMAND_NOT_TRIGGERABLE_ERROR';
            case 153
                 c='SA_COMMAND_QUEUE_FULL_ERROR';
            case 154 
                c='SA_INVALID_COMPONENT_ERROR';
            case 155 
                c='SA_INVALID_SUB_COMPONENT_ERROR';
            case 156 
                c='SA_INVALID_PROPERTY_ERROR';
            case 157 
                c='SA_PERMISSION_DENIED_ERROR';
            case 160 
                c='SA_CALIBRATION_FAILED_ERROR';
            case 240 
                c='SA_UNKNOWN_COMMAND_ERROR';
            case 255 
                c='SA_OTHER_ERROR';
            end
            
            fprintf('Status: %u, %s\n', u32Status, c);


        end
        
        % Convert a relative directory path into a canonical path
        % i.e., C:\A\B\..\C becomes C:\A\C.  Uses java io interface
        
        function c = path2canonical(this, cPath)
           jFile = java.io.File(cPath);
           c = char(jFile.getCanonicalPath);
        end
        
        function setDefaultPathOfDllAndHeader(this)
            
            cDir = fileparts(mfilename('fullpath'));
            cDirSdk = fullfile(cDir, '..', '..', 'SDK');
            cArch = computer('arch');
            
            switch cArch
                case 'win64'
                    this.cNameOfLib = 'MCSControl'; % The name of the .dll file
                    this.cPathDll = fullfile(cDirSdk, 'lib64', 'MCSControl.dll');
                    this.cPathHeader = fullfile(cDirSdk, 'include', 'MCSControl.h');
                    
                otherwise
                    % Assume 32-bit
                    this.cNameOfLib = 'MCSControl'; % The name of the .dll file
                    this.cPathDll = fullfile(cDirSdk, 'lib', 'MCSControl.dll');
                    this.cPathHeader = fullfile(cDirSdk, 'include', 'MCSControl.h');
            end
            
            % convert to canonical
            this.cPathDll = this.path2canonical(this.cPathDll);
            this.cPathHeader = this.path2canonical(this.cPathHeader);
                        
            
       end

        
       function l = hasProp(this, c)
            
            l = false;
            if ~isempty(findprop(this, c))
                l = true;
            end
            
       end
       
       
        function msg(this, cMsg)
            fprintf('smaract.MCS %s\n', cMsg);
        end
       
        
        function init(this)
            
             if ~libisloaded(this.cNameOfLib)
                loadlibrary(...
                    this.cPathDll, ...
                    this.cPathHeader ...
                );
             end
            
             this.openSystem();
             this.setSensorEnabled(this.SA_SENSOR_POWERSAVE);
            
        end
        
        function u32StatusOfMovement = getStatusOfMovement(this, u32Channel)
            
            [u32Status, u32StatusOfMovement] = calllib(...
                this.cNameOfLib, ...
                'SA_GetStatus_S', ...
                this.u32Index, ...
                u32Channel, ...
                0 ...
            );

            this.printStatusOfError(u32Status);
            this.printStatusOfMovement(u32StatusOfMovement)
                    
        end
        
        % @return {uint32 1x1} SA_SENSOR_*
        function u32Mode = getSensorEnabled(this)
            
             [u32Status, u32Mode] = calllib(...
                this.cNameOfLib, ...
                'SA_GetSensorEnabled_S', ...
                this.u32Index, ...
                0 ... % pointer for value that will be populated
            );
        
            this.printStatusOfError(u32Status);
            this.printSensorMode(u32Mode);
            
        end

        % @param {uint32 1x1} SA_SENSOR_*
        function setSensorEnabled(this, u32Mode)
            
            u32Status  = calllib(...
                this.cNameOfLib, ...
                'SA_SetSensorEnabled_S', ...
                this.u32Index, ...
                u32Mode ...
            );
        
            this.printStatusOfError(u32Status);
            
        end
        
        function openSystem(this)
            
            % SA_OpenSystem
            cLocation = sprintf('network:%s:%s', this.cHost, this.cPort);
            cOptions = 'sync';  
            
            % IMPORTANT
            % if you use double quotes around characters, this is a
            % string class in matlab
            % - if you use single quotes around characters, this is a
            % char class in matlab.  
            
            % @return {double} dId - systemIndex (handle) to the system.  The
            % returned systemIndex must be saved within the application and
            % passed as a parameter to the API functions.
            
            % Per the MCS Programmers Guide, page 44,  SA_OpenSystem function
            % takes a pointer of type SA_INDEX,
            % the SA_INDEX type is defined in the header file as a type:
            % typedef unsigned int SA_INDEX;
            
            % Per the MCS Programmers Guide, page 44, SA_OpenSystem returns
            % a type SA_STATUS which is defined in the header file as 
            % typedef unsigned int SA_STATUS;

            
            % Create a variable to store the system index to be populated
            % by SA_OpenSystem
            u32Idx = 0;
            
            % Define a pointer to this variable
            ptrIndex = libpointer('uint32Ptr', u32Idx);
                    
            u32Status  = calllib(...
                this.cNameOfLib, ...
                'SA_OpenSystem', ...
                ptrIndex, ...
                cLocation, ...
                cOptions ...
            );
        
            if u32Status == uint32(0)
                this.msg('device opened successfully.');
                this.u32Index = ptrIndex.Value;
            else
                this.msg('error opening device.');
                this.printStatusOfError(u32Status);
            end
                        
            % use ptrIndex.Value to get value
            
        end

        
    end
    
end

