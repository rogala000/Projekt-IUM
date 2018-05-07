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

% Last Modified by GUIDE v2.5 07-May-2018 14:11:04

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
    set(handles.uipanel_diff,'Visible','Off');
    set(handles.uipanel_save,'Visible','Off');
    set(handles.radiobutton_psd, 'Visible', 'Off');


global x T fs t dt signal CHECK nakladkowanie lw initial_t RODZAJ int_type;
nakladkowanie = 50;
RODZAJ = 1;
lw = 50;
zoom 'on'
fs = 100;
T = 10;
dt = 1/fs;
CHECK = 0;
t=0:dt:T;
x = sin(2*pi*10 * t) + 0.05 * t;
initial_t = t;
int_type = 'radiobutton_rectangles';
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
set(handles.uipanel_save,'Visible','On');


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
global t signal x fs T;
global view nakladkowanie lw filtertype;
type = filtertype;
if strcmp(type,'radiobutton_lowpass')
    stopband = str2num(handles.edit1.String);
    [signal,t] = filtering_lowpass(signal,fs, t, T, stopband);
elseif strcmp(type,'radiobutton_highpass')
    passband = str2num(handles.edit1.String);
    [signal,t] = filtering_highpass(signal,fs, t, T, passband);
elseif strcmp(type,'radiobutton_bandpass')
    passband = str2num(handles.edit2.String);
    stopband = str2num(handles.edit1.String);
    [signal,t] = filtering_passband(signal,fs, t, T, passband, stopband);
end
set(handles.uipanel_filter,'Visible','Off');
rysuj(signal,t,fs,T,view, hObject, eventdata, handles, nakladkowanie, lw);


% --- Executes on button press in pushbutton_detrend.
function pushbutton_detrend_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal fs T nakladkowanie lw;
global view
order = str2num(handles.edit_detrend.String);

    [signal] = kwadraty(signal,t,order);
rysuj(signal,t,fs,T,view, hObject, eventdata, handles,nakladkowanie, lw);

% --- Executes on button press in pushbutton_int.
function pushbutton_int_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal fs T nakladkowanie lw;
global view
global int_type
[signal, t] = calkowanie(signal, fs, t, int_type);
rysuj(signal,t,fs,T,view, hObject, eventdata, handles, nakladkowanie, lw);



% --- Executes on button press in pushbutton_diff.
function pushbutton_diff_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_diff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal x fs T;
global view
    set(handles.uipanel_diff,'Visible','On');
    set(handles.uipanel_filter,'Visible','Off');
    set(handles.uipanel_spectrogram,'Visible','Off');




% --- Executes when selected object is changed in uibuttongroup_view.
function uibuttongroup_view_SelectionChangedFcn(hObject, eventdata, handles)
global x T fs t dt signal;
global view
global nakladkowanie lw;
view = get(eventdata.NewValue, 'Tag');
if strcmp(view,'radiobutton_spectrogram')
    set(handles.uipanel_spectrogram,'Visible','On');
        set(handles.uipanel_filter,'Visible','Off');
        set(handles.uipanel_diff,'Visible','Off');

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
global filtertype
set(handles.uipanel_filter,'Visible','On');
set(handles.uipanel_spectrogram,'Visible','Off');
set(handles.uipanel_diff,'Visible','Off');

type = get(eventdata.NewValue, 'Tag');
if strcmp(type,'radiobutton_lowpass')
    set(handles.text2,'Visible','Off');
    set(handles.edit2,'Visible','Off');
    set(handles.text1,'String','Stopband frequency');
    filtertype = 'radiobutton_lowpass'
elseif strcmp(type,'radiobutton_highpass')
    set(handles.text2,'Visible','Off');
    set(handles.edit2,'Visible','Off');
    set(handles.text1,'String','Passband frequency');
    filtertype = 'radiobutton_highpass';
elseif strcmp(type,'radiobutton_bandpass')
    set(handles.text2,'Visible','On');
    set(handles.edit2,'Visible','On');
    set(handles.text1,'String','Stopband frequency');
    set(handles.text2,'String','Passband frequency');
    filtertype = 'radiobutton_bandpass';
end

% --- Executes on button press in pushbutton_restore.
function pushbutton_restore_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal x fs T initial_t nakladkowanie lw;
global view
signal = x;
t = initial_t;
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
global x T fs t dt signal initial_t nakladkowanie lw;

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
initial_t = t;
x= x';
signal = x;

rysuj(signal,t,fs,T,view, hObject, eventdata, handles, nakladkowanie, lw);


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
global x T fs t dt signal initial_t nakladkowanie lw;

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
initial_t = t;
x = x';
signal = x;
rysuj(signal,t,fs,T,view, hObject, eventdata, handles, nakladkowanie, lw);



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


% --- Executes on button press in pushbutton_diff_execute.
function pushbutton_diff_execute_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_diff_execute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t signal x fs T;
global view nakladkowanie lw RODZAJ;

signal = rozniczkowanie(signal, fs, t, RODZAJ);
rysuj(signal,t,fs,T,view, hObject, eventdata, handles, nakladkowanie, lw);
    set(handles.uipanel_diff,'Visible','Off');



% --- Executes on button press in radiobutton_diff_left.
function radiobutton_diff_left_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_diff_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_diff_left


% --- Executes on button press in radiobutton_diff_center.
function radiobutton_diff_center_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_diff_center (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_diff_center


% --- Executes on button press in radiobutton_diff_right.
function radiobutton_diff_right_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_diff_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_diff_right


% --- Executes when selected object is changed in uibuttongroup_diff.
function uibuttongroup_diff_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup_diff 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RODZAJ 

type = get(eventdata.NewValue, 'Tag');
if strcmp(type,'radiobutton_diff_left')
    RODZAJ = 1;
elseif strcmp(type,'radiobutton_diff_left')
    RODZAJ = 2;
elseif strcmp(type,'radiobutton_diff_left')
    RODZAJ = 3;
end



function edit_filename_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filename as text
%        str2double(get(hObject,'String')) returns contents of edit_filename as a double


% --- Executes during object creation, after setting all properties.
function edit_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_save2.
function pushbutton_save2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs
filename = (handles.edit_filename.String);
filename = [filename '.wav'];
audiowrite(filename,signal, fs);
set(handles.uipanel_save,'Visible','Off');



function edit_detrend_Callback(hObject, eventdata, handles)
% hObject    handle to edit_detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_detrend as text
%        str2double(get(hObject,'String')) returns contents of edit_detrend as a double


% --- Executes during object creation, after setting all properties.
function edit_detrend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_detrend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup_int.
function uibuttongroup_int_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup_int 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global int_type
int_type = get(eventdata.NewValue, 'Tag');
