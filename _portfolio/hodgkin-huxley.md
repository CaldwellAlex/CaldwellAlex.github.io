---
title: "Hodgkin-Huxley Neuron Model"
excerpt: "A biophysically grounded simulation of action potential generation in the squid giant axon using Julia."
collection: portfolio
---

### The Equations
The model consists of four non-linear ordinary differential equations (ODEs). The total membrane current is given by:

$$C_m \frac{dV}{dt} = I_{ext} - \bar{g}_{Na}m^3h(V - E_{Na}) - \bar{g}_Kn^4(V - E_K) - \bar{g}_L(V - E_L)$$



### Key Features of my Julia Implementation
* **Gating Variables:** Visualization of the $m, n,$ and $h$ variables to show how channel opening/closing lags behind voltage changes.
* **Refractory Period:** Demonstration of the absolute and relative refractory periods through dual-pulse stimulation.
* **Interactive Parameters:** My Pluto.jl implementation allows for real-time manipulation of maximal conductances ($\bar{g}$) to simulate channel-blocking drugs (like TTX or TEA).

## Insights Gained
Implementing this model highlighted the "all-or-nothing" nature of the action potential. By visualizing the phase plane of $V$ vs. $n$ (the potassium activation variable), I explored the stability of the resting state and the limit cycle of repetitive firing.

<iframe src="/files/Hodgkin-Huxley-Model.html" style="width:100%; height:100vh; border:none;"></iframe>
* Problems viewing the simulation? [Click here to open it in a new tab.](/assets/notebooks-html/Hodgkin-Huxley-Model.html)

---
### 🤝 Let's Connect
Are you working on neural modeling or systems neuroscience? I am always looking for opportunities to collaborate or contribute to computational research. Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/alexander-c-3a3660388) or [Email](mailto:caldwella1@cardiff.ac.uk).