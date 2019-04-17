
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
% %% take the values 
 delete(instrfind)% close all com port
s = serial('COM3','BaudRate',115200); % serial communication
flushinput(s);
fopen(s);
F = fopen('thumb.txt', 'w'); % create file
a = timer;
set(a, 'executionMode', 'fixedRate', 'Period',.04, 'TimerFcn','disp(fgets(s))');

for i = 1:30
for n = 1:25
fprintf(F, fgets(s));
end

pause(1)
end
disp('please remove sensor')
fclose(F);


%% load the file
load thumb.txt % EDIT THE FILE NAME 
t = thumb(:,1); % EDIT THE FILE NAME
IRRAW = thumb(:,12); % EDIT THE FILE NAME
RRAW = thumb(:,13); % EDIT THE FILE NAME


% prepare the curve for IRRAW  
                                   

%%                                    fltering 
Fs = 25; % in Hz

fc = 2; % cut off frequency 
wn = (2/Fs)*fc;
b= fir1(22, wn, 'low', kaiser(23,3));
%fvtool(b,1,'Fs', Fs)
  y = filter(b,1,IRRAW);
  

%%                            prepare the curve for IRRAW   
                            
[xData, yData] = prepareCurveData( t, y);

%Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( ft );
opts.SmoothingParam = 0.9993190298109237;

%Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

%Plot fit with data.
%figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );


%% GET THE VALUE OF IRH AND IRL 
% steps to be taken care of:
r = -1:.004:15;
data = feval(fitresult,r);
IRL = zeros(14,1);
IRH = zeros(14,1);
cnt = 1;
% since we have 2250 datapoints and 25 points constitutes one
% minimum and maximum matrix as seen above
for i=1:250:3500 
    IRL(cnt) = min(data(i:i+250));
    IRH(cnt) = max(data(i:i+250));
    cnt = cnt + 1;
end
IRL;
IRH;


            %% prepare the curve for RRAW
    % fltering 


 fc = 2; % cut off frequency
wn = (2/Fs)*fc;
b= fir1(22, wn, 'low', kaiser(23,3));
% fvtool(b,1,'Fs', Fs)
%figure(2)
  x = filter(b,1,RRAW);
  
  
[aData, bData] = prepareCurveData( t, x);
     
% Set up fittype and options.
gt = fittype( 'smoothingspline' );
opts = fitoptions( gt );
opts.SmoothingParam = 0.9995868600048765;

% Fit model to data.
[rfitresult, gof] = fit( aData, bData, gt, opts );
figure(2)
plot( rfitresult, aData, bData );
%% GET THE VALUE OF RH AND RL 


adata = feval(rfitresult,r);
RL = zeros(14,1);
RH = zeros(14,1);
cnt = 1;
% since we have 2250 datapoints and 25 points constitutes one, so I
% minimum and maximum matrix as seen above
for i=1:250:3500 
    RL(cnt) = min(adata(i:i+250));
    RH(cnt) = max(adata(i:i+250));
    cnt = cnt + 1;
end
RL;
RH;


                            %% CALCULATE ROS AND SPO2

% ROS 
IH = RL./RH;
IL = IRL./IRH;
Ros = log(IH)./log(IL);

 %% SPO2

% Formula: SaO2 = (HBLR - HBLIR.*Ros)/ (HBLR - HBOLR)+(HBLIR - HBLIR)*Ros
HBLR = 0.8319;
HBLIR = 0.199;
HBOLR = 0.1027;
HBOLIR = 0.266;
SaO2 = abs((HBLR - HBLIR.*Ros)/ (HBLR - HBOLR)+(HBOLIR - HBLIR).*Ros);
SaO2(SaO2>1)= 1;
ab = length(SaO2);
SaO2 = SaO2(2:14);
sao2  = abs(nanmean(SaO2))*100
 
std(SaO2);

                              %% heart beat
IR = data';
% ar = plot(r, IR);
[peaks, index] =findpeaks(IR, r);
 a = diff(index);
indices = find(abs(a)<0.30);
a(indices) = [];
 b = 1./a;
 b = b./2;
 heart_beat = mean(b)*100
                        %% display 
 xr = ['heart beat: ', num2str(heart_beat)];
%  disp(xr);
%  disp('-------------------------------------------------------------');
%  xr1 = mean(SaO2(10:30));
%  hf1 = [ num2str(xr1)];
%  disp(hf1);
%  disp('-------------------------------------------------------------');
%  xr2 = mean(SaO2(11:20)); 
%  hf2 = ['SPO2 of 11 to 20 seconds: ', num2str(xr2)];
%  disp(hf2);
%  disp('-------------------------------------------------------------');
%  xr3 = mean(SaO2(21:30)); 
%  hf3 = ['SPO2 of 21 to 30 seconds: ', num2str(xr3)];
%  disp(hf3);
%   disp('-------------------------------------------------------------');
 
  %% all plots 
%    plot(length(b),b);
%b = b(10:30);
%r = 10:30;
 %% all SPO2 plots

% figure(1);
% plot(t, IRRAW, 'o');
% xlabel( 'time' );
% ylabel( 'IRRAW' );
% grid on 
% savefig('IRRAW.fig')
% 
% figure(2);
% plot(t, RRAW,'o');
% xlabel( 'time' );
% ylabel(h,  'RRAW.png' );
% grid on
% savefig('RRAW.fig') 
% 
% % %  
% %  plot(tim3,SaO2(21:30));
% %  xlabel( 'time' );
% %  ylabel( 'SPO2' );
% %  grid on 
% %  %% IRRAW and RRAW plots 
% % figure(4);
% %  plot(t, IRRAW) 
% %  grid on
% %  xlabel( 'time' );
% %  ylabel( 'IRRAW' );
% %  legend('IRRAW vs time')
% %  
% %  figure(5);
% %  plot(t, RRAW)
% %  grid on
% %  xlabel( 'time' );
% %  ylabel( 'RRAW' );
% %  legend('RRAW vs time')
% %  figure(6)
% %  histogram(SaO2)
%   legend('Histogram of SPO2 ')
