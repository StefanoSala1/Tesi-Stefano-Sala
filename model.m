clear
close all
clc

%% initial conditions
yaw = 0; 
pitch = 0; 
roll = 0;
L=[1; 2; 0];

%% parameters
mu=3.986004418e14;
Jc=[400, 0, 0;
    0, 450, 0;
    0, 0, 500;];
Jc1=inv(Jc);

%r=3.6e7; %geostationary
r=1e6;%Leo
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

%%qint=[0.17446;0.59506;-0.73295; 0.27976];

%%
u=[2; 3; 5; 0.4];
q4=u(4);
q_vect=u(1:3);
qx=[0,  -q_vect(3)  q_vect(2);
    q_vect(3), 0,  -q_vect(1);
    -q_vect(2), q_vect(1), 0];

Iq=[diag([q4, q4, q4])+qx;
      -q_vect.'  ];
y = Iq;

 y2=[u(4), -u(3), u(2);
    u(3), u(4), -u(1);
    -u(2), u(1), u(4);
    -u(1),-u(2),-u(3);];
D=y-y2;