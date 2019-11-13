function input = forward_prop(first_hidden_index,weight,input,last_output_node)
while(first_hidden_index <= last_output_node)
    sum = 0;
    j=1;
    while(j < first_hidden_index)
        sum= sum+ weight(first_hidden_index,j)*input(j);
        j=j+1;
    end 
    %check if the function is sigmoid or summation
    if(first_hidden_index == last_output_node)
        input(first_hidden_index)= sum;
    else input(first_hidden_index)= 1/(1+exp(-sum));
    end
    
    first_hidden_index = first_hidden_index+1;
end
return
end