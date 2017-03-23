%% Variables de iniciació
function [result]=Skeleton
clear all;
init.altura=100;
init.base=100;
init.num=100;
kbots=generaKbot(init);
result=Program(kbots,init);
end
%% Generacio KiloBots
function [g]=generaKbot(init)
    led=[0 0 0];
    base=init.base;
    altura=init.altura;
    num=init.num;
pintaEscenari(base,altura);
tic;
for x=1:num
    if x==1
    g.kbots(x)= kbot(base,altura,x);%generació kilobots
    g.kbots(x).set_color(led);
    else
        g.kbots(x)= kbot(base,altura,x);
        if g.kbots(x).pos == g.kbots(x-1).pos
        x=x-1;
        else
        g.kbots(x).set_color(led);
        end
    end
end
toc;
end
%% Bucle de Programa
function[p]=Program(obj,init)
tic;
num=init.num;
k=1;
bool=false;
aux_x=false;
aux_y=false;
while ~ bool
    estados=[obj.kbots.estado];
    obj.kbots(k).refresco;
    if obj.kbots(k).pos(1) >= init.base - 5
        aux_x=true;
    elseif obj.kbots(k).pos(2)<= 5
        aux_x=false;
    end
    if obj.kbots(k).pos(2) >= init.altura - 5
        aux_y=true;
    elseif obj.kbots(k).pos(2)<= 5
        aux_y=false;
    end
    
    if aux_x==false;
        obj.kbots(k).derecha;
    else
        obj.kbots(k).izquierda;
    end
     if aux_y==false;
        obj.kbots(k).arriba;
    else
        obj.kbots(k).abajo;
    end
    if obj.kbots(k).get_voltage==0
        obj.kbots(k).estado=0;
    end
    if max(estados) == 0
        bool=true;
    end
    if(k==num)
        k=1;
    else
        k=k+1;
        
    end
end
toc;
p=obj.kbots;
end