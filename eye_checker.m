function varargout = eye_checker(varargin)
% EYE_CHECKER MATLAB code for eye_checker.fig
%      EYE_CHECKER, by itself, creates a new EYE_CHECKER or raises the existing
%      singleton*.
%
%      H = EYE_CHECKER returns the handle to a new EYE_CHECKER or the handle to
%      the existing singleton*.
%
%      EYE_CHECKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EYE_CHECKER.M with the given input arguments.
%
%      EYE_CHECKER('Property','Value',...) creates a new EYE_CHECKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before eye_checker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to eye_checker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help eye_checker

% Last Modified by GUIDE v2.5 15-Dec-2021 18:15:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @eye_checker_OpeningFcn, ...
                   'gui_OutputFcn',  @eye_checker_OutputFcn, ...
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


% --- Executes just before eye_checker is made visible.
function eye_checker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to eye_checker (see VARARGIN)

% Choose default command line output for eye_checker
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes eye_checker wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
axis off
axes(handles.axes2);
axis off
axes(handles.axes3);
axis off
axes(handles.axes4);
axis off
global eye_check_data;
eye_check_data = [];

% --- Outputs from this function are returned to the command line.
function varargout = eye_checker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
global eye_check_data;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
updatePlots(handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function data_root_txt_Callback(hObject, eventdata, handles)
% hObject    handle to data_root_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data_root_txt as text
%        str2double(get(hObject,'String')) returns contents of data_root_txt as a double


% --- Executes during object creation, after setting all properties.
function data_root_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_root_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function expID_text_Callback(hObject, eventdata, handles)
% hObject    handle to expID_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expID_text as text
%        str2double(get(hObject,'String')) returns contents of expID_text as a double


% --- Executes during object creation, after setting all properties.
function expID_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expID_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_btn.
function load_btn_Callback(hObject, eventdata, handles)
global eye_check_data;
eye_check_data.expID = handles.expID_text.String;
eye_check_data.data_root = handles.data_root_txt.String;
animalID = eye_check_data.expID(15:end);
eye_check_data.exp_root = fullfile(eye_check_data.data_root,animalID,eye_check_data.expID);

dlc_filenames = {[eye_check_data.expID,'_eye1_leftDLC_resnet50_Trial_newMay19shuffle1_1030000.csv'],...
     [eye_check_data.expID,'_eye1_rightDLC_resnet50_Trial_newMay19shuffle1_1030000.csv']};
 
vid_filenames = {[eye_check_data.expID,'_eye1_left.avi'],...
     [eye_check_data.expID,'_eye1_right.avi']};

eye_check_data.v_left = VideoReader(fullfile(eye_check_data.exp_root,vid_filenames{1}));
eye_check_data.v_right = VideoReader(fullfile(eye_check_data.exp_root,vid_filenames{2}));

handles.slider2.Value = 1;
handles.slider2.Min = 1;
handles.slider2.Max = eye_check_data.v_left.NumFrames;
handles.slider2.SliderStep = [1/handles.slider2.Max 20/handles.slider2.Max];
eye_check_data.dlc0.left = readmatrix(fullfile(eye_check_data.exp_root,dlc_filenames{1}));
eye_check_data.dlc0.left = eye_check_data.dlc0.left(:,2:end);
eye_check_data.dlc0.right = readmatrix(fullfile(eye_check_data.exp_root,dlc_filenames{2}));
eye_check_data.dlc0.right = eye_check_data.dlc0.right(:,2:end);
eye_check_data.dlc1.left = load(fullfile(eye_check_data.exp_root,'dlcEyeLeft.mat'));
eye_check_data.dlc1.right = load(fullfile(eye_check_data.exp_root,'dlcEyeRight.mat'));
axes(handles.axes3);
hold off
plot(zscore(eye_check_data.dlc1.left.eyeDat.x),'r');
hold on
plot(zscore(eye_check_data.dlc1.left.eyeDat.y),'b');
plot(zscore(eye_check_data.dlc1.left.eyeDat.radius),'k--');
axis off
eye_check_data.line1 = line([handles.slider2.Value,handles.slider2.Value],[-5 5],'Color','g');
legend('L','R','Rad','Time');
xlim([0 length(eye_check_data.dlc1.left.eyeDat.x)]);
axes(handles.axes4);
hold off
plot(zscore(eye_check_data.dlc1.right.eyeDat.x),'r');
hold on
plot(zscore(eye_check_data.dlc1.right.eyeDat.y),'b');
plot(zscore(eye_check_data.dlc1.right.eyeDat.radius),'k--');
axis off
eye_check_data.line2 = line([handles.slider2.Value,handles.slider2.Value],[-5 5],'Color','g');
legend('L','R','Rad','Time');
xlim([0 length(eye_check_data.dlc1.left.eyeDat.x)]);
linkaxes([handles.axes3,handles.axes4],'y');
updatePlots(handles);

function updatePlots(handles)
global eye_check_data;
currentFrame = round(handles.slider2.Value);
eye_check_data.line1.XData = [handles.slider2.Value,handles.slider2.Value];
eye_check_data.line2.XData = [handles.slider2.Value,handles.slider2.Value];
handles.frame_num_text.String = ['Frame number: ',num2str(currentFrame)];
leftImage = eye_check_data.v_left.read(currentFrame);
rightImage = eye_check_data.v_right.read(currentFrame);
% DO LEFT EYE
axes(handles.axes1);
imagesc(squeeze(leftImage(:,:,1)));
axis off
colormap gray
eyeX = eye_check_data.dlc0.left(:,25:3:end);
eyeY = eye_check_data.dlc0.left(:,26:3:end);
pupilX = eye_check_data.dlc0.left(:,1:3:24);
pupilY = eye_check_data.dlc0.left(:,2:3:24);
% generate points for lids
xVals = linspace(eyeX(currentFrame,1),eyeX(currentFrame,3));
topLid = eye_check_data.dlc1.left.eyeDat.topLid{currentFrame};
botLid = eye_check_data.dlc1.left.eyeDat.botLid{currentFrame};
% for upper lid
yVals = topLid.p1*xVals.^2 + topLid.p2*xVals + topLid.p3;
% for lower lid
yVals = [yVals,botLid.p1*fliplr(xVals).^2 + botLid.p2*fliplr(xVals) + botLid.p3];
xVals = [xVals,fliplr(xVals)];
% draw the eye outline on
hold on;
plot(xVals,yVals,'y');
% plot points
% plot valid pupil points
inEye = eye_check_data.dlc1.left.eyeDat.inEye{currentFrame};
scatter(pupilX(currentFrame,inEye),pupilY(currentFrame,inEye),'g');
% invalid
scatter(pupilX(currentFrame,~inEye),pupilY(currentFrame,~inEye),'r');
% draw pupil
viscircles([eye_check_data.dlc1.left.eyeDat.x(currentFrame) eye_check_data.dlc1.left.eyeDat.y(currentFrame)],eye_check_data.dlc1.left.eyeDat.radius(currentFrame));
% DO RIGHT EYE
axes(handles.axes2);
imagesc(squeeze(rightImage(:,:,1)));
axis off
colormap gray
eyeX = eye_check_data.dlc0.right(:,25:3:end);
eyeY = eye_check_data.dlc0.right(:,26:3:end);
pupilX = eye_check_data.dlc0.right(:,1:3:24);
pupilY = eye_check_data.dlc0.right(:,2:3:24);
% generate points for lids
xVals = linspace(eyeX(currentFrame,1),eyeX(currentFrame,3));
topLid = eye_check_data.dlc1.right.eyeDat.topLid{currentFrame};
botLid = eye_check_data.dlc1.right.eyeDat.botLid{currentFrame};
% for upper lid
yVals = topLid.p1*xVals.^2 + topLid.p2*xVals + topLid.p3;
% for lower lid
yVals = [yVals,botLid.p1*fliplr(xVals).^2 + botLid.p2*fliplr(xVals) + botLid.p3];
xVals = [xVals,fliplr(xVals)];
% draw the eye outline on
hold on;
plot(xVals,yVals,'y');
% plot points
% plot valid pupil points
inEye = eye_check_data.dlc1.right.eyeDat.inEye{currentFrame};
scatter(pupilX(currentFrame,inEye),pupilY(currentFrame,inEye),'g');
% invalid
scatter(pupilX(currentFrame,~inEye),pupilY(currentFrame,~inEye),'r');
% draw pupil
viscircles([eye_check_data.dlc1.right.eyeDat.x(currentFrame) eye_check_data.dlc1.right.eyeDat.y(currentFrame)],eye_check_data.dlc1.right.eyeDat.radius(currentFrame));
% change plot 
