using Plots

T = 10.0 # s
dt = 1e-4 # s
nt = UInt32(T/dt) # number of timesteps
t = Array{Float32}(1:nt)*dt

function PeriodicSignal(t, period)
    b = []
    for num in t
        if round(num, digits=4)%period == 0
            push!(b,1)
        else
            push!(b,0)
        end
    end
    return b
end
  
S1 = PeriodicSignal(t, 1);
S2 = PeriodicSignal(t, 1.1317);
S3 = PeriodicSignal(t, 1.2781);
S4 = PeriodicSignal(t, 1.3486);
pooled = S1+S2+S3+S4;

plot(t, pooled ,st=:scatter,markersize=3,color="black")
ylims!((0.9,1.1))
savefig("test.png")