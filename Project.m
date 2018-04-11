function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 11-Apr-2018 15:56:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_OutputFcn, ...
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


% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


    set(handles.radiobutton_tv, 'Value', 0);
    set(handles.radiobutton_fft, 'Value', 0);
    set(handles.radiobutton_psd, 'Value', 0);
    set(handles.radiobutton_spectrogram, 'Value', 0);
    set(handles.radiobutton_lowpass, 'Value', 0);
    set(handles.radiobutton_highpass, 'Value', 0);
    set(handles.radiobutton_bandpass, 'Value', 0);
    set(handles.uipanel_spectrogram,'Visible','Off');


global x T fs t dt signal CHECK nakladkowanie lw;
nakladkowanie = 50;
lw = 50;
zoom 'on'
fs = 100;
T = 100;
dt = 1/fs;
CHECK = 0;
t=0:dt:T;
x = sin(2*pi*10 * t) + 0.05 * t;

signal = x;


% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_filter.
function pushbutton_filter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.axes1
imshow('placeholder.jpg')
    set(handles.radiobutton_lowpass, 'Value', 0);
    set(handles.radiobutton_highpass, 'Value', 0);
    set(handles.radiobutton_bandpass, 'Value', 0);
    set(handles.uipanel_filter,'Visible','Off');


% --- Executes on button press in pushbutton_detrend.
function pushbutton_detrend_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal fs T nakladkowanie lw;
global view
signal = detrending(signal);
rysuj(signal,t,fs,T,view, hObject, eventdata, handles,nakladkowanie, lw);

% --- Executes on button press in pushbutton_int.
function pushbutton_int_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.axes1
global t signal fs T;
global view nakladkowanie lw;
signal = cumtrapz(t,signal);
signal = filtrowanie(signal,fs);
signal(1:T/10*fs) = 0;
rysuj(signal,t,fs,T,view, hObject, eventdata, handles,nakladkowanie, lw);


% --- Executes on button press in pushbutton_diff.
function pushbutton_diff_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_diff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.axes1
imshow('placeholder.jpg')

% --- Executes when selected object is changed in uibuttongroup_view.
function uibuttongroup_view_SelectionChangedFcn(hObject, eventdata, handles)
global x T fs t dt signal;
global view
global nakladkowanie lw;
view = get(eventdata.NewValue, 'Tag');
if strcmp(view,'radiobutton_spectrogram')
    set(handles.uipanel_spectrogram,'Visible','On');
        set(handles.uipanel_filter,'Visible','Off');
else
rysuj(signal,t,fs,T,view, hObject, eventdata, handles,nakladkowanie, lw);
end
% hObject    handle to the selected object in uibuttongroup_view 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup_filtering.
function uibuttongroup_filtering_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup_filtering 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel_filter,'Visible','On');
set(handles.uipanel_spectrogram,'Visible','Off');

type = get(eventdata.NewValue, 'Tag');
if strcmp(type,'radiobutton_lowpass')
    set(handles.text2,'Visible','Off');
    set(handles.edit2,'Visible','Off');
    set(handles.text1,'String','Stopband frequency');
elseif strcmp(type,'radiobutton_highpass')
    set(handles.text2,'Visible','Off');
    set(handles.edit2,'Visible','Off');
    set(handles.text1,'String','Passband frequency');

elseif strcmp(type,'radiobutton_bandpass')
    set(handles.text2,'Visible','On');
    set(handles.edit2,'Visible','On');
    set(handles.text1,'String','Passband frequency');
    set(handles.text2,'String','Stopband frequency');

end

% --- Executes on button press in pushbutton_restore.
function pushbutton_restore_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal x fs T;
global view nakladkowanie lw;
signal = x;
rysuj(signal,t,fs,T,view, hObject, eventdata, handles, nakladkowanie, lw);



function edit_freq_Callback(hObject, eventdata, handles)
% hObject    handle to edit_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_freq as text
%        str2double(get(hObject,'String')) returns contents of edit_freq as a double


% --- Executes during object creation, after setting all properties.
function edit_freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_record.
function pushbutton_record_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x T fs t dt signal;

time = str2num(handles.edit_duration.String);
Fs = str2num(handles.popupmenu_f.String);
nr = get(handles.popupmenu_f,'Value');

Fs=Fs(nr);
recObj = audiorecorder(8000,16,1);
recordblocking(recObj, time);
x = getaudiodata(recObj);
%x=x(1:length(t));
x = resample(x,Fs,8000);
fs = Fs;
dt = 1/fs;
T=time;
t=0:dt:T;
t=t(1:length(t)-1);

signal = x;

plot(t,signal);


function edit_duration_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration as text
%        str2double(get(hObject,'String')) returns contents of edit_duration as a double


% --- Executes during object creation, after setting all properties.
function edit_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_file.
function pushbutton_file_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x T fs t dt signal;

[FileName,PathName] = uigetfile('*.wav','Select a .wav file');
[y,Faudio] = audioread([PathName FileName]);

Fs = str2num(handles.popupmenu_f.String);
nr = get(handles.popupmenu_f,'Value');

Fs=Fs(nr);

x = y(:,1);
fs = Fs;

%x=x(1:length(t));
x = resample(x,fs,Faudio);
T=length(y)/Faudio;
dt=1/fs;

t=0:dt:T;
t=t(1:length(t));

signal = x;


% --- Executes on button press in pushbutton_play.
function pushbutton_play_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal
global fs
global CHECK

if (CHECK == 0)
        fplay=44800;

    xplay= resample(signal,fplay,fs);
soundsc(xplay,fplay)
CHECK = 1;
else
    clear sound;
    CHECK = 0;
end


% --- Executes on selection change in popupmenu_f.
function popupmenu_f_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_f contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_f


% --- Executes during object creation, after setting all properties.
function popupmenu_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_lw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_lw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_lw as text
%        str2double(get(hObject,'String')) returns contents of edit_lw as a double


% --- Executes during object creation, after setting all properties.
function edit_lw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_lw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_overlap_Callback(hObject, eventdata, handles)
% hObject    handle to edit_overlap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_overlap as text
%        str2double(get(hObject,'String')) returns contents of edit_overlap as a double


% --- Executes during object creation, after setting all properties.
function edit_overlap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_overlap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_draw_spec.
function pushbutton_draw_spec_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_draw_spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal x fs T;
global view nakladkowanie lw;
set(handles.uipanel_spectrogram,'Visible','Off');


    lw = str2num(handles.edit_lw.String);
    nakladkowanie = str2num(handles.edit_overlap.String);
    lw = lw * T / 100;
rysuj(signal,t,fs,T,view, hObject, eventdata, handles, nakladkowanie, lw);
