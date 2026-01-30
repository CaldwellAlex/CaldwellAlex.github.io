### A Pluto.jl notebook ###
# v0.20.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    return quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ a9aab78c-b289-4879-9bf2-6c1a8d82ce07
begin
    import Pkg
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(name="Plots", version="1.38.17"),
        Pkg.PackageSpec(name="PlutoUI", version="0.7.54"),
    ])
    using Plots
    using PlutoUI
end

# ╔═╡ dbc643f8-2ef1-4c94-8cdd-0ef6dab927a7
### A Pluto.jl Notebook ###
# v0.19.27

using Markdown

# ╔═╡ 34dc6ae7-a12a-45c3-9d39-c548a13cc451
using InteractiveUtils

# ╔═╡ 22548672-397f-4d16-aec9-2f7cc27eb24d
md"""
# 🧠 Interactive Izhikevich Model
Use the dropdown below to select a neuron type. The simulation will update to show 
the voltage trace ($V$) and the recovery variable ($u$).
"""

# ╔═╡ 71a17718-dd04-47bc-a5fd-d6dec6d7b02a
PlutoUI.TableOfContents()

# ╔═╡ 6b5be730-8a29-4dfe-955b-021f9ee1a69a
md"""
# Izhikevich Neuron Model Explorer
Explore the 20 neuron types defined by Eugene Izhikevich (2004). Select a type from the dropdown to see its characteristic firing pattern.

**Note:** Some behaviors (like *Rebound Spike*) require negative input currents. Adjust the input slider accordingly!
"""

# ╔═╡ 8958f1c2-e864-4f91-b16e-3b550e8ea985
# Dictionary of neuron parameters (a, b, c, d)
const izhikevich_types = Dict(
    "Tonic Spiking" => (a=0.02, b=0.2, c=-65.0, d=6.0),
    "Phasic Spiking" => (a=0.02, b=0.25, c=-65.0, d=6.0),
    "Tonic Bursting" => (a=0.02, b=0.2, c=-50.0, d=2.0),
    "Phasic Bursting" => (a=0.02, b=0.25, c=-55.0, d=0.05),
    "Mixed Mode" => (a=0.02, b=0.2, c=-55.0, d=4.0),
    "Frequency Adaptation" => (a=0.01, b=0.2, c=-65.0, d=8.0),
    "Class 1 Excitable" => (a=0.02, b=-0.1, c=-55.0, d=6.0),
    "Class 2 Excitable" => (a=0.2, b=0.26, c=-65.0, d=0.0),
    "Spike Latency" => (a=0.02, b=0.2, c=-65.0, d=6.0),
    "Subthreshold Osc." => (a=0.05, b=0.26, c=-60.0, d=0.0),
    "Resonator" => (a=0.1, b=0.26, c=-60.0, d=0.0),
    "Integrator" => (a=0.02, b=-0.1, c=-55.0, d=6.0),
    "Rebound Spike" => (a=0.03, b=0.25, c=-60.0, d=4.0),
    "Rebound Burst" => (a=0.03, b=0.25, c=-52.0, d=0.0),
    "Threshold Variability" => (a=0.03, b=0.25, c=-60.0, d=4.0),
    "Bistability" => (a=0.1, b=0.26, c=-60.0, d=0.0),
    "Depolarizing After-pot." => (a=1.0, b=0.2, c=-60.0, d=-21.0),
    "Accommodation" => (a=0.02, b=1.0, c=-55.0, d=4.0),
    "Inhibition-induced Sp." => (a=-0.02, b=-1.0, c=-60.0, d=8.0),
    "Inhibition-induced Bu." => (a=-0.02, b=-1.0, c=-60.0, d=2.0)
)

# ╔═╡ c3951f49-f863-4c7e-bc9b-aeb2475a6419
md"""
### Settings
**Select Neuron Type:**
$(@bind selected_type Select(sort(collect(keys(izhikevich_types)))))

**Input Current (I):**
Ampltiude: $(@bind I_amp Slider(-20:1:20, default=10, show_value=true))
Start (ms): $(@bind I_start Slider(0:100:1000, default=100, show_value=true))
Duration (ms): $(@bind I_dur Slider(0:100:1000, default=800, show_value=true))
"""

# ╔═╡ 50e91101-eedd-42a8-83d0-4a3da3a6a866
begin
    # Get parameters for selected type
    params = izhikevich_types[selected_type]

    # Simulation Parameters
    dt = 0.5
    T = 1000.0
    time = 0:dt:T
    n_steps = length(time)

    v = zeros(n_steps)
    u = zeros(n_steps)
    input_current = zeros(n_steps)

    # Initial Conditions
    v[1] = params.c
    u[1] = params.b * v[1]

    # Create Input Pulse
    start_idx = Int(floor(I_start / dt)) + 1
    end_idx = min(n_steps, start_idx + Int(floor(I_dur / dt)))
    if start_idx < n_steps
        input_current[start_idx:end_idx] .= I_amp
    end

    # Simulation Loop (Hybrid Euler)
    for i in 1:(n_steps-1)
        I = input_current[i]
        v_prev = v[i]
        u_prev = u[i]

        # Hybrid Euler logic
        v_half = v_prev + 0.5 * dt * (0.04 * v_prev^2 + 5 * v_prev + 140 - u_prev + I)
        v_new = v_half + 0.5 * dt * (0.04 * v_half^2 + 5 * v_half + 140 - u_prev + I)

        u_new = u_prev + (params.a * (params.b * v_new - u_prev)) * dt

        if v_new >= 30.0
            v[i+1] = 30.0
            v_new = params.c
            u_new += params.d
        else
            v[i+1] = v_new
        end

        u[i+1] = u_new

        # Reset for next step to handle the reset logic correctly
        if i < n_steps - 1
            # We need to set the state for the next iteration based on resets
            # But here we are just filling history arrays.
            # The loop structure needs slight adjustment to carry state correctly.
            # Actually, simpler:
            v[i+1] = v_new # This might be overwritten if it was a spike? No.
            # If spike happened:
            if v[i+1] == 30.0
                # The 'reset' value is applied for the calculation of step i+2
                # But we store 30.0 for visualization at step i+1.
                # The starting value for step i+2 should be params.c
                # Let's fix the loop to be more standard state-based.
            end
        end
    end

    # Re-writing the loop for clarity and correctness in the reactive context
    v = zeros(n_steps)
    u = zeros(n_steps)
    curr_v = params.c
    curr_u = params.b * curr_v

    v[1] = curr_v
    u[1] = curr_u

    for i in 1:(n_steps-1)
        I = input_current[i]

        # Hybrid Euler
        v_half = curr_v + 0.5 * dt * (0.04 * curr_v^2 + 5 * curr_v + 140 - curr_u + I)
        curr_v = v_half + 0.5 * dt * (0.04 * v_half^2 + 5 * v_half + 140 - curr_u + I)

        curr_u = curr_u + (params.a * (params.b * curr_v - curr_u)) * dt

        if curr_v >= 30.0
            v[i+1] = 30.0
            curr_v = params.c
            curr_u += params.d
        else
            v[i+1] = curr_v
        end
        u[i+1] = curr_u
    end

    # Plotting
    p1 = plot(time, v, label="Membrane Potential (mV)", ylabel="v (mV)", title="Izhikevich Model: $(selected_type)", color=:blue)
    plot!(p1, time, input_current, label="Input Current", color=:green, linestyle=:dash, alpha=0.5)
    p2 = plot(time, u, label="Recovery Variable (u)", xlabel="Time (ms)", ylabel="u", color=:red)

    plot(p1, p2, layout=(2, 1), size=(800, 600))
end

# Cell order:
# ╠═7c68884c-c045-11ee-3dee-6dc488009774
# ╟─6d97e20e-c045-11ee-2abc-91c89000a651
# ╠═8a12b34a-c045-11ee-0fed-23c89000a651
# ╟─9b23c45a-c045-11ee-1234-567890abcdef
# ╠═ac34d56b-c045-11ee-5678-123456abcdef

# ╔═╡ Cell order:
# ╠═22548672-397f-4d16-aec9-2f7cc27eb24d
# ╠═71a17718-dd04-47bc-a5fd-d6dec6d7b02a
# ╠═dbc643f8-2ef1-4c94-8cdd-0ef6dab927a7
# ╠═34dc6ae7-a12a-45c3-9d39-c548a13cc451
# ╠═a9aab78c-b289-4879-9bf2-6c1a8d82ce07
# ╠═6b5be730-8a29-4dfe-955b-021f9ee1a69a
# ╠═8958f1c2-e864-4f91-b16e-3b550e8ea985
# ╠═c3951f49-f863-4c7e-bc9b-aeb2475a6419
# ╠═50e91101-eedd-42a8-83d0-4a3da3a6a866