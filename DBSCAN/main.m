clc;
close all;


A=iris;
Kvalue=4;
numData=size(A,1);
Kdist=zeros(numData,Kvalue);
[IDX0,Dist]=knnsearch(A(2:numData,:),A(1,:),'K',Kvalue);
Kdist(1,:)=Dist;
for i=2:size(A,1)
    [IDX0,Dist] = knnsearch(A([1:i-1,i+1:numData],:),A(i,:),'K',Kvalue);
    Kdist(i,:)=Dist;
end
Kdist1=reshape(Kdist,size(Kdist,1)*size(Kdist,2),1);
[sortKdist,sortKdistIdx]=sort(Kdist1,'descend');
distX=[1:numData*Kvalue]';
plot(distX,sortKdist,'r+-','LineWidth',2);
set(gcf,'position',[1000 340 350 350]);
grid on;

%% Run DBSCAN Clustering Algorithm
epsilon= 0.2 ;
MinPts=  5   ;
IDX1=DBSCAN(iris,epsilon,MinPts);
%% Plot Results
figure;
PlotClusterinResult(iris, IDX1);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
set(gcf,'position',[30 -10 500 500]); 


epsilon= 0.36 ;
MinPts=  3   ;
IDX2=DBSCAN(iris,epsilon,MinPts);
%% Plot Results
figure;
PlotClusterinResult(iris, IDX2);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
set(gcf,'position',[530 -10 500 500]);

epsilon= 0.5 ;
MinPts=  3   ;
IDX3=DBSCAN(iris,epsilon,MinPts);
%% Plot Results
figure;
PlotClusterinResult(iris, IDX3);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
set(gcf,'position',[30 380 500 500]);



