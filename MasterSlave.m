%% Variables de iniciació
function [result]=MasterSlave
clear all;
init.altura=800;
init.base=800;
init.num=10;
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
num=init.num;
while ~ false
    estados=[obj.kbots.estado];
    %obj.kbots(a).dist=estimate_distance(obj.kbots,a);
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
%            if(i==num)
%             for j=1:num
%                 obj.kbots(j).refresco;
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
toc;
p=obj@kbots;
end