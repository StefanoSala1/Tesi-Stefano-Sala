function y=scalarLast_toFirst(q_scalar_last)
q_vect=q_scalar_last(1:3);
q1=q_scalar_last(4);
y=[q1; q_vect];
end