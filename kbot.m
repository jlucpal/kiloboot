classdef kbot < kapp
    properties
        led=[]
        pos=[]
        radius
        kiloPlot
        mult
        r_m
        orient
        iter
        dist
        volt
    end
    
    methods
        function obj = kbot(c,d,id)
            obj.estado=1;
            obj.secretID = id;%Identificador de cada kilobot
            obj.radius = 1;%Radio!
            obj.mult=1;
            obj.r_m= obj.radius*obj.mult;
            obj.base=c;
            obj.altura=d;
            obj.pos = [randi(c) randi(d)];%Creacio de la pocició RANDOM
            %obj.pos = [c d];
            obj.orient=randi(360);
            obj.iter=0; %Numero de iteracions per cada kilobot
        end
        %Moviment sobre el escenari%
        function arriba(obj)
            obj.pos=[obj.pos(1), obj.pos(2)+obj.radius];
            obj.iter= obj.iter+1;
            
        end
        function derecha(obj)
            obj.pos= [obj.pos(1)+obj.r_m, obj.pos(2)];
            obj.iter= obj.iter+1;
        end
        function izquierda(obj)
            obj.pos= [obj.pos(1)-obj.r_m, obj.pos(2)];
            obj.iter= obj.iter+1;
        end
        function abajo(obj)
            obj.pos=[obj.pos(1), obj.pos(2)-obj.r_m];
            obj.iter=obj.iter+1;
        end
        function desplaza(obj,x,y)
            
%             if obj.pos(1)==obj.base || obj.pos(2)==obj.altura
%                 obj.estado=0;
%                 pinta(obj,[0 1 0]);
%             else
%                 obj.estado=1;
%            end
            
            if obj.estado==1
                if (x==y)
                    arriba(obj);
                    refresco(obj);
                elseif (x==0)
                    derecha(obj);
                    refresco(obj);
                elseif (y==0)
                    izquierda(obj);
                    refresco(obj);
                end
            end
            
        end
        function refresco(obj)
            set(obj.kiloPlot,'XData', obj.pos(1),'YData', obj.pos(2));
            %pause(0.01);
            drawnow;
        end
        function centro(obj)
            if(obj.pos(1)> obj.base/2 && obj.pos(2)>obj.altura/2)
                x=obj.pos(1) - obj.base;
                y=obj.pos(2) - obj.altura;
                for i=0:x
                    izquierda(obj);
                    %pinta(obj,obj.led);
                    refresco(obj);
                end
                for j=0:y
                    abajo(obj);
                    %pinta(obj,obj.led);
                    refresco(obj);
                end
            end
        end
        function lados(obj)
            if obj.pos(1)>=(obj.base-(obj.radius*2))  || obj.pos(2)>=(obj.altura-(obj.radius*2)) || obj.pos(1)<=(obj.radius*2) || obj.pos(2)<=obj.radius*2
                obj.estado=0;
                pinta(obj,[1 0 0]);
            else
                obj.estado=1;
            end
            
            if obj.estado==1
                if(obj.pos(2)>(obj.altura/2))
                    arriba(obj);
                else
                    abajo(obj);
                end
                if(obj.pos(1)>(obj.base/2))
                    derecha(obj);
                else
                    izquierda(obj);
                end
            end
        end
        function slave(obj,a)
            %obj.estimate_distance(a);
            if obj.estado==1
                if a(1) < obj.pos(1)
                    %Estas dreta
                    izquierda(obj);
                elseif a(1) > obj.pos(1)
                    %estas esquerra
                    derecha(obj);
                end
                if a(2) < obj.pos(2)
                    %estas dalt
                    abajo(obj);
                elseif a(2) > obj.pos(2)
                    %estas baix
                    arriba(obj);
                end
            end
        end
        function master(obj)
            obj.estado=0;
        end
        %Funcions Implementades KiloBot.h%
        function set_color(obj,led)
            
            obj.kiloPlot = plot(obj.pos);
            set(obj.kiloPlot, 'Marker', 'o'); %Forma
            set(obj.kiloPlot, 'MarkerEdgeColor', led); %Color de de fora
            set(obj.kiloPlot, 'MarkerFaceColor', led); %Color kilobot (en funcions de kilobot seria el set_color())
            set(obj.kiloPlot, 'MarkerSize', 5); %Grandaria del kilobot
            refresco(obj);
            
        end
        function set_motor(obj,l,r)
            if(r==255 && l==0)
                derecha(obj);
            elseif(r==0 && l==255)
                izquierda(obj);
            elseif (r==255 && l==255)
                arriba(obj);
            else
                abajo(obj);
            end
        end
        function [dist]=estimate_distance(obj,a)
            aux_x=obj.pos(1)- a(1);
            aux_y=obj.pos(2)- a(2);
            if aux_x<0
                aux_x=aux_x * -10;    
            end
            if aux_y<0
                aux_y=aux_y * -10;
            end
            if aux_x<obj.r_m+1 && aux_y < obj.r_m+1
                obj.estado=0;                             
            else
                obj.estado=1;
            end
            dist=[aux_x aux_y];
        end
        function [volt]=get_voltage(obj)
            volt=3.5-(obj.iter*0.0684);
            if volt<0
                volt=0;
                %estado(obj)=0;
            end
            if volt>=3
                set_color(obj,[0 1 0]);
                refresco(obj);
            elseif volt>=2
                set_color(obj,[0 0 1]);
                refresco(obj);
            elseif volt>=1
                set_color(obj,[1 0 0]);
                refresco(obj);
            else

            end
       
        end
        
    end
end
