clear;clc;
[~, ~ , allData ]  = xlsread('Call Records.xlsx');
out=cellfun(@num2str,allData,'un',0);
allData(1,6) = {'phone_number'};
fields = allData(1,:);
allData(1,:) = [];
data_base = cell2struct(allData,fields,2);
dbms = struct2table(data_base);
list_id = zeros(size(allData,1),1);
for i = 1:size(allData,1)
    if (allData{i,4}==998)||(allData{i,4}==999)
        list_id(i) = 1;
    end
%     if isnumeric(allData{i,5})
%         X(i) = allData{i,5};
%     else
%         allData(i,:) =[];
%     end
end
for i = 1:size(allData,1)
 X(i) = allData{i,5};
end
for i = 1:size(allData,1)
    if (allData{i,4}==998)||(allData{i,4}==999)
        list_id(i) = 1;
    end
    if isnumeric(allData{i,5})
        X(i) = allData{i,5};
    else
        allData(i,:) =[];
    end
end
sum(list_id)/length(list_id)
