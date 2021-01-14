% a = [ 1 0 0 -1 2 -4 1 1 0 1 0 1 0 1 0 1 ];
% stairs([a,a(end)]);
l=30;
x=zeros(2*l);
clk=zeros(2*l);
% Unipolar NRZ
for i=1:2:2*l
    x(i) = randi(2)-1;
    x(i+1) = x(i);
    clk(i) = 1;
%     fprintf('%d', randi(2)-1);
end
% Unipolar RZ
y1=zeros(2*l);
for i=1:2:2*l
    if(x(i)==1)
        y1(i)=1;
    end
end
% Polar NRZ
y2=zeros(2*l);
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
y3=zeros(2*l);
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
y4=zeros(2*l);
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
y5=zeros(2*l);
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

% FIGURE 1
figure;
subplot(4,1,1);
stairs(clk);
title('Clock');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,2);
stairs(x);
title('Random Data');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,3);
stairs(x);
title('Unipolar NRZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,4);
stairs(y1);
title('Unipolar RZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

% FIGURE 2
figure;
subplot(4,1,1);
stairs(clk);
title('Clock');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,2);
stairs(x);
title('Random Data');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,3);
stairs(y2);
title('Polar NRZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,4);
stairs(y3);
title('Polar RZ');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

% FIGURE 3
figure;
subplot(4,1,1);
stairs(clk);
title('Clock');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,2);
stairs(x);
title('Random Data');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-1 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,3);
stairs(y4);
title('Manchester');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l]);
xticks(1:2:2*l);

subplot(4,1,4);
stairs(y5);
title('AMI');
% ax = gca;
% ax.YLim = [-1 2];
grid on;
% grid minor;
ylim([-2 2]);
xlim([1 2*l]);
xticks(1:2:2*l);
