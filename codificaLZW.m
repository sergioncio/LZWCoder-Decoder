function [codigo, diccionario] = codificaLZW(texto, diccionario)
% Transforma el texto (1 byte/símbolo) a una codificacion LZW
alf=['a' 'b' 'c' 'd' 'r' 'ab'];   
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
k=texto(1);   
codigo=[];  
i=1;
index=1;
while i<=length(texto)   
    contenido=0;
    for i=1:length(diccionario)
        if(length(k)==length(diccionario{i}))   
            if(strcmp(k,diccionario{i})==1)
                z=i;    
                contenido=1;
            end
        end
    end
    if contenido==0  
        if length(diccionario)<MAXTAM 
            diccionario{length(diccionario)+1}=k;
        end
        codigo(length(codigo)+1)=z;     
        k=k(length(k));    
    else        
        index=index+1;
        if index>length(texto)    
            for i=1:length(diccionario)
                if(length(k)==length(diccionario{i}))
                    if(strcmp(k,diccionario{i})==1)
                        z=i;
                    end
                end
            end
            codigo(length(codigo)+1)=z;
            break;
        end
        k=[k texto(index)];   
    end
end
end