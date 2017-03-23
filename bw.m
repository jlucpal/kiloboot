%% Variables de iniciació
function [result]=bw
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
end
%% Bucle de Programa
function[p]=Program(obj,init)
tic;
a=1;
i=0;
o=0
num=init.num;

for x=1:num
    if x<=25
        pos(x)= [num/4 (num/4)+o]
    end
    o=o+10;
end

while ~ false
    estados=[obj.kbots.estado];
    %obj.kbots(a).dist=estimate_distance(obj.kbots,a);
    if obj.kbots(a).estado == 1
        
    else
        obj.kbots(a).slave([pos]);
    end
    

%            if(i==num)
%             for j=1:num
                obj.kbots(a).refresco;
%             end
%             i=1;
%         end
if(a==num)
    a=1;
    i=i+1;

else
    a=a+1;
end

if (max(estados)==0)
    break;
end
%ºhandles.kbots(a).get_voltage;
end
toc
p=obj@kbots;
end