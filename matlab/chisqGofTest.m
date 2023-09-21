function [h, p, st] = chisqGofTest(e, o, alpha)
    arguments
        e
        o
    	alpha = 0.05;
    end
    
    n = length(e) - 1;
    [h, p,st] = chi2gof(0:n,'ctrs',0:n,'frequency',o,'expected',e,'nparams',0,'alpha',alpha);
end

