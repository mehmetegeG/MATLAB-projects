clc
clear
format shortg
totalhand=nchoosek(52,13);%el için tüm olası durumlar
x=0;

qqq=[5 4 4 0];
%  qqq=input("Olasılığını görmek istediğiniz el desenini [a,b,c,d] olarak giriniz\n");

  unX=unique(perms(qqq),'rows'); %el desenlerinin tüm renk permütasyonlarını gösteren array
                for i=1:size(unX,1) 
                    nc=nchoosek(13,unX(i,1))*nchoosek(13,unX(i,2))*nchoosek(13,unX(i,3))*nchoosek(13,unX(i,4));
                    %her bir renk kombinasyonunun özel olasılığı,Her bir
                    %renk grubunu kendi grubundan seçtiğimiz için nchoosek.
                    x=x+nc;
                    
                end
             
                x/totalhand % istediğimiz durumların , el için tüm olası durum sayısına bölümü ile olasılık bulunur.

