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
Implementing this model highlighted the "all-or-nothing" nature of the action potential. By visualising the phase plane of $V$ vs. $n$ (the potassium activation variable), I explored the stability of the resting state and the limit cycle of repetitive firing.

### Note
*This model was created using Google Gemini 3 to focus on learning and understanding the fundamentals of the Hodgkin-Huxley model, rather than the implementation details.*

<div class="simulation-container">
  <div class="simulation-toolbar">
    <span class="simulation-title"><i class="fas fa-wave-square"></i> Interactive Pluto.jl Simulation</span>
    <div class="simulation-buttons">
      <a href="{{ '/files/Hodgkin-Huxley-Model.html' | relative_url }}" target="_blank" rel="noopener noreferrer" class="btn btn--primary">
        <i class="fas fa-up-right-from-square"></i> Open Fullscreen
      </a>
      <a href="https://github.com/CaldwellAlex/CaldwellAlex.github.io/blob/master/notebooks/Hodgkin-Huxley-Model.jl" target="_blank" rel="noopener noreferrer" class="btn btn--inverse">
        <i class="fab fa-github"></i> View Julia Source
      </a>
    </div>
  </div>
  <iframe src="/files/Hodgkin-Huxley-Model.html" sandbox="allow-scripts allow-same-origin allow-downloads" class="simulation-frame"></iframe>
</div>

---
### 🤝 Let's Connect
Are you working on neural modeling or systems neuroscience? I am always looking for opportunities to collaborate or contribute to computational research. Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/alexander-c-3a3660388) or [Email](mailto:hello@alexcaldwell.co.uk).