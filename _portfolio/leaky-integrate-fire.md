---
title: "Leaky Integrate-and-Fire Neuron Model"
excerpt: "Simulating the fundamental unit of large-scale spiking neural networks (SNNs)."
collection: portfolio
---

## The Power of Simplification
The Leaky Integrate-and-Fire (LIF) model is the "workhorse" of theoretical neuroscience. By ignoring the specific shape of the action potential and focusing on the timing of the "spike," we can simulate thousands of interacting neurons simultaneously.

### The Physics
The neuron is modeled as a simple $RC$ circuit where the membrane is a capacitor ($C$) in parallel with a resistor ($R$):

$$\tau_m \frac{dV}{dt} = -(V - V_{rest}) + R I(t)$$

When $V$ reaches a threshold $V_{th}$, a spike is recorded, and $V$ is reset to $V_{reset}$ for a refractory period.



### Implementation Highlights
* **Threshold Logic:** Efficient handling of the discontinuous "reset" event in Julia.
* **Current Injection:** Exploration of how different input currents ($I$) affect the firing frequency (F-I curves).
* **Scalability:** This implementation serves as the foundational unit for my future work in Spiking Neural Networks (SNNs).

## Why it Matters
In Theoretical Neuroscience, we often care more about the *information* carried by spike timing than the biophysics of the channel. The LIF model is the essential tool for studying neural coding and population dynamics.

While the Hodgkin-Huxley model is a beautiful masterpiece of biology, the LIF model is the engineer’s best friend. It’s the 'spherical cow' of neuroscience—simplified, but incredibly useful.

<iframe src="/files/Leaky-Integrate-Fire-Model.html" style="width:100%; height:100vh; border:none;"></iframe>
* Problems viewing the simulation? [Click here to open it in a new tab.]({{ base_path }}/files/Leaky-Integrate-Fire-Model.html)

---
### 🤝 Let's Connect
Are you working on neural modeling or systems neuroscience? I am always looking for opportunities to collaborate or contribute to computational research. Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/alexander-c-3a3660388) or [Email](mailto:caldwella1@cardiff.ac.uk).