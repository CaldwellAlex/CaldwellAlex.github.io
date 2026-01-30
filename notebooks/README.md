# Computational Neuroscience Models (Julia)

This directory contains Julia implementations of fundamental neuron models. These notebooks are reactive (built with Pluto.jl) and are automatically exported to the website's portfolio.

### Models Included:
1. **Hodgkin-Huxley:** Conductance-based model of the squid giant axon.
2. **Izhikevich:** A phenomenological model capable of reproducing 20+ cortical firing patterns.
3. **Leaky Integrate-and-Fire:** The standard abstraction for large-scale simulations.

### How to Run Locally:
1. Open Julia in this directory.
2. Run `import Pkg; Pkg.activate("."); Pkg.instantiate()` to install exact dependencies.
3. Run `import Pluto; Pluto.run()` and open the `.jl` files.