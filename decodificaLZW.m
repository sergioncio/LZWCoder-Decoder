function texto = decodificaLZW(codigo, diccionario)
% Transforma el código LZW al texto claro
alf=['a' 'b' 'c' 'ab'];   
MAXTAM=0;
    for i=1:1:length(alf)               
        MAXTAM = MAXTAM +length(alf(i));
    end
if isempty(diccionario{1})
    diccionario=cell(length(alf),1);
    for i=1:1:length(alf)               
        diccionario{i}=alf(i);
    end
end
old=codigo(1);   
s=diccionario{old};
texto=[s];
c = s(1);
i=1;
index=1;
count = length(diccionario);
while i<=length(codigo)-1
    new=codigo(i+1);
    
    if isempty(diccionario(new))
     	s=diccionario(old);
      	s= strcat(s,c);
    else
       	s=diccionario{new};
   	end
    texto=[texto s];
    c= s(1);
    letra=strcat(diccionario{old},c);
    if length(diccionario)<MAXTAM
        diccionario{length(diccionario)+1}=letra;
    end
    count=count+1;
    old=new;
    i=i+1;
end
end