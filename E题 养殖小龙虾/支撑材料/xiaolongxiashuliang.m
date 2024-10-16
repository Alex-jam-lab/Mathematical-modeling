% 已有数据
years = [0:19]; % 将年份转换为相对于第一年的年数
lobsters = [3.81, 3.92, 3.95, 4.02, 4.10, 4.13, 4.16, 4.17, 4.26, 4.39, ...
            4.58, 4.83, 4.98, 5.07, 5.17, 5.30, 5.39, 5.46, 5.53, 5.60]; % 数量/千只

% 构建线性回归模型
p = polyfit(years, lobsters, 1);
m = p(1); % 斜率
b = p(2); % 截距

% 计算模型的决定系数 R?
y_mean = mean(lobsters);
SST = sum((lobsters - y_mean).^2); % 总平方和
SSR = sum((polyval(p, years) - y_mean).^2); % 回归平方和
R_squared = SSR / SST;

% 预测未来十年
futureYears = (20:29); % 未来十年的年数
predictedLobsters = polyval(p, futureYears);

% 输出模型信息
disp('模型方程: lobsters = m * year + b');
fprintf('斜率 (m): %.4f\n', m);
fprintf('截距 (b): %.4f\n', b);
fprintf('决定系数 (R?): %.4f\n', R_squared);

% 绘制已有数据
plot(years, lobsters, 'r. '); % 使用红色圆点表示实际数据
hold on; % 保持绘图窗口打开

% 在同一图表上绘制预测数据
plot(futureYears, predictedLobsters, 'b.'); % 使用蓝色圆点表示预测数据
hold off;

% 设置图表标题和轴标签
title('龙虾数量随时间的变化');
xlabel('年份');
ylabel('数量/千只');

% 显示预测结果
for i = 1:length(futureYears)
    fprintf('%d\t%.2f\n', futureYears(i)+1, predictedLobsters(i));
end