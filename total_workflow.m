disp('reading track data')
read_ptracks
disp('performing quality control')
quality_control_tracks
disp('calculating radii')
add_radius_qc_tracks
disp('calculating velocity vs radius')
velocity_vs_radius

%%
for i = 1:2
    % [v,rm,rm_p,rc,rc_p,t]
    load(['v_empirical_' num2str(i) '.mat'])
    load(['mean_v_empirical_' num2str(i) '.mat'])
    r     = rm;m_r = m_rm; rho_w = [1000; 1000]; rho_s = [1096; 1120]; rho_m = [1024; 1032]; f     = [2   ; 3   ]; slope = [1    ;  1 ]; g     = 9.81; g_p   = g *  (rho_s(i) - rho_w(i))/ rho_w(i); 
    % coefficients
    a     = -rho_w(i)./(g_p.*r); b     = -repmat(f(i)/g_p,length(a),1); c     = repmat(slope(i),length(a),1); v_theory =  ((-b + sqrt(b.^2 - 4.*a.*c))./(2*a));
    %
    f = figure();
    hold on
    caxis([prctile(t,25),prctile(t,75)])
    colormap(high_contrast_colormap(length(t),prctile(t,25),prctile(t,75),0,'spectral'))
    scatter(r,v,4,linspace(min(t),max(t),length(t)));
    scatter(m_r,m_v,80,linspace(min(m_t),max(m_t),length(m_t)),'filled','Marker','diamond');
    %scatter(r,v_theory,[],linspace(min(r),max(r),length(r)));
    ylim([0 200])
    colorbar
    f.set('Position',[600 200 960 720]);
    hold off
end