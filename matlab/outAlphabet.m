
function strArray = outAlphabet(M)

    T = matrixToAlphabet(M);

    % Tは入力テーブル
    % 出力は文字列の配列strArray

    % テーブルの行数を取得
    numRows = height(T);

    % 文字列を格納するための配列を初期化
    strArray = strings(numRows, 1);

    % テーブルの各行に対して処理を行う
    for i = 1:numRows
        % 空の文字列を作成
        str = "";
        % 各列に対する処理
        for j = 1:width(T)
            % テーブルの要素を取得
            element = T{i, j};
            % テーブルの要素が文字の場合、文字列に追加
            if ischar(element) || isstring(element)
                trimmedElement = strtrim(element);
                    str = str + trimmedElement;
            end
        end
        noSpaceStr = regexprep(str,"[^a-z]", "");
        % 作成した文字列を配列に格納
        strArray(i) = noSpaceStr;
    end
end

function T = matrixToAlphabet(M)
    % Mは入力行列
    % 出力はテーブル型T
    
    % 入力行列のサイズ取得
    [rows, cols] = size(M);
    
    % 結果を格納するセル配列を初期化
    result = cell(rows, cols);

    % 文字列の配列を生成（ここでは 'a', 'b', 'c', ...）
    letters = char('a' + (0:(cols-1)));
    
    % 各要素に対して処理を行う
    for i = 1:rows
        for j = 1:cols
            if M(i, j) == 1
                % 要素が1の場合、対応する文字をセット
                result{i, j} = letters(j);
            else
                % 要素が0の場合、0をセット
                result{i, j} = NaN;
            end
        end
    end
    
    % セル配列からテーブルを作成
    T = cell2table(result);
end

