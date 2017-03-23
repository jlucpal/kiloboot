%% Variables de iniciació

function [result]=program
clear all
init.altura=100; %Altura del escenari (recomanable no tocar)
init.base=100; %Base (recomanable no tocar)
init.num=100; %Nombre de kilobots
kbots=generaKbot(init);
result=Program(kbots);
%end
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
        g.kbots(x)= kbot(base,altura,x);
    else
        g.kbots(x)= kbot(base,altura,x);
        for j=1:x
            if x==j
            else
            if g.kbots(x).pos == g.kbots(j).pos
                x=x-1;
            else
                %g.kbots(x).set_color(led)
            end
            end
        end
    g.kbots(x).set_color(led);
    end
end
toc;

%% Bucle de Programa
function[p]=Program(obj)
tic;
a=1;
i=0;
num=max([obj.kbots.secretID]);
vari=false;
while ~ vari
    estados=[obj.kbots.estado];
    if obj.kbots(a).estado == 1
        if obj.kbots(a).secretID > 1
            obj.kbots(a).slave(obj.kbots(1).pos);
            obj.kbots(a).estimate_distance(obj.kbots(1).pos);
            obj.kbots(a).refresco;
    else
        obj.kbots(1).master;
        obj.kbots(1).set_color([1 0 0]);
    end
    end
    if(a==num)
        a=1;
        i=i+1;
    else
        a=a+1;
    end
    if (max(estados)==0)
        vari=true;
    end
    p=obj.kbots;
end
% p=obj.kbots;
toc;
for o=1:num
    obj.kbots(o).refresco;
end


