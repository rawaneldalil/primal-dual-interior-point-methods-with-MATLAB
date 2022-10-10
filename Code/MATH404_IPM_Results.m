% clc;
% clear;
% 
% %% First Problem Optimal Solutions:
% 
% A = [2, 0, 2, 3; 0, -2, -2, -6];
% b = [10; -6];
% c = [1; 0; 1; 3];
% Equal = [0;0];
% 
% fixed_step_size = 0.3;
% centering_param = 0.1;
% 
% fixed_results = Central_Path_IPM(A, b, c, Equal, 'fixed', centering_param, fixed_step_size);
% adaptive_results = Central_Path_IPM(A, b, c, Equal, 'adapt', centering_param);
% mehrotra_results = Mehrotra_IPM(A, b, c, Equal);
% 
% figure
% plot(get_f_reduced(c, mehrotra_results{4}))
% title("Mehrotra Method: f(x) vs Iterations");
% xlabel("Iterations");
% ylabel("Objective Function f(x)")
% 
% figure
% plot(get_f_reduced(c, fixed_results{4}))
% title("Fixed-step-size Central Path Method: f(x) vs Iterations");
% xlabel("Iterations");
% ylabel("Objective Function f(x)")
% 
% figure
% plot(get_f_reduced(c, adaptive_results{4}))
% title("Adaptive-step-size Central Path Method: f(x) vs Iterations");
% xlabel("Iterations");
% ylabel("Objective Function f(x)")
% 
% xs_ss = x1_s1_x2_s2(fixed_results{4}, fixed_results{5});
% figure
% scatter(xs_ss{1},xs_ss{3}, 'b+')
% hold on
% plot(xs_ss{1},xs_ss{3})
% title("Fixed-step-size Central Path Method: Central Path");
% xlabel("x_1");
% ylabel("x_2")
% 
% figure
% scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
% hold on
% plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
% title("Fixed-step-size Central Path Method: Compelementary condition");
% xlabel("x_1.s_1");
% ylabel("x_2.s_2")
% 
% xs_ss = x1_s1_x2_s2(adaptive_results{4}, adaptive_results{5});
% figure
% scatter(xs_ss{1},xs_ss{3}, 'b+')
% hold on
% plot(xs_ss{1},xs_ss{3})
% title("Adaptive-step-size Central Path Method: Central Path");
% xlabel("x_1");
% ylabel("x_2")
% 
% figure
% scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
% hold on
% plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
% title("Adaptive-step-size Central Path Method: Compelementary condition");
% xlabel("x_1.s_1");
% ylabel("x_2.s_2")
% 
% xs_ss = x1_s1_x2_s2(mehrotra_results{4}, mehrotra_results{6});
% figure
% scatter(xs_ss{1},xs_ss{3}, 'b+')
% hold on
% plot(xs_ss{1},xs_ss{3})
% title("Mehrotra Central Path Method: Central Path");
% xlabel("x_1");
% ylabel("x_2")
% 
% figure
% scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
% hold on
% plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
% title("Mehrotra Method: Compelementary condition");
% xlabel("x_1.s_1");
% ylabel("x_2.s_2")
% %% Second Problem Optimal Solutions:
% 
% A = [6, 1, -2; 1, 1, 1;6, 4, -2];
% b = [5; 4; 10];
% c = [5; 2; -4];
% Equal = [1; -1; 1];
% 
% fixed_step_size = 0.45;
% centering_param = 0.1;
% 
% fixed_results = Central_Path_IPM(A, b, c, Equal, 'fixed', centering_param, fixed_step_size);
% adaptive_results = Central_Path_IPM(A, b, c, Equal, 'adapt', centering_param);
% mehrotra_results = Mehrotra_IPM(A, b, c, Equal);
% 
% figure
% plot(get_f_reduced(mehrotra_results{5}, mehrotra_results{4}))
% title("Mehrotra Method: f(x) vs Iterations");
% xlabel("Iterations");
% ylabel("Objective Function f(x)")
% 
% figure
% plot(get_f_reduced(mehrotra_results{5}, fixed_results{4}))
% title("Fixed-step-size Central Path Method: f(x) vs Iterations");
% xlabel("Iterations");
% ylabel("Objective Function f(x)")
% 
% figure
% plot(get_f_reduced(mehrotra_results{5}, adaptive_results{4}))
% title("Adaptive-step-size Central Path Method: f(x) vs Iterations");
% xlabel("Iterations");
% ylabel("Objective Function f(x)")
% 
% xs_ss = x1_s1_x2_s2(fixed_results{4}, fixed_results{5});
% figure
% scatter(xs_ss{1},xs_ss{3}, 'b+')
% hold on
% plot(xs_ss{1},xs_ss{3})
% title("Fixed-step-size Central Path Method: Central Path");
% xlabel("x_1");
% ylabel("x_2")
% 
% figure
% scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
% hold on
% plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
% title("Fixed-step-size Central Path Method: Compelementary condition");
% xlabel("x_1.s_1");
% ylabel("x_2.s_2")
% 
% xs_ss = x1_s1_x2_s2(adaptive_results{4}, adaptive_results{5});
% figure
% scatter(xs_ss{1},xs_ss{3}, 'b+')
% hold on
% plot(xs_ss{1},xs_ss{3})
% title("Adaptive-step-size Central Path Method: Central Path");
% xlabel("x_1");
% ylabel("x_2")
% 
% figure
% scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
% hold on
% plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
% title("Adaptive-step-size Central Path Method: Compelementary condition");
% xlabel("x_1.s_1");
% ylabel("x_2.s_2")
% 
% xs_ss = x1_s1_x2_s2(mehrotra_results{4}, mehrotra_results{6});
% figure
% scatter(xs_ss{1},xs_ss{3}, 'b+')
% hold on
% plot(xs_ss{1},xs_ss{3})
% title("Mehrotra Central Path Method: Central Path");
% xlabel("x_1");
% ylabel("x_2")
% 
% figure
% scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
% hold on
% plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
% title("Mehrotra Method: Compelementary condition");
% xlabel("x_1.s_1");
% ylabel("x_2.s_2")

%% Third Problem Optimal Solution

A = [2,1;1,3];
b = [8;8];
c = [-30; -20];
Equal = [-1;-1];

fixed_step_size = 0.45;
centering_param = 0.1;

fixed_results = Central_Path_IPM(A, b, c, Equal, 'fixed', centering_param, fixed_step_size);
adaptive_results = Central_Path_IPM(A, b, c, Equal, 'adapt', centering_param);
mehrotra_results = Mehrotra_IPM(A, b, c, Equal);

figure
plot(get_f_reduced(mehrotra_results{5}, mehrotra_results{4}))
title("Mehrotra Method: f(x) vs Iterations");
xlabel("Iterations");
ylabel("Objective Function f(x)")

figure
plot(get_f_reduced(mehrotra_results{5}, fixed_results{4}))
title("Fixed-step-size Central Path Method: f(x) vs Iterations");
xlabel("Iterations");
ylabel("Objective Function f(x)")

figure
plot(get_f_reduced(mehrotra_results{5}, adaptive_results{4}))
title("Adaptive-step-size Central Path Method: f(x) vs Iterations");
xlabel("Iterations");
ylabel("Objective Function f(x)")

xs_ss = x1_s1_x2_s2(fixed_results{4}, fixed_results{5});
figure
scatter(xs_ss{1},xs_ss{3}, 'b+')
hold on
plot(xs_ss{1},xs_ss{3})
title("Fixed-step-size Central Path Method: Central Path");
xlabel("x_1");
ylabel("x_2")

figure
scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
hold on
plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
title("Fixed-step-size Central Path Method: Compelementary condition");
xlabel("x_1.s_1");
ylabel("x_2.s_2")

xs_ss = x1_s1_x2_s2(adaptive_results{4}, adaptive_results{5});
figure
scatter(xs_ss{1},xs_ss{3}, 'b+')
hold on
plot(xs_ss{1},xs_ss{3})
title("Adaptive-step-size Central Path Method: Central Path");
xlabel("x_1");
ylabel("x_2")

figure
scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
hold on
plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
title("Adaptive-step-size Central Path Method: Compelementary condition");
xlabel("x_1.s_1");
ylabel("x_2.s_2")

xs_ss = x1_s1_x2_s2(mehrotra_results{4}, mehrotra_results{6});
figure
scatter(xs_ss{1},xs_ss{3}, 'b+')
hold on
plot(xs_ss{1},xs_ss{3})
title("Mehrotra Central Path Method: Central Path");
xlabel("x_1");
ylabel("x_2")

figure
scatter(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4}, 'r+')
hold on
plot(xs_ss{1}.*xs_ss{2},xs_ss{3}.*xs_ss{4})
title("Mehrotra Method: Compelementary condition");
xlabel("x_1.s_1");
ylabel("x_2.s_2")