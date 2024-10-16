% ��������
years = [0:19]; % �����ת��Ϊ����ڵ�һ�������
lobsters = [3.81, 3.92, 3.95, 4.02, 4.10, 4.13, 4.16, 4.17, 4.26, 4.39, ...
            4.58, 4.83, 4.98, 5.07, 5.17, 5.30, 5.39, 5.46, 5.53, 5.60]; % ����/ǧֻ

% �������Իع�ģ��
p = polyfit(years, lobsters, 1);
m = p(1); % б��
b = p(2); % �ؾ�

% ����ģ�͵ľ���ϵ�� R?
y_mean = mean(lobsters);
SST = sum((lobsters - y_mean).^2); % ��ƽ����
SSR = sum((polyval(p, years) - y_mean).^2); % �ع�ƽ����
R_squared = SSR / SST;

% Ԥ��δ��ʮ��
futureYears = (20:29); % δ��ʮ�������
predictedLobsters = polyval(p, futureYears);

% ���ģ����Ϣ
disp('ģ�ͷ���: lobsters = m * year + b');
fprintf('б�� (m): %.4f\n', m);
fprintf('�ؾ� (b): %.4f\n', b);
fprintf('����ϵ�� (R?): %.4f\n', R_squared);

% ������������
plot(years, lobsters, 'r. '); % ʹ�ú�ɫԲ���ʾʵ������
hold on; % ���ֻ�ͼ���ڴ�

% ��ͬһͼ���ϻ���Ԥ������
plot(futureYears, predictedLobsters, 'b.'); % ʹ����ɫԲ���ʾԤ������
hold off;

% ����ͼ���������ǩ
title('��Ϻ������ʱ��ı仯');
xlabel('���');
ylabel('����/ǧֻ');

% ��ʾԤ����
for i = 1:length(futureYears)
    fprintf('%d\t%.2f\n', futureYears(i)+1, predictedLobsters(i));
end