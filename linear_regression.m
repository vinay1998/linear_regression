addpath('C:/Users/Anvesh/Desktop');
data=load('ex1data1.txt');

%initialise variables
theta1=0;
theta2=0;
cost=0;
alpha=0.001;

for i=1:1000 %iterations=1000
  %calculating gradient descent
  t0=0;
  t1=0;
  for j=1:length(data)
    t0+=((theta1+(theta2*data(j,1)))-data(j,2));
    t1+=((theta1+(theta2*data(j,1)))-data(j,2))*data(j,1);
  end;
  theta1=theta1-alpha*(t0/length(data));
  theta2=theta2-alpha*(t1/length(data));
  
  %calculating cost function
  cost_num=0;
  for j=1:length(data)
    cost_num+=((theta1+data(j,1)*theta2)-data(j,2))^2;
  end;
  cost=cost_num/(2*length(data));
  fprintf("\niteration=%d,error=%f,theta1=%f,theta2=%f",i,cost,theta1,theta2);
  
  
end;
scatter(data(:,1),data(:,2));
hold on;
yp=zeros(length(data),1);
yp=theta1+data(:,1)*theta2
plot(data(:,1),yp);

    