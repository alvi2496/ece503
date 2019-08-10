function processed_data = process(raw_data)
    m = mean(raw_data);
    processed_data = raw_data - m;
end

