function [ERROR,beta] = backward_prop(last_output_node,last_hidden_node,first_hidden_node,target,input,weight)
beta = [];
while(last_output_node >= 6)
%calculate beta for output nodes
    ERROR = target-input(last_output_node);
    beta(last_output_node) = ERROR;
    last_output_node = last_output_node-1;
end 

while(last_hidden_node >= first_hidden_node)
%calculate beta for hidden nodes
    beta(last_hidden_node) = 0;
    k = last_hidden_node+1;
    while(k<=6)
        beta(last_hidden_node) = beta(last_hidden_node)+ weight(k,last_hidden_node)*beta(k);
        k=k+1;
    end 
    beta(last_hidden_node) = beta(last_hidden_node)*input(last_hidden_node)*(1-input(last_hidden_node));
    last_hidden_node = last_hidden_node-1;
end
return
end