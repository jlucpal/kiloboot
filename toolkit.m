function varargout = toolkit(varargin)
% TOOLKIT MATLAB code for toolkit.fig
%      TOOLKIT, by itself, creates a new TOOLKIT or raises the existing
%      singleton*.
%
%      H = TOOLKIT returns the handle to a new TOOLKIT or the handle to
%      the existing singleton*.
%
%      TOOLKIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOOLKIT.M with the given input arguments.
%
%      TOOLKIT('Property','Value',...) creates a new TOOLKIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before toolkit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to toolkit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help toolkit

% Last Modified by GUIDE v2.5 01-Aug-2016 18:07:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @toolkit_OpeningFcn, ...
                   'gui_OutputFcn',  @toolkit_OutputFcn, ...
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


% --- Executes just before toolkit is made visible.
function toolkit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to toolkit (see VARARGIN)

% Choose default command line output for toolkit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes toolkit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = toolkit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectfile.
function selectfile_Callback(hObject, eventdata, handles)
% hObject    handle to selectfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.data= uigetfile({'*.m';'*.txt'},'Select file');
guidata(hObject, handles);


% --- Executes on button press in bootload.
function bootload_Callback(hObject, eventdata, handles)
% hObject    handle to bootload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in upload.
function upload_Callback(hObject, eventdata, handles)
% hObject    handle to upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
handles%    structure with handles and user data (see GUIDATA)
close(handles.pantalla);
%run(handles.data);

% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pantalla=figure;
guidata(hObject, handles);
run(handles.data);

% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sleep.
function sleep_Callback(hObject, eventdata, handles)
% hObject    handle to sleep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in voltage.
function voltage_Callback(hObject, eventdata, handles)
% hObject    handle to voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles

% --- Executes on button press in ledtoggle.
function ledtoggle_Callback(hObject, eventdata, handles)
% hObject    handle to ledtoggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in serialinput.
function serialinput_Callback(hObject, eventdata, handles)
% hObject    handle to serialinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in calibration.
function calibration_Callback(hObject, eventdata, handles)
% hObject    handle to calibration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
