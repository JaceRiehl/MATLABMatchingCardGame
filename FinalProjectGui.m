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
set(gca,'YTickLabel',[])
set(gca,'XTickLabel',[])
for i = 1:8 
    pic(i).ID = i;
    pic(i).TimesUsed = 2;
end


p(16) = struct('ID', -1, 'pic', 'null');
for i = 1:16
    p(i).ID = i;
end

index = 1;
while index < 17
    rng('shuffle'); 
    r = randi(8); 
    if(pic(r).TimesUsed ~= 0) 
        p(index).pic = pic(r).pic;
        p(index).picID = pic(r).ID;
        pic(r).TimesUsed = pic(r).TimesUsed - 1;
        index = index + 1;
    end
end


ind = 1;
for i = 1:4
    for j = 1:4
        p(ind).draw = image(x,y,p(ind).pic);
        ind = ind + 1;
        x = x + 1;
    end
    x = [0 1];
    y = y + 1;
end

x = [0 1];
y = [0 1];

%show the Question marks 
%pic1(16) = struct('pic', 'null');

qMarkIndex = 1;
for i = 0:3
    for j = 0:3
    pic1(qMarkIndex) = image(x,y,basePicture);
    
    x = x + 1;
    qMarkIndex = qMarkIndex + 1;
    end
    x = [0 1];
    y = y + 1;
    
end

strikedPos = 0;
amountShowing = 0;
tic
while(1)
    [clickX, clickY] = ginput(1);
    roundx1 = ceil(clickX);
    roundy1 = ceil(clickY);
    if(roundy1 == 1)
        posTemp = roundx1 * roundy1;
        delete(pic1(posTemp))
        pause(1)
        p(posTemp).picID;
        strikedPos = posTemp;
    end
    if(roundy1 == 2)
        posTemp = roundx1 + 4;
        delete(pic1(posTemp));
        pause(1)
        strikedPos = posTemp;
    end
    if(roundy1 == 3) 
        posTemp = roundx1-1 + 9;
        delete(pic1(posTemp));
        pause(1)
        strikedPos = posTemp;
        
    end
    if(roundy1 == 4) 
        if(roundx1 == 1)
            delete(pic1(13));
            pause(1)
            strikedPos = 13;
        end
        if(roundx1 == 2)
            delete(pic1(14));
            pause(1)
            strikedPos = 14;
        end
        if(roundx1 == 3)
            delete(pic1(15));
            pause(1)
            strikedPos = 15;
        end
        if(roundx1 == 4)
            delete(pic1(16));
            pause(1)
            strikedPos = 16;
        end
    end
    
    %Second Round
    
    [clickX, clickY] = ginput(1);
    roundx2 = ceil(clickX);
    roundy2 = ceil(clickY);
    
    if(roundy2 == 1)
        posTemp = roundx2 * roundy2;
        delete(pic1(posTemp));
        pause(1);
        p(posTemp).picID
        p(strikedPos).picID
        
        if(p(posTemp).picID ~= p(strikedPos).picID) 
            pic1(posTemp) = image([(roundx2-1) roundx2],[(roundy2-1) roundy2],basePicture);
            pic1(strikedPos) = image([(roundx1-1) roundx1],[(roundy1-1) roundy1],basePicture);
        else 
            amountShowing = amountShowing + 2;
        end
        strikedPos = 0;
    end
    
    if(roundy2 == 2)
        posTemp = roundx2 + 4;
        delete(pic1(posTemp));
        pause(1)
        if(p(posTemp).picID ~= p(strikedPos).picID) 
            pic1(posTemp) = image([(roundx2-1) roundx2],[(roundy2-1) roundy2],basePicture);
            pic1(strikedPos) = image([(roundx1-1) roundx1],[(roundy1-1) roundy1],basePicture);
        else 
            amountShowing = amountShowing + 2;      
        end   
        
        strikedPos = 0;
    end
    
    if(roundy2 == 3) 
        posTemp = roundx2-1 + 9;
        delete(pic1(posTemp));
        pause(1)
        if(p(posTemp).picID ~= p(strikedPos).picID) 
            pic1(posTemp) = image([(roundx2-1) roundx2],[(roundy2-1) roundy2],basePicture);
            pic1(strikedPos) = image([(roundx1-1) roundx1],[(roundy1-1) roundy1],basePicture);         
        else 
            amountShowing = amountShowing + 2;
        end
        strikedPos = 0;
        
    end
    
    if(roundy2 == 4) 
        if(roundx2 == 1)
            delete(pic1(13));
            pause(1)
            if(p(13).picID ~= p(strikedPos).picID) 
                pic1(13) = image([(roundx2-1) roundx2],[(roundy2-1) roundy2],basePicture);
                pic1(strikedPos) = image([(roundx1-1) roundx1],[(roundy1-1) roundy1],basePicture);
            else 
                amountShowing = amountShowing + 2;
            end
            strikedPos = 0;
        end
        if(roundx2 == 2)
            delete(pic1(14));
            pause(1)
            if(p(14).picID ~= p(strikedPos).picID) 
                pic1(14) = image([(roundx2-1) roundx2],[(roundy2-1) roundy2],basePicture);
                pic1(strikedPos) = image([(roundx1-1) roundx1],[(roundy1-1) roundy1],basePicture);
            else 
                p(posTemp).showing = true;
                p(strikedPos).showing = 1;
                amountShowing = amountShowing + 2;
            end
            strikedPos = 0;
        end
        if(roundx2 == 3)
            delete(pic1(15));
            pause(1)
            if(p(15).picID ~= p(strikedPos).picID) 
                pic1(15) = image([(roundx2-1) roundx2],[(roundy2-1) roundy2],basePicture);
                pic1(strikedPos) = image([(roundx1-1) roundx1],[(roundy1-1) roundy1],basePicture);
            else 
                amountShowing = amountShowing + 2;
            end
            strikedPos = 0;         
        end
        if(roundx2 == 4)
            delete(pic1(16));
            pause(1)
            if(p(16).picID ~= p(strikedPos).picID) 
                pic1(16) = image([(roundx2-1) roundx2],[(roundy2-1) roundy2],basePicture);
                pic1(strikedPos) = image([(roundx1-1) roundx1],[(roundy1-1) roundy1],basePicture);
            else 
                amountShowing = amountShowing + 2;
            end
            strikedPos = 0;
        end
    end
    
    disp("Amount Showing " + amountShowing);
    

     if(amountShowing == 16)
         finalTime = toc; 
         break; 
     end
end


handles.text3.String = finalTime;
roundx1