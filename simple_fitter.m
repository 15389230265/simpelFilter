clear all;
clc;
close all;
% f0=[4,4.5,40,90];
% [w,l]=size(f0);
% fs=2^8;
% k=f0./fs;
% N=2^10;  
% df=fs/N;
% x=zeros(l,N);
% Y=zeros(l,N);
% for i=1:l 
%     for n=1:N
%         x(i,n)=sin(2*pi*k(i)*n);
%     end
% %     figure(i);
%     Y(i,:)=fft(x(i,:))/N;
% %     plot(1:N,x(i,:),'-');
% %     hold on;
% end
% % figure();
% % for i=1:l
% %     plot((0:N/2-1)*df,abs(Y(i,1:N/2)));
% %     hold on;
% % end
% x0=sum(x);
% % figure();plot(1:N,x0,'-');
% y0=fft(x0)/N;
% figure();plot((0:N/2-1)*df,abs(y0(1:N/2)));
% % y1=hilbert(y0);
% % figure();plot((0:N-1)*df,abs(imag(y1)));
%-----------------------------��ͨ-------------------------------------%
% Wp=80/(fs/2);
% Ws=75/(fs/2);
% Rp=3;
% Rs=60;
% [Nb, Wn] = buttord(Wp,Ws,Rp,Rs);
% [B, A] = butter(Nb,Wn,'high');
% figure();
% freqz(B,A);
% title(sprintf('n = %d Butterworth Lowpass Filter',Nb));
% x1=filter(B,A,x0);
% % figure();plot(1:N,x1,'-');
% y1=fft(x1)/N;
% figure();plot((0:N/2-1)*df,abs(y1(1:N/2)));
%-------------------------------��ͨ-----------------------------------%
% Wp=4/(fs/2);
% Ws=5/(fs/2);
% Rp=3;
% Rs=20;
% [Nb, Wn] = buttord(Wp,Ws,Rp,Rs);
% [B, A] = butter(Nb,Wn);
% figure();
% freqz(B,A);
% title(sprintf('n = %d Butterworth Lowpass Filter',Nb));
% x1=filter(B,A,x0);
% % figure();plot(1:N,x1,'-');
% y1=fft(x1)/N;
% figure();plot((0:N/2-1)*df,abs(y1(1:N/2)));
%---------------------------------��ͨ---------------------------------%
% Wp=[35;45]./(fs/2);
% Ws=[30;50]./(fs/2);
% Rp=3;
% Rs=20;
% [Nb, Wn] = buttord(Wp,Ws,Rp,Rs);
% [B, A] = butter(Nb,Wn);
% figure();
% freqz(B,A);
% title(sprintf('n = %d Butterworth Lowpass Filter',Nb));
% x1=filter(B,A,x0);
% % figure();plot(1:N,x1,'-');
% y1=fft(x1)/N;
% figure();plot((0:N/2-1)*df,abs(y1(1:N/2)));
%-----------------------------------����-------------------------------%
% Wp=[30;50]./(fs/2);
% Ws=[35;45]./(fs/2);
% Rp=3;
% Rs=20;
% [Nb, Wn] = buttord(Wp,Ws,Rp,Rs);
% [B, A] = butter(Nb,Wn,'stop');
% figure();
% freqz(B,A);
% title(sprintf('n = %d Butterworth Lowpass Filter',Nb));
% x1=filter(B,A,x0);
% % figure();plot(1:N,x1,'-');
% y1=fft(x1)/N;
% figure();plot((0:N/2-1)*df,abs(y1(1:N/2)));
%---------------------------------����---------------------------------%
% Fs=22050;
% recObj = audiorecorder( Fs, 16 ,1) ;  
% %����һ��������Ƶ��Ϣ�Ķ��������������ʣ�ʱ���¼�Ƶ���Ƶ��Ϣ�ȵȡ�  
% %44100��ʾ����Ϊ44100Hz���ɸ�Ϊ8000, 11025, 22050�ȣ�����ֵԽ��¼�����������Խ�ã���Ӧ��Ҫ�Ĵ洢�ռ�Խ��  
% %16Ϊ��16bits�洢��2Ϊ��ͨ������������Ҳ���Ը�Ϊ1������������  
% disp('Start speaking.')
% recordblocking(recObj, 5);
% disp('End of Recording.');
% 
% % Play back the recording.
% play(recObj);
% 
% % Store data in double-precision array.
% myRecording = getaudiodata(recObj);
% 
% % Plot the waveform.
% plot(myRecording);
% %������뱣�����ʹ��  
% filename = 'song.wav';
% audiowrite(filename,myRecording,Fs);  
%-------------------------------------------------------
filename = 'ASAP.mp3';
[y,Fs] = audioread(filename);
y=y(400000:800000);
% sound(y,Fs);
figure();plot(y);
N=2^19;
df=Fs/N;
y1=fft(y)/N;
figure();plot((0:N/2-1)*df,abs(y1(1:N/2)));
%------------------------------------------------------------
% Ws=[2000;15000]/(Fs/2);
% Wp=[3000;14000]/(Fs/2);
% Rp=3;
% Rs=20;
% [Nb, Wn] = buttord(Wp,Ws,Rp,Rs);
% [B, A] = butter(Nb,Wn);
% figure();
% freqz(B,A);
% title(sprintf('n = %d Butterworth Lowpass Filter',Nb));
% x1=filter(B,A,y);
% % figure();plot(1:N,x1,'-');
% y2=fft(x1)/N;
% figure();plot((0:N/2-1)*df,abs(y2(1:N/2)));
%------------------------------------------------------------
Wp=2000/(Fs/2);
Ws=1000/(Fs/2);
Rp=3;
Rs=20;
[Nb, Wn] = buttord(Wp,Ws,Rp,Rs);
[B, A] = butter(Nb,Wn,'high');
figure();
freqz(B,A);
title(sprintf('n = %d Butterworth Lowpass Filter',Nb));
x1=filter(B,A,y);
figure();plot(1:400001,x1,'-');
y2=fft(x1)/N;
figure();plot((0:N/2-1)*df,abs(y2(1:N/2)));
%-------------------------�����ڲ���--------------------------------
% Wp=100/(Fs/2);
% Ws=300/(Fs/2);
% Rp=3;
% Rs=60;
% [Nb, Wn] = buttord(Wp,Ws,Rp,Rs);
% [B, A] = butter(Nb,Wn);
% figure();
% freqz(B,A);
% title(sprintf('n = %d Butterworth Lowpass Filter',Nb));
% x1=filter(B,A,y);
% figure();plot(1:400001,x1,'-');
% y2=fft(x1)/N;
% figure();plot((0:N/2-1)*df,abs(y2(1:N/2)));