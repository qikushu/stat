function [p, df, chi2] = chisqIndTest(mat, alpha)
    arguments
        mat
    	alpha = 0.05;
    end
    
    sumColumn = sum(mat, 1);
    sumRow = sum(mat, 2);
    [rowNum, colNum] = size(mat);
    rowDf = rowNum - 1;
    colDf = colNum - 1;
    df = rowDf * colDf;
    sumAll = sum(mat(:));

    probColumn = sumColumn / sumAll;
    probRow = sumRow / sumAll;

    probCell = probRow * probColumn;
    freqExpCell = probCell * sumAll;

    e = reshape(freqExpCell, 1, []);
    o = reshape(mat, 1, []);

    [~, ~, st] = chisqGofTest(e, o, alpha);
    chi2 = st.chi2stat;
    p = 1 - chi2cdf(chi2, df);

end
