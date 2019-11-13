clc;
w= [-0.2,0.2,0.4,0.3,-0.3,0.05,0.2,-0.2,0.4];
weight = zeros([6 6]);
NINPUT = [1 1;0 1];
target = [0;1];

first_hidden_index = 3;
last_hidden_node = 5;        
last_output_node = 6;

number_of_nodes = 6;
learning_rate = 1;
ERROR = [];

%creating weight matrix
for i=first_hidden_index:number_of_nodes
    if(i==first_hidden_index)
        weight(3)=w(1);
    elseif(i==(first_hidden_index+1))
        weight(i,1:2)=w(3:4);
    elseif (i==(first_hidden_index+2))
        weight(i,2)=w(6);
    else
        weight(i,1)=w(2);
        weight(i,2)=w(5);
        weight(i,3:5)=w(9:-1:7);
    end
        
end


for epoch = 1:100
    for input_pattern = 1:length(NINPUT)
        input = NINPUT(input_pattern,:);

%forward propagation
        input = forward_prop(first_hidden_index,weight,input,last_output_node);

%backward propagation
        [ERROR(input_pattern),delta] = backward_prop(last_output_node,last_hidden_node,first_hidden_index,target(input_pattern),input,weight);
        
%weight update
        weight = update_weight(learning_rate,delta,weight,input);
    end   
%MSE calculation
    MSE = mse(ERROR)
end

