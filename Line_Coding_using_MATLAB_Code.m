% a = [ 1 0 0 -1 2 -4 1 1 0 1 0 1 0 1 0 1 ];
% stairs([a,a(end)]);
l=30;%length of random data
x=zeros(1,2*l);
clk=zeros(1,2*l);
% Unipolar NRZ
for i=1:2:2*l
    x(i) = randi(2)-1;
    x(i+1) = x(i);
    clk(i) = 1;
%     fprintf('%d', randi(2)-1);
end
% x=[1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 1];
x;
% Unipolar RZ
y1=zeros(1,2*l);
for i=1:2:2*l
    if(x(i)==1)
        y1(i)=1;
    end
end
% Polar NRZ
y2=zeros(1,2*l);
for i=1:2:2*l
    if(x(i)==1)
        y2(i)=1;
        y2(i+1)=1;
    else
        y2(i)=-1;
        y2(i+1)=-1;
    end
end
% Polar RZ
y3=zeros(1,2*l);
for i=1:2:2*l
    if(x(i)==1)
        y3(i)=1;
        y3(i+1)=0;
    else
        y3(i)=-1;
        y3(i+1)=0;
    end
end
% Manchester Coding
y4=zeros(1,2*l);
for i=1:2:2*l
    if(x(i)==1)
        y4(i)=1;
        y4(i+1)=-1;
    else
        y4(i)=-1;
        y4(i+1)=1;
    end
end
% AMI
y5=zeros(1,2*l);
last=0;
for i=1:2:2*l
    if(x(i)==1)
        if(~last)
            y5(i)=1;
            y5(i+1)=1;
            last=1;
        else
            y5(i)=-1;
            y5(i+1)=-1;
            last=0;
        end
    end
end
% HDB3
y6=zeros(1,2*l);
last=0;
count=0;
i_update=0;
for i=1:2:2*l
    if(x(i)==1)
        count=count+1;
        if(~last)
            y6(i)=1;
            y6(i+1)=1;
            last=1;
        else
            y6(i)=-1;
            y6(i+1)=-1;
            last=0;
        end
    elseif(and(i+7<2*l, i>=i_update))
        if(and(~x(i), and(~x(i+2), and(~x(i+4), ~x(i+6)))))
            if(~last)
                if(rem(count, 2)==0)
                    y6(i)=1;
                    y6(i+1)=1;
                    y6(i+6)=1;
                    y6(i+7)=1;
                    last=1;
                else
                    y6(i+6)=-1;
                    y6(i+7)=-1;
                end
            else
                if(rem(count, 2)==0)
                    y6(i)=-1;
                    y6(i+1)=-1;
                    y6(i+6)=-1;
                    y6(i+7)=-1;
                    last=0;
                else
                    y6(i+6)=1;
                    y6(i+7)=1;
                end
            end
            count;
            i;
            y6;
            count=0;
            i_update=i+8;
        end
    end
end
% FIGURE 1
figure;
subplot(4,1,1);
stairs([clk, clk(end)]);
title('Clock');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,2);
stairs([x, x(end)]);
title('Random Data');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,3);
stairs([x, x(end)]);
title('Unipolar NRZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,4);
stairs([y1, y1(end)]);
title('Unipolar RZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

% FIGURE 2
figure;
subplot(4,1,1);
stairs([clk, clk(end)]);
title('Clock');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,2);
stairs([x, x(end)]);
title('Random Data');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,3);
stairs([y2, y2(end)]);
title('Polar NRZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,4);
stairs([y3, y3(end)]);
title('Polar RZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

% FIGURE 3
figure;
subplot(4,1,1);
stairs([clk, clk(end)]);
title('Clock');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,2);
stairs([x, x(end)]);
title('Random Data');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,3);
stairs([y4, y4(end)]);
title('Manchester');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,4);
stairs([y5, y5(end)]);
title('AMI');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

% FIGURE 4
figure;
subplot(4,1,1);
stairs([clk, clk(end)]);
title('Clock');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,2);
stairs([x, x(end)]);
title('Random Data');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,3);
stairs([y6, y6(end)]);
title('HDB3');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

subplot(4,1,4);
stairs([y6, y6(end)]);
title('HDB3');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l+1]);
xticks(1:2:2*l+1);

%FIGURE 5
figure;
% x=[ 1 0 0 1 1 0 1 0 0];
s=10;
for i=1:1:length(x)*s
    x2(i)=x(ceil(i/s));
end
x2;

y = fft(x2);                               % Compute DFT of x
m = abs(y);                               % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));                     % Phase
f = (0:length(y)/2-1)*100/length(y);        % Frequency vector

% subplot(2,1,1)
plot(f,m(1:length(y)/2))
title('Magnitude')
grid on;
ylim([min(m) max(m)-50]);
xticks([15 40 60 85]);
hold on;
% ax = gca;
% ax.XTick = [15 40 60 85];

% subplot(2,1,2)
% plot(f,p*180/pi)
% title('Phase')
% ax = gca;
% ax.XTick = [15 40 60 85];


s=10;
for i=1:1:length(x)*s
    x2(i)=y1(ceil(i/s));
end
x2;

y = fft(x2);                               % Compute DFT of x
m = abs(y);                               % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));                     % Phase
f = (0:length(y)/2-1)*100/length(y);        % Frequency vector

% subplot(2,1,1)
plot(f,m(1:length(y)/2))
title('Magnitude')
grid on;
ylim([min(m) max(m)-50]);
xticks([15 40 60 85]);
hold on;

s=10;
for i=1:1:length(x)*s
    x2(i)=y2(ceil(i/s));
end
x2;

y = fft(x2);                               % Compute DFT of x
m = abs(y);                               % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));                     % Phase
f = (0:length(y)/2-1)*100/length(y);        % Frequency vector

% subplot(2,1,1)
plot(f,m(1:length(y)/2))
title('Magnitude')
grid on;
ylim([min(m) max(m)-50]);
xticks([15 40 60 85]);
hold on;

s=10;
for i=1:1:length(x)*s
    x2(i)=y3(ceil(i/s));
end
x2;

y = fft(x2);                               % Compute DFT of x
m = abs(y);                               % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));                     % Phase
f = (0:length(y)/2-1)*100/length(y);        % Frequency vector

% subplot(2,1,1)
plot(f,m(1:length(y)/2))
title('Magnitude')
grid on;
ylim([min(m) max(m)-50]);
xticks([15 40 60 85]);
hold on;

s=10;
for i=1:1:length(x)*s
    x2(i)=y4(ceil(i/s));
end
x2;

y = fft(x2);                               % Compute DFT of x
m = abs(y);                               % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));                     % Phase
f = (0:length(y)/2-1)*100/length(y);        % Frequency vector

% subplot(2,1,1)
plot(f,m(1:length(y)/2))
title('Magnitude')
grid on;
ylim([min(m) max(m)-50]);
xticks([15 40 60 85]);
hold on;

s=10;
for i=1:1:length(x)*s
    x2(i)=y5(ceil(i/s));
end
x2;

y = fft(x2);                               % Compute DFT of x
m = abs(y);                               % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));                     % Phase
f = (0:length(y)/2-1)*100/length(y);        % Frequency vector

% subplot(2,1,1)
plot(f,m(1:length(y)/2))
title('Magnitude')
grid on;
ylim([min(m) max(m)-50]);
xticks([15 40 60 85]);
hold on;

s=10;
for i=1:1:length(x)*s
    x2(i)=y6(ceil(i/s));
end
x2;

y = fft(x2);                               % Compute DFT of x
m = abs(y);                               % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));                     % Phase
f = (0:length(y)/2-1)*100/length(y);        % Frequency vector

% subplot(2,1,1)
plot(f,m(1:length(y)/2))
title('Magnitude')
grid on;
ylim([min(m) max(m)-50]);
xticks([15 40 60 85]);
hold on;