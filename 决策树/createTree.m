%%生成决策树
function [output_args] = createTree( iris )  
    [m,n] = size(iris);  
    disp('original iris:');  
    disp(iris);  
    classList = iris(:,n);  
    classOne = 1;%记录第一个类的个数  
    for i = 2:m  
        if classList(i,:) == classList(1,:)  
            classOne = classOne+1;  
        end  
    end  
      
    % 类别全相同  
    if classOne == m  
        disp('final data: ');  
        disp(iris);  
        return;  
    end  
      
    % 特征全部用完  
    if n == 1  
        disp('final data: ');  
        disp(iris);  
        return;  
    end  
      
    bestFeat = chooseBestFeature(iris);  
    disp(['bestFeat: ', num2str(bestFeat)]);  
     featValues = unique(iris(:,bestFeat));  
    numOfFeatValue = length(featValues);  
      
    for i = 1:numOfFeatValue  
        createTree(splitData(iris, bestFeat, featValues(i,:)));  
        disp('-------------------------');  
    end  
end  
%% 选择信息增益最大的特征  
function [ bestFeature ] = chooseBestFeature( iris )  
    [m,n] = size(iris);% 得到数据集的大小  
      
    % 统计特征的个数  
    numOfFeatures = n-1;%最后一列是类别  
    % 原始的熵  
    baseEntropy = calEntropy(iris);  
      
    bestInfoGain = 0;%初始化信息增益  
    bestFeature = 0;% 初始化最佳的特征位  
      
    % 挑选最佳的特征位  
    for j = 1:numOfFeatures  
        featureTemp = unique(iris(:,j));  
        numF = length(featureTemp);%属性的个数  
        newEntropy = 0;%划分之后的熵  
        for i = 1:numF  
            subSet = splitData(iris, j, featureTemp(i,:));  
            [m_1, n_1] = size(subSet);  
            prob = m_1./m;  
            newEntropy = newEntropy + prob * calEntropy(subSet);  
        end  
          
        %计算增益  
        infoGain = baseEntropy - newEntropy;  
          
        if infoGain > bestInfoGain  
            bestInfoGain = infoGain;  
            bestFeature = j;  
        end  
    end  
end

%%计算熵
function [ entropy ] = calEntropy( iris )
    [m,n] = size(iris);  
      
    % 得到类别的项  
    label = iris(:,n);  
      
    % 处理完的label  
    label_deal = unique(label);  
      
    numLabel = length(label_deal);  
    prob = zeros(numLabel,2);  
      
    % 统计标签  
    for i = 1:numLabel  
        prob(i,1) = label_deal(i,:);  
        for j = 1:m  
            if label(j,:) == label_deal(i,:)  
                prob(i,2) = prob(i,2)+1;  
            end  
        end  
    end  
      
    % 计算熵  
    prob(:,2) = prob(:,2)./m;  
    entropy = 0;  
    for i = 1:numLabel  
        entropy = entropy - prob(i,2) * log2(prob(i,2));  
    end  
end

%%划分数据
function [ subSet ] = splitData( iris, axis, value )  
    [m,n] = size(iris);%得到待划分数据的大小  
      
    subSet = iris;  
    subSet(:,axis) = [];  
    k = 0;  
    for i = 1:m  
        if iris(i,axis) ~= value  
            subSet(i-k,:) = [];  
            k = k+1;  
        end  
    end     
end  