
clc
clear
format longg
w=11;
%w=input("Please enter the HCP:\n");
A=0:4;
K=0:4;
Q=0:4;
J=0:4;

pos=[0 0 0];
for w=0:40 % tüm HCP lerin olduğu array için
HCP=zeros(1,5);
new=HCP;

    for a=A
        for k=K
            for q=Q
                for j=J
                    if(a*4+k*3+q*2+j==w & a+k+q+j<=13) %Onör kartlarının toplamı istenilen sonucu verdiği ve el sayısını geçmediği
                       new(1:4)=[a k q j];%Onör kartlarının sayısı
                       new(5)=13-a-k-q-j;%Markaların sayısı
                       HCP=[HCP;new];%İlgili HCP nin tüm onör dağılım şekillerini yeni satır a kayıt ediyor
                       new=zeros(size(new));
                    end
                    
                end
                
            end
            
        end
        
    end
    HCP=HCP(2:size(HCP,1),:);%baştaki 0 satırını siilmek için
    HCP = unique(HCP,'rows');%tekrar etmesine karşın
    [r c]=size(HCP);
    sum=0;
    noO=36;%marka sayısı
    for i=1:r
        rp=1;
        for j=1:c
            if(j==c)
               rp=rp*nchoosek(36,HCP(i,j));%5. sütun olduğunda burada marka kartların dağılımı hesaplanıcak
            else
            rp=rp*nchoosek(4,HCP(i,j));%Diğer sütunlarda o Onör kartının renklerinin combinasyonları hesaplanıcak
            end
            
        end
        sum=sum+rp;%tüm onör dağılımlarının ellerinin olasılıkları toplanır
    end
    if(w>0)
    pos=[pos;[w,sum/nchoosek(52,13),pos(w,3)+sum/nchoosek(52,13)]];% HCP,Olasılığı,Toplam Olasılık
    elseif(w==0)
    pos=[w,sum/nchoosek(52,13),sum/nchoosek(52,13)];%0 satırını 0 HCP satırı olarak düzenlemek için   
    end
    
    
end
%pos
query=input("Please Enter the HCP you want to see its probabilty\nor open the pos array to check all the HCPs' probabilties\n[HCP,Individual probabilty, Cummulative probabilty]:\n");
fprintf("\nThe probabilty of HCP= %f",pos(query+1,2))