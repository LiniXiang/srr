function bbeta=FOSM(x)
muX = [0 0]';          
sigmaX = [1 1]';        
x0 = repmat(eps,length(muX),1);     

    while norm(x-x0)/norm(x0) > 1e-6
          x0 = x;
          g = funEX01(x);     
          gX = [0.4*exp(0.4*(x(1)+2)+6.2);-0.3*exp(0.3*x(2)+5)];  
          gs = gX.*sigmaX;                    
          alphaX = -gs/norm(gs);              
          bbeta = (g+gX.'*(muX-x))/norm(gs);  
          x = muX+bbeta*sigmaX.*alphaX;       
    end

bbeta2 = bbeta;   
end