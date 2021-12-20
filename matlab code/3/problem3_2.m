clear;
clc;
%  hold all
tic
people = 100;
C=[];
A= 600;
B= 50;
% for i=1:6
% A = A - 50;
% B = B + 50;
count = 0;
time = 100;
percent_of_time = [];
for k=1:time
n = zeros(people + 2);
for i=1:A
    rng('shuffle')
    a=randi([2,people + 1]);
    b=randi([2,people + 1]);
    n(a,b)=1;
end
for k=1:B
    c=randi([2,people + 1]);
    d=randi([2,people + 1]);
    n(c,d)=-1;
end
m=n;
time_out = 0;
while true
    for i=2:people + 1
       for j=2:people + 1
           sum = 0;
           sum = n(i+1,j)+n(i-1,j)+n(i,j+1)+n(i,j-1)+n(i+1,j+1)+n(i-1,j-1)+n(i+1,j-1)+n(i-1,j+1);
           if sum > 2
               m(i,j)=1;
           elseif sum < -2
               m(i,j)=-1;
           end
       end
    end
    if m==n
        res_time = 0;
        for i=1:people + 1
            for j=1:people + 1
            res_time = res_time + m(i,j);
            end
        end
        percent_of_time(end+1) = (res_time/(people * people))*100;
        break
    end
    for i=2:people + 1
        for j=2:people + 1
            time_out = time_out + m(i,j);
        end
    end
    if time_out == (people * people)
        percent_of_time(end+1) = (time_out/(people * people))*100;
        count = count + 1;
        break
    else
        time_out=0;
    end
    n=m;
%      grid on
%      imagesc(m)
%      pause(0.1)
end
end
%count
res = (count / time) * 100;
c=0;
for i=1:100
    c = c + percent_of_time(i)/100;
end
fprintf('If we do the test %d times with %d people and %d first rumor spreader and %d second rumor spreader, %d percent of times, rumor spread in whole population.\n' , time, people*people, A, B, res)
fprintf('This stage includes an average of %d percent believers.\n' ,c )
% end
toc