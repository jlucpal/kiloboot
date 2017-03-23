classdef pintaEscenari<kapp
   
    methods
        function plot = pintaEscenari(b,a)%pinta el escenari de simulació
            plot.base=b;
            plot.altura=a;      
           %set(fig, 'Resize', 'off');
            axis([0 plot.base 0 plot.altura]);
            axis auto;
            set(gca, 'color', [1,1,1]);
            hold on;
            rectangle('Position',[0 0 plot.base plot.altura],...
                'LineWidth',3);
        end
       
        
                %close(fig);
    end
end
 