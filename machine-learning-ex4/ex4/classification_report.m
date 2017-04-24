function [score, report] = classification_report(real, predict, num_labels)
real = real(:);
predict = predict(:);
real_size = size(real);
predict_size = size(predict);
if real_size ~= predict_size
    fprint('size not match');
    return ;
end

score = mean(double(real == predict));
report = zeros(num_labels, num_labels);
for index = 1 : real_size(1)
    report(real(index), predict(index)) = report(real(index), predict(index)) + 1;
end

end