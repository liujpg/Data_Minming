%核矩阵
for a=1:4
for b=1:4
k(a,b)=iris(:,a)'*iris(:,b);
end
end
%中心化和标准化
K=mean(mean(k));
K1=k-K;
K2=zscore(K1);
%转化为?（x）
i=1;  
a=k(1,i)^2+ k(2,i)^2+ k(3,i)^2+ k(4,i)^2;
K3(:,i)=k(:,1)/(a(:,i)^0.5);
i=1;     
a=k(1,2)^2+ k(2,2)^2+ k(3,2)^2+ k(4,2)^2;
K3(:,i)=k(:,1)/(a(:,i)^0.5);
%中心化和标准化
MEAN=mean(mean(K4));
K5=K4-MEAN;
K6=zscore(K5);