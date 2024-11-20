using DSP, Plots

# Signal generator

f = 10
f_s = 1000.0
T = 1/f_s
t_max = 1
t = 0:T:t_max-T

signal = 2 * sin.(2 * pi * f * t) + sin.(2 * pi * 4.1 * f * t)
n=div(length(signal), 8)

# Spectrogram processing

spectrogram = stft(signal, n)

# Visualisation

s = plot(t, signal, label="Sine", xlabel="Time", ylabel="Amplitude", title="Signal")
savefig(s, "signal.png")

hm = heatmap(abs.(spectrogram), xlabel="Time", ylabel="Frequency", title="Spectrogram")
savefig(hm, "spectrogram.png")