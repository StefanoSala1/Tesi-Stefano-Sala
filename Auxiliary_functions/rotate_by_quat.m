function y=rotate_by_quat(q_first, v)
q_first=quatnormalize(q_first);
dcm=quat2dcm(q_first);
y=dcm*(v.');
end