clear all
RWB=[169,31,50;255,255,255;30,71,133];

%ret=[169,31,50];
%blau=[30,71,133];
I =zeros(600,900,3);
for j=1:3
for i=1:3
I(1+(j-1)*200:j*200,:,i)=I(1+(j-1)*200:j*200,:,i)+RWB(j,i); %Creating dutch flag
    
end
end
r=randperm(600*900);
r2=zeros(2,540000);
r2(1,:)=ceil(r./900);
r2(2,:)=mod(r-1,900)+1;
I2= zeros( size(I));
l=1;
for i=1:600
    for j=1:900
        I2(i,j,:)=I(r2(1,l),r2(2,l),:);%randomizing the flag
        l=l+1;
    end
end
C=[find(I2(:,:,1)==169),find(I2(:,:,1)==255),find(I2(:,:,1)==30)];
% subplot(1,3,1)
% imshow(uint8(I));
% subplot(1,3,2)
% imshow(uint8(I2));
%I2=uint8(I2);
%imshow(I2);
r=0;w=0;b=0;
 lo=1;mid=1;high=600*900;
  i=1;j=1;
  cout=0;
  r=0;
  dosyn=0;
while i<601 %The sorting algorithm applied
    j=1;
    while j<901
        if cout==r
            %x=input("hey");
            str="Dutch2/"+"DutchList"+ int2str(dosyn)+".png";
            imwrite(uint8(I2),str);
            dosyn=dosyn+1;
            r=randi(1800,1);
            cout=0;
        end
        if(mid>=high-1)
            break;
        end
           k=I2(i,j,:);
        if k(1)==RWB(1,1)
           I2(i,j,:)=I2(ceil(lo/900),1+mod(lo,900),:);
           I2(ceil(lo/900),mod(lo,900)+1,:)=k;
           lo=lo+1;mid=mid+1;
        elseif k(1)==RWB(2,1)
%              I2(i,j,:)=I2(ceil(mid/900),1+mod(mid,900),:);
%              I2(ceil(mid/900),mod(mid,900)+1,:)=k;
             mid=mid+1;
        elseif k(1)==RWB(3,1)
           I2(i,j,:)=I2(ceil(high/900),1+mod(high,900),:);
           I2(ceil(high/900),mod(high,900)+1,:)=k;
           high=high-1;
           if(j>1)
           j=j-1;
           elseif(i>1)
               j=899;
               i=i-1;
           end
        end
        j=j+1;
        cout=cout+1;
    end
    i=i+1;
end
str="Dutch/"+"DutchList"+ int2str(dosyn)+".png";% saving pictures for creating the gif
imwrite(uint8(I2),str);
% subplot(1,3,3)
% imshow(uint8(I2));
