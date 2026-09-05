---
title: "Izhikevich Neuron Model"
excerpt: "Exploring the 20 fundamental firing patterns of the mammalian cortex using a computationally efficient dynamical system."
collection: portfolio
---

## The Diversity of Firing
The Izhikevich model is a powerful "phenomenological" model. It doesn't aim to simulate every ion channel; instead, it uses a simplified system of two differential equations to replicate the *behavior* of almost any known cortical neuron.

### The Dynamics
The model is defined by:
$$v' = 0.04v^2 + 5v + 140 - u + I$$
$$u' = a(bv - u)$$

Where $v$ represents the membrane potential and $u$ is a recovery variable providing negative feedback.



### Implementation Highlights
* **Parameter Mapping:** I implemented a library of 20 distinct neuron types (Regular Spiking, Fast Spiking, Chattering, etc.) based on the original 2003/2004 papers.
* **Phase Plane Analysis:** My simulation includes a visualisation of the $v-u$ phase plane, allowing users to see how nullclines and fixed points shift to create different spiking regimes.
* **Interactive Selector:** Using Pluto.jl, visitors can toggle between neuron types to instantly see changes in the spike train.

## Why it Matters
This model bridges the gap between the biorealistic (Hodgkin-Huxley) and the abstract (LIF). It's the gold standard for large-scale simulations that require biological variety without the immense computational cost of conductance-based models.

---
### Note
*This model was created using Google Gemini 3 to focus on learning and understanding the fundamentals of the Izhikevich model, rather than the implementation details.*

<div class="simulation-container">
  <div class="simulation-toolbar">
    <span class="simulation-title"><i class="fas fa-brain"></i> Interactive Pluto.jl Simulation</span>
    <div class="simulation-buttons">
      <a href="{{ '/files/Izhikevich-Model.html' | relative_url }}" target="_blank" rel="noopener noreferrer" class="btn btn--primary">
        <i class="fas fa-up-right-from-square"></i> Open Fullscreen
      </a>
      <a href="https://github.com/CaldwellAlex/CaldwellAlex.github.io/blob/master/notebooks/Izhikevich-Model.jl" target="_blank" rel="noopener noreferrer" class="btn btn--inverse">
        <i class="fab fa-github"></i> View Julia Source
      </a>
    </div>
  </div>
  <iframe src="/files/Izhikevich-Model.html" sandbox="allow-scripts allow-same-origin allow-downloads" class="simulation-frame"></iframe>
</div>

---
### 🤝 Let's Connect
Are you working on neural modeling or systems neuroscience? I am always looking for opportunities to collaborate or contribute to computational research. Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/alexander-c-3a3660388) or [Email](mailto:hello@alexcaldwell.co.uk).