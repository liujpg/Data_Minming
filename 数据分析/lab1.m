%��Ԫ��ֵ����
c=mean(magic04);
%�Ȼ�Ϊ���ĵ���ֵ����
E=magic04'*magic04/19020;
%���淽��
for i=1:size(magic04,2) 
    for j=1:size(magic04,2) 
        f(i,j)=sum((magic04(:,i)-mean(magic04(:,i))).*(magic04(:,j)-mean(magic04(:,j))))/(size(magic04,1)-1);
    end 
end
%���Ϊ���ĵ���ֵ����
  sum=0;
for a=1:19020
f=magic04(a,:)'*magic04(a,:)/19020;
sum=sum+f;
end

