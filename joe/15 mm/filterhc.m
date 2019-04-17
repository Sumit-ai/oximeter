%% load the file
load thumb.txt % EDIT THE FILE NAME 
t = thumb(:,1); % EDIT THE FILE NAME
IRRAW1 = thumb(:,12); % EDIT THE FILE NAME
RRAW1 = thumb(:,13); % EDIT THE FILE NAME

IRRAW = (IRRAW1-min(IRRAW1))/(max(IRRAW1)-min(IRRAW1));
RRAW = (RRAW1-min(RRAW1))/(max(RRAW1)-min(RRAW1));
plot(t, IRRAW)
% % prepare the curve for IRRAW  
%                                    
% subplot(3,1,1)
% plot(t,IRRAW)
% %%                                    fltering 
% Fs = 25; % in Hz
% 
% fc = 5; % cut off frequency 
% wn = (2/Fs)*fc;
% b= fir1(22, wn, 'high', kaiser(23,3));
% %% fvtool(b,1,'Fs', Fs)
% y = filter(b,1,IRRAW);
% subplot(3,1,2)
% plot(t,y)
% 
% c= fir1(22, wn, 'low', kaiser(23,3));
% %fvtool(b,1,'Fs', Fs)
% x = filter(c,1,IRRAW);
% 
% subplot(3,1,3)
% plot(t,x)