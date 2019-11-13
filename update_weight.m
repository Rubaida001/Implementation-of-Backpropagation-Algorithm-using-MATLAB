function weight = update_weight(learning_rate,delta,weight,input)
n = 1;
while (n <= length(input))
m = 1;
    while(m<n)    
        if(weight(n,m)~=0)
            weight(n,m) = weight(n,m) + (learning_rate*delta(n)*input(m));
        end
        m = m+1;
    end
n = n+1;
end

return
end