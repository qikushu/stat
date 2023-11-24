function drawNetworkGraphT(pr, lineThickness)
    % 相関行列と変数名の取得
    corrMatrix = table2array(pr);
    varNames = pr.Properties.VariableNames;
    n = size(corrMatrix, 1);

    % グラフ用のエッジリストと重みの作成
    edgeList = [];
    weights = [];
    colors = [];

    for i = 1:n
        for j = i+1:n
            edgeList = [edgeList; i j];
            weights = [weights; abs(corrMatrix(i, j))];
            colors = [colors; corrMatrix(i, j) > 0];
        end
    end

    % グラフの作成
    G = graph(edgeList(:, 1), edgeList(:, 2), weights, varNames);

    % グラフの描画
    figure;
    p = plot(G, 'LineWidth', lineThickness*G.Edges.Weight);
    p.NodeLabel = varNames;
    layout(p, 'force'); % レイアウトを調整

    % 正の相関と負の相関のエッジを識別し、色を設定
    positiveEdges = find(colors == 1);
    negativeEdges = find(colors == 0);
    highlight(p, edgeList(positiveEdges, 1), edgeList(positiveEdges, 2), 'EdgeColor', 'r');
    highlight(p, edgeList(negativeEdges, 1), edgeList(negativeEdges, 2), 'EdgeColor', 'b');
end
