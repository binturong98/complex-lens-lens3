function varargout = findFocusGui(varargin)
% GUIFIG M-file for guiFig.fig
%      GUIFIG, by itself, creates a new GUIFIG or raises the existing
%      singleton*.
%
%      H = GUIFIG returns the handle to a new GUIFIG or the handle to
%      the existing singleton*.
%
%      GUIFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIFIG.M with the given input arguments.
%
%      GUIFIG('Property','Value',...) creates a new GUIFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiFig_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiFig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiFig

% Last Modified by GUIDE v2.5 15-Jan-2012 15:10:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiFig_OpeningFcn, ...
                   'gui_OutputFcn',  @guiFig_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before guiFig is made visible.
function guiFig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiFig (see VARARGIN)

% Choose default command line output for guiFig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiFig wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = guiFig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%===================================================================
%creates objects within the gui
% --- Executes during object creation, after setting all properties.

function imageNumber_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function numbOfEval_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function outputFileName_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function beginn_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function end_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function filter_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%==========================================================================
%callback functions for the objects

%------TAKES input values of the variables

function imageNumber_Callback(hObject, eventdata, handles)

    global IMAGENUMBER; % number of image in sequence that will be shown for cropping

    IMAGENUMBER = str2double(get(hObject,'String')) %returns contents of Baselinewindow as a double

function numbOfEval_Callback(hObject, eventdata, handles)

    global NUMBOFEVAL; % rotate image so that the bars are horizontal by DEGREE degree (positive CCW, negative CW)
    
    NUMBOFEVAL = str2double(get(hObject,'String'))% returns contents of Responsewindow as a double


function beginn_Callback(hObject, eventdata, handles)

    global BEGINN; % first ID number of image Series
    
    BEGINN = str2double(get(hObject,'String')) %returns contents of RespColumn as a double

function end_Callback(hObject, eventdata, handles)

    global END; % last ID number of image Series

    END = str2double(get(hObject,'String')) %returns contents of StimColumn as a double

function filter_Callback(hObject, eventdata, handles)

    global FILTER; % absolute min gray scale value

    FILTER = str2double(get(hObject,'String'))% returns contents of OnThresh as a double

function outputFileName_Callback(hObject, eventdata, handles)

    global OUTPUTFILENAME; % desired name of output File without file extension
    
    OUTPUTFILENAME = get(hObject,'String')% returns contents of DataFile as a double


%==========================================================================
% BUTTON CALLBACKS

% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)

    do();
