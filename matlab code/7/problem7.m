% حالت معمولی 
clear;
clc;
hold all
tic
people = 200;
C=[];
T=0;
random_people = 1000
count = 0;
time = 100;
percent_of_time = [];
for k=1:time
matrix = zeros(people + 2);
for i=1:people + 1
    for j=1:i
        matrix(i,j)=-10;
        matrix(i,people+2-j)=-10;
    end
end
% for i=1:people + 2
%     for j=1:people + 2
%         if matrix(i,j)==1
%             matrix(i,j)=0;
%         end
%     end
% end
n = matrix(1:people/2, 1:people + 1);
while T<random_people
    rng('shuffle')
    a=randi([2,people/2]);
    b=randi([2,people + 1]);
    if n(a,b)==0
        n(a,b)=1;
        T = T + 1;
    end
end
m=n;
time_out = 0;
while true
    for i=2:people/2
       for j=2:people + 1
           if m(i,j)==0
               sum = 0;
               sum = n(i-1,j)+n(i,j+1)+n(i,j-1)+n(i-1,j-1)+n(i-1,j+1);
               if sum > -48
                   m(i,j)=1;
               end
           end
       end
    end
    if m==n
        res_time = 0;
        for i=1:people/2
            for j=1:people + 1
            res_time = res_time + m(i,j);
            end
        end
        percent_of_time(end+1) = (res_time/(people * people))*100;
        break
    end
    for i=2:people/2
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
    grid on
    imagesc(m)
    pause(5)
end
end
%count
res = (count / time) * 100;
c=0;
for i=1:100
    c = c + percent_of_time(i)/100;
end
fprintf('If we do the test %d times with %d people and %d rumor spreader, %d percent of times, rumor spread in whole population.\n' , time, people/2, random_people, res)
fprintf('This stage includes an average of %d percent believers.\n' ,c )

toc