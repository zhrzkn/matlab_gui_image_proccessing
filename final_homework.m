function varargout = final_homework(varargin)
% FINAL_HOMEWORK MATLAB code for final_homework.fig
%      FINAL_HOMEWORK, by itself, creates a new FINAL_HOMEWORK or raises the existing
%      singleton*.
%
%      H = FINAL_HOMEWORK returns the handle to a new FINAL_HOMEWORK or the handle to
%      the existing singleton*.
%
%      FINAL_HOMEWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_HOMEWORK.M with the given input arguments.
%
%      FINAL_HOMEWORK('Property','Value',...) creates a new FINAL_HOMEWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_homework_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_homework_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_homework

% Last Modified by GUIDE v2.5 04-Dec-2021 19:43:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_homework_OpeningFcn, ...
                   'gui_OutputFcn',  @final_homework_OutputFcn, ...
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


% --- Executes just before final_homework is made visible.
function final_homework_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_homework (see VARARGIN)
global image new_image



% Choose default command line output for final_homework
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_homework wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_homework_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
[file,path]=uigetfile('*.jpg');
if file==0
    errordlg('Please load an image','Error');
end
set(handles.edit1,'String',file);
set(handles.pathedit,'String',path);
axes(handles.axes1)
image=imread([path,file]);
imshow(image);

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);

% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
[file,path] = uiputfile('*.jpg');
if file == 0
    return;
end
set(handles.edit3,'String',[path,file]);
imwrite(new_image,[path,file],'jpg');

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global image new_image
axes(handles.axes1)
imy=im2double(image);
val=0.5*get(hObject,'Value')-0.5;
imbright=imy+val;
imshow(imbright);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



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



function pathedit_Callback(hObject, eventdata, handles)
% hObject    handle to pathedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pathedit as text
%        str2double(get(hObject,'String')) returns contents of pathedit as a double


% --- Executes during object creation, after setting all properties.
function pathedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pathedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=rgb2gray(image);
imshow(x);
% --- Executes on button press in findball.
function findball_Callback(hObject, eventdata, handles)
% hObject    handle to findball (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
se=strel('ball',17,6);
x=imopen(image,se);
imshow(x);

% --- Executes on button press in graytrash.
function graytrash_Callback(hObject, eventdata, handles)
% hObject    handle to graytrash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=graythresh(image)
bw=im2bw(image,x);
imshow(bw);
function boundaries_Callback(hObject, eventdata, handles)
% hObject    handle to boundaries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
bw=im2bw(image);
[B,L] = bwboundaries(bw,'noholes');
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
% --- Executes on button press in imadd.
function imadd_Callback(hObject, eventdata, handles)
% hObject    handle to imadd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=imadd(image,75);
imshow(x);
% --- Executes on button press in imtool.
function imtool_Callback(hObject, eventdata, handles)
% hObject    handle to imtool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=imtool(image);
imshow(x);
% --- Executes on button press in histeq.
function histeq_Callback(hObject, eventdata, handles)
% hObject    handle to histeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=histeq(image);  
imshow(x);
% --- Executes on button press in medfilt.
function medfilt_Callback(hObject, eventdata, handles)
% hObject    handle to medfilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=medfilt3(image)
imshow(x);
% --- Executes on button press in imnoise.
function imnoise_Callback(hObject, eventdata, handles)
% hObject    handle to imnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=imnoise(image,'salt & pepper',0.02);
imshow(x);
% --- Executes on button press in blackwhite.
function blackwhite_Callback(hObject, eventdata, handles)
% hObject    handle to blackwhite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=im2bw(image);
imshow(x);

% --- Executes on button press in imcomplement.
function imcomplement_Callback(hObject, eventdata, handles)
% hObject    handle to imcomplement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=imcomplement(image);
imshow(x);
% --- Executes on button press in cylinder.
function cylinder_Callback(hObject, eventdata, handles)
% hObject    handle to cylinder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
[x1,y1,z1] = cylinder;
x=warp(x1,y1,z1,image);

% --- Executes on button press in sphere.
function sphere_Callback(hObject, eventdata, handles)
% hObject    handle to sphere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
[x1,y1,z1] = sphere;
x=warp(x1,y1,z1,image);

% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
hy=fspecial('sobel');
hx=hy;
Iy=imfilter(double(image),hy,'replicate');
Ix=imfilter(double(image),hx,'replicate');
x=sqrt(Ix.^6+Iy.^6);
imshow(x);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
imshow(image);
% --- Executes on button press in rgb2hsv.
function rgb2hsv_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2hsv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image new_image
axes(handles.axes2)
x=rgb2hsv(image);
imshow(x);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
