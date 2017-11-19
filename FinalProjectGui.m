function varargout = FinalProjectGui(varargin)
% FINALPROJECTGUI MATLAB code for FinalProjectGui.fig
%      FINALPROJECTGUI, by itself, creates a new FINALPROJECTGUI or raises the existing
%      singleton*.
%
%      H = FINALPROJECTGUI returns the handle to a new FINALPROJECTGUI or the handle to
%      the existing singleton*.
%
%      FINALPROJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALPROJECTGUI.M with the given input arguments.
%
%      FINALPROJECTGUI('Property','Value',...) creates a new FINALPROJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FinalProjectGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FinalProjectGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FinalProjectGui

% Last Modified by GUIDE v2.5 16-Nov-2017 18:35:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FinalProjectGui_OpeningFcn, ...
                   'gui_OutputFcn',  @FinalProjectGui_OutputFcn, ...
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


% --- Executes just before FinalProjectGui is made visible.
function FinalProjectGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FinalProjectGui (see VARARGIN)

% Choose default command line output for FinalProjectGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FinalProjectGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FinalProjectGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.start.String = "Start Over";


axis([0,4,0,4])
hold on;
x = [0 1];
y = [0 1];
xLine = [0 4]
yLine = [0 4]

%maybe used p(i) as a position and store a random picture at it
basePicture = imread('https://ak1.picdn.net/shutterstock/videos/7183621/thumb/1.jpg');
pic(1).pic = imread('https://img.buzzfeed.com/buzzfeed-static/static/2017-05/16/9/campaign_images/buzzfeed-prod-fastlane-03/this-smiling-siberian-husky-will-put-an-end-to-al-2-31329-1494942398-0_dblbig.jpg');
pic(2).pic = imread('https://image.freepik.com/free-photo/husky-breed-dog-with-tongue-out_1187-1501.jpg');
pic(3).pic = imread('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTivkjtxdQW8UQNMw5Be-BnVDNtLqQ7Rg6tGrmRfL2WBEpQAtFQ');
pic(4).pic = imread('http://www.dogbreedslist.info/uploads/allimg/dog-pictures/Siberian-Husky-1.jpg');
pic(5).pic = imread('https://www.pupcdn.com/photo/puppy/525832/5a03afec50831-3942755.jpg');
pic(6).pic = imread('http://images.mentalfloss.com/sites/default/files/styles/insert_main_wide_image/public/iStock_000012677298_Small.jpg');
pic(7).pic = imread('https://t2.ea.ltmcdn.com/en/images/5/1/4/img_types_and_breeds_of_husky_dogs_1415_paso_2_600.jpg');
pic(8).pic = imread('http://buzzsharer.com/wp-content/uploads/2015/04/cute-husky-puppy-pics.png');
set(gca,'YDir','reverse');

for i = 1:8 
    pic(i).ID = i;
    pic(i).TimesUsed = 2;
end


p(16) = struct('ID', -1, 'pic', 'null');
for i = 1:16
    p(i).ID = i;
end

index = 1
while index < 17
    rng('shuffle'); 
    r = randi(8) 
    if(pic(r).TimesUsed ~= 0) 
        p(index).pic = pic(r).pic;
        p(index).picID = pic(r).ID;
        pic(r).TimesUsed = pic(r).TimesUsed - 1;
        index = index + 1;
    end
end

% for i = 1:8
%     p(i+8).pic = p(i).pic
% end


ind = 1
for i = 1:4
    for j = 1:4
    p(ind).draw = image(x,y,p(ind).pic);
    ind = ind + 1
    x = x + 1
    end
    x = [0 1];
    y = y + 1
    
end

x = [0 1];
y = [0 1];

%used to give a random position value to 
%i have to make sure that the value chosen hasnt already been chosen 
% for i = 1:16
%     randx = rand(1) * 16 - 1
%     randy = rand(1) * 16 - 1
%     
% end
% for i = 1:2
%     for j = 1:4
%         image(x,y, p(i).pic) 
%         image(x + 2, y + 2, p(i).pic) 
%         x = x + 1
%     end
%     x = [0 1];
%     y = y + 1;
% end
% pause(5)
% x = [0 1];
% y = [0 1];


%show the Question marks 
qMarkIndex = 1
for i = 0:3
    for j = 0:3
    pic1(qMarkIndex) = image(x,y,basePicture);
    
    x = x + 1
    qMarkIndex = qMarkIndex + 1
    end
    x = [0 1];
    y = y + 1
    
end

strikedPos = 0;
striked = false;
while(1)
    [clickX clickY] = ginput(1);
    roundx = ceil(clickX);
    roundy = ceil(clickY);
    if(roundy == 1)
        posTemp = roundx * roundy
        delete(pic1(posTemp))
        pause(1)
        pic1(posTemp) = image([(roundx-1) roundx],[(roundy-1) roundy],basePicture)
        strikedPos = posTemp;
        striked = true;
    end
    if(roundy == 2)
        posTemp = roundx + 4
        delete(pic1(posTemp));
        pause(1)
        pic1(posTemp) = image([(roundx-1) roundx],[(roundy-1) roundy],basePicture)
        strikedPos = posTemp;
        striked = true;
    end
    if(roundy == 3) 
        posTemp = roundx-1 + 9
        delete(pic1(posTemp));
        pause(1)
        pic1(posTemp) = image([(roundx-1) roundx],[(roundy-1) roundy],basePicture)
        strikedPos = posTemp;
        striked = true;
        
    end
    if(roundy == 4) 
        if(roundx == 1)
            delete(pic1(13));
            pause(1)
            pic1(13) = image([0 1],[3 4],basePicture)
            strikedPos = 13;
            striked = true;
        end
        if(roundx == 2)
            delete(pic1(14));
            pause(1)
            pic1(14) = image([1 2],[3 4],basePicture)
            strikedPos = 14;
            striked = true;
        end
        if(roundx == 3)
            delete(pic1(15));
            pause(1)
            pic1(15) = image([2 3],[3 4],basePicture)
            strikedPos = 15;
            striked = true;
        end
        if(roundx == 4)
            delete(pic1(16));
            pause(1)
            pic1(16) = image([3 4],[3 4],basePicture)
            strikedPos = 16
            striked = true
        end
    end
    
    %If strikedOnce == true search through the indexes of pic1(i)
    %reset strikedOnce to false if the pictures are incorrect 
    
    
end

roundx