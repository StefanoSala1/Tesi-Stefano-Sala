clear
close all
clc

%% initial conditions
yaw = 0; 
pitch = 0; 
roll = 0;
L=[1; 2; 0];

%% parameters

Jc=[420, -5, 2;
    -5, 380, 0;
    2, 0, 500;];
Jc1=Jc.';
%%
q_scalar_first = angle2quat(yaw, pitch, roll);
q_vect=q_scalar_first(2:4).';
q4=q_scalar_first(1);
q=[q_vect; q4];
qx=[0,  -q_vect(3)  q_vect(2);
    q_vect(3), 0,  -q_vect(1);
    -q_vect(2), q_vect(1), 0];

Iq=[eye(3)*q4+qx;
      -q_vect.'  ];


