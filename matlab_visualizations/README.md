
# Purpose

This project was designed as a **programming challenge** to simulate two distinct physical phenomena using a **restricted set of basic MATLAB functions**. The goal was more of a mental exercise than an optimized or production-ready tool.

# Simulations

## 1. **water\_properties.m**

The launcher script that allows you to select which simulation to run.

* Set `choice = 1` or `choice = 2` to pick between density simulation or temperature equilibrium analysis.

```matlab
choice = 1;  % 1 for density simulation, 2 for temperature equilibrium
```
## 2. **density\_simulation.m**

A simple particle-based animation where sand grains settle in water of varying densities.

* **Settling speed**: Based on a simplified Stokes’ Law.
* **Color coding**: Particles are colored by water density (blue, green, and red).
* **Constraint**: Rather than clearing the screen for each frame, the previous particle positions are overwritten with **white dots**—a deliberate design choice to avoid different animation methods.

## 3. **temperature\_equilibrium.m**

Analyzes how the mass of water affects its final temperature when placed in a steel container.

* **Comparison**: Experimental data is compared to theoretical predictions and a **nonlinear fit**.
* **Focus**: Highlights equilibrium behavior and demonstrates basic **curve fitting** techniques.


