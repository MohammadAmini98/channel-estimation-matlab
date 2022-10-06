function varargout = basic_gui(varargin)
% BASIC_GUI MATLAB code for basic_gui.fig
%      BASIC_GUI, by itself, creates a new BASIC_GUI or raises the existing
%      singleton*.
%
%      H = BASIC_GUI returns the handle to a new BASIC_GUI or the handle to
%      the existing singleton*.
%
%      BASIC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BASIC_GUI.M with the given input arguments.
%
%      BASIC_GUI('Property','Value',...) creates a new BASIC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before basic_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to basic_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help basic_gui

% Last Modified by GUIDE v2.5 14-Apr-2021 21:26:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @basic_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @basic_gui_OutputFcn, ...
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


% --- Executes just before basic_gui is made visible.
function basic_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to basic_gui (see VARARGIN)

% Choose default command line output for basic_gui
handles.output = hObject;

handles.power=0;
handles.sample=1000;
handles.TimeSpread=100;

handles.NumberOfTaps=0;
handles.DelayOfTaps=0;
handles.center_freq=0;
handles.velocity=0; %m per sec
handles.TimeLable =0;
handles.delaytime=0;
handles.warn=0;
handles.warn2=0;
% Update handles structure
handles.g=zeros(handles.NumberOfTaps+1,handles.sample);
guidata(hObject, handles);

% UIWAIT makes basic_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = basic_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;










% --- Executes on button press in CARRY1.
function CARRY1_Callback(hObject, eventdata, handles)
% hObject    handle to CARRY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set (handles.CARRY2,'Value',0);
handles.center_freq = 900e6;
guidata(hObject,handles)


% --- Executes on button press in CARRY2.
function CARRY2_Callback(hObject, eventdata, handles)
% hObject    handle to CARRY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set (handles.CARRY1,'Value',0);
handles.center_freq= 1800e6;
guidata(hObject,handles);



function delay_Callback(hObject, eventdata, handles)
% hObject    handle to delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delay as text
%        str2double(get(hObject,'String')) returns contents of delay as a double
x = get(hObject,'String');
handles.DelayOfTaps=str2double(x);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function delay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







function tap_Callback(hObject, eventdata, handles)
% hObject    handle to tap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tap as text
%        str2double(get(hObject,'String')) returns contents of tap as a double
y = get(hObject,'String');
handles.NumberOfTaps=str2double(y);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function tap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed as text
%        str2double(get(hObject,'String')) returns contents of speed as a double
z = get(hObject,'String');
handles.velocity=str2double(z);
if(handles.velocity==0)
    handles.velocity=0.000001;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PLOt_Callback(hObject, eventdata, handles)
% hObject    handle to PLOt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fm=(handles.velocity*handles.center_freq)/3e8; 
fs = handles.sample / (handles.TimeSpread/1000);
fm=fm/fs ;
handles.TimeLable = 0:(handles.TimeSpread/handles.sample)...
    :(handles.TimeSpread-(handles.TimeSpread/handles.sample));
handles.delaytime = 0:handles.DelayOfTaps:(handles.NumberOfTaps*handles.DelayOfTaps);
[b,a]=butter(2,2*fm);
w=wgn(handles.NumberOfTaps+1,handles.sample,handles.power);

for i=1:handles.NumberOfTaps+1
    handles.g(i,:)=filter(b,a,w(i,:));
end
 surf(handles.TimeLable,handles.delaytime,handles.g);
                xlabel('time in ms');
                ylabel('delay in ns');
  handles.warn=0;
   handles.warn2=0;
guidata(hObject,handles);


% --- Executes on button press in spectrum.
function spectrum_Callback(hObject, eventdata, handles)
% hObject    handle to spectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.warn2==1)
     warndlg('please first click 3D_plot botton to update freq_spectrum');
end 
[m,n] = size(handles.g);
ff =[(-(n/2) +1 :n/2)]'.*(handles.sample/ (handles.TimeSpread/1000)) ./n;
plot(ff,...
  abs(fftshift(fft(handles.g(2,:))))./n);
 xlabel('Hz');
  ylabel('frequency in constant tau');
  handles.warn2=1;
 guidata(hObject,handles);


% --- Executes on button press in dpectrum_tau.
function dpectrum_tau_Callback(hObject, eventdata, handles)
% hObject    handle to dpectrum_tau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.warn==1)
     warndlg('please first click 3D_plot botton to update freq_spectrum');
end 
[m,n] = size(handles.g);
f = ([(-(m/2) +1 :m/2)]'.*(10e+9/handles.DelayOfTaps) ./m);
plot(f,...
  abs(fftshift(fft(handles.g(:,1))))./m);
 ylabel('frequency in constant t');
 xlabel('Hz');
 handles.warn=1;
 guidata(hObject,handles);
