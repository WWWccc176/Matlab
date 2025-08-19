function PV = PresentValue(Cash, ZeroRates, Years)
    PV = zeros(size(Cash));
    for i = 1:length(Cash)
        PV(i) = Cash(i) * exp(-ZeroRates(i) * Years(i));
    end
end
