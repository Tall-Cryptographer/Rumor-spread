clear;
clc;
% hold all
tic
people = 100;
C=[];
RES=0;
for random_people = 50:50:300
for null_people = 10:40:100
count = 0;
time = 100;
for k=1:time
n = zeros(people + 2);
for i=1:random_people
    rng('shuffle')
    a=randi([2,people + 1]);
    b=randi([2,people + 1]);
    n(a,b)=1;
end
for i=1:null_people
    c=randi([2,people + 1]);
    d=randi([2,people + 1]);
    n(c,d)=inf;
end
m=n;
time_out = 0;
while true
    for i=2:people + 1
       for j=2:people + 1
           sum = 0;
           sum = n(i+1,j)+n(i-1,j)+n(i,j+1)+n(i,j-1)+n(i+1,j+1)+n(i-1,j-1)+n(i+1,j-1)+n(i-1,j+1);
           if sum > 2 & sum <9
               m(i,j)=1;
           end
       end
    end
    if m==n
        res_time = 0;
        for i=1:people + 1
            for j=1:people + 1
                if m(i,j)==inf
                    continue
                end
            res_time = res_time + m(i,j);
            end
        end
        break
    end
    n=m;
%      grid on
%      imagesc(m)
%      pause(0.5)

end
RES = RES + res_time;
end
res = RES/(time*people*people);
fprintf('If we do the test %d times with %d people and %d rumor spreader and %d apathetic people, %d percent is mean.\n' , time, people*people, random_people, null_people, res)
% fprintf('This stage includes an average of %d percent believers.\n' ,c )
RES=0;
end
end
toc