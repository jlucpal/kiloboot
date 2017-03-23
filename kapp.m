classdef kapp < handle
    %KILOBOT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        secretID
        estado
        base
        altura
        stop
    end
    
    methods
        pintaEscenari(b,a)
        kbot(c,d,r)
        set_color(obj,led)
        desplaza(x,y,id) % En aquesta funcio per a implementar el moviment del kilobot (set_motors() de la llibreira original)
        refresco(obj)
        lados(obj)
        slave(obj,r,p)
        master(obj)
        set_voltage(obj)
    end
end