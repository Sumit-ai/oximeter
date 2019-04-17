
%% creat the folder display the request
% foldername = inputdlg('Please enter output folder name:');
%     mkdir(foldername{1})
% disp('Please put the sensor on body part')
%     disp('Please press ENTER KEY and DO NOT remove sensor')
% pause;
% global SaO2
% global er  
% global tim1
% global b
% global r
% 
% global xr
% global hf1
% % % % % % take the values 
% % % delete(instrfind)% close all com port
% % % s = serial('COM3','BaudRate',115200); % serial communication
% % % flushinput(s);
% % % fopen(s);
% % % F = fopen('thumb.txt', 'w'); % create file
% % % a = timer;
% % % set(a, 'executionMode', 'fixedRate', 'Period',.04, 'TimerFcn','disp(fgets(s))');
% % % 
% % % for i = 1:30
% % % for n = 1:25
% % % fprintf(F, fgets(s));
% % % end
% % % 
% % % pause(1)
% % % end
% % % disp('please remove sensor')
% % % fclose(F);




%% load the file
load thumb.txt % EDIT THE FILE NAME 
t = thumb(:,1); % EDIT THE FILE NAME
IRRAW1 = thumb(:,12); % EDIT THE FILE NAME
RRAW1 = thumb(:,13); % EDIT THE FILE NAME
IRRAW1 = IRRAW1(25:1500);
RRAW1 = RRAW1(25:1500); 
t = t(25:1500);
%% plot the figures here 
IRRAW = (IRRAW1-min(IRRAW1))/(max(IRRAW1)-min(IRRAW1));
RRAW = (RRAW1-min(RRAW1))/(max(RRAW1)-min(RRAW1));
figure(1) 
% first plot the raw signal 
subplot(211)
plot(t, IRRAW1)
subplot(212)
plot(t, RRAW1)
% second plot the Normalized raw signal 
figure(2)
subplot(211)
plot(t, IRRAW)
subplot(212)
plot(t,RRAW)
%% #######################################################################
%%                                   FILTERING 
%% ######################################################################
%% for IRRAW  

Fs = 25; % in Hz
fc = 5; % cut off frequency 
wn = (2/Fs)*fc;
% b= fir1(22, wn, 'high', kaiser(23,3));
% % fvtool(b,1,'Fs', Fs)
% y = filter(b,1,IRRAW);


c= fir1(22, wn, 'low', kaiser(23,3));
%fvtool(b,1,'Fs', Fs)
y = filter(c,1,IRRAW);
figure(3)
subplot(2,1,1)
plot(t,y)


% for RRAW 
fc = 5; % cut off frequency
wn = (2/Fs)*fc;
b= fir1(22, wn, 'low', kaiser(23,3));
% fvtool(b,1,'Fs', Fs)
%figure(2)
 x = filter(b,1,RRAW);
subplot(2,1,2)
plot(t,x) 
 