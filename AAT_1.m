p1 = patchMicrostrip;
p1.Length = 40e-3;
p1.Width = 30e-3;
p1.Height = 1.57e-3;
p1.GroundPlaneLength = 80e-3;
p1.GroundPlaneWidth = 60e-3;
p1.FeedOffset = [5.5e-3 0];
openDielectricCatalog
p1.Substrate = dielectric(Name="material1",EpsilonR=2.33);
pb1 = pcbStack(p1);
pb1.FeedDiameter = sqrt(2)*1e-3;
pb1.FeedViaModel = "square"
figure
show(pb1)
figure
mesh(pb1,MaxEdgeLength=0.01,MinEdgeLength=0.003)
figure
impedance(pb1,linspace(2.2e9,2.5e9,21))
figure
pattern(pb1, 2.37e9)
p2 = patchMicrostrip;
p2.Length = 36e-3;
p2.Width = 48e-3;
p2.Height = 3.82e-3;
p2.GroundPlaneLength = 55e-3;
p2.GroundPlaneWidth = 80e-3;
p2.FeedOffset = [4.0e-3 0];
p2.Substrate = dielectric(Name="material2",EpsilonR=9.29);
pb2 = pcbStack(p2);
pb2.Layers{1}.NumPoints = 40;
pb2.Layers{3}.NumPoints = 40;
pb2.FeedDiameter = sqrt(2)*1e-3;
pb2.FeedViaModel = "square";
figure
show(pb2)
figure
impedance(pb2,linspace(1.2e9,1.35e9,7))
figure
mesh(pb2)
figure
mesh(pb2,MaxEdgeLength=0.00165)
load thickpatch
figure
plot(freq*1e-9, real(Z), 'b', freq*1e-9, imag(Z), 'r', LineWidth=2);
legend("resistance", "reactance");
title("Impedance");
ylabel("Impedance (ohms)");
xlabel("Frequency (GHz)");
grid on;
figure
patternCustom(D.', 90-el, az);
h = title("Directivity (dBi)");
h.Position = [-0.4179, -0.4179, 1.05];