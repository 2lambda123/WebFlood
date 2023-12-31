vec4 simulationStep(vec2 pos, vec2 posLeft, vec2 posRight, vec2 posTop, vec2 posBottom) {
    vec4 here = simData(pos);

    if (H(here) <= 0.0) return vec4(V(here), H(here), T(here));

    vec4 origin = simData(pos - dt * V(here));
    float newHeight = H(origin);
    vec2 newVelocity = V(origin);

    if (newHeight <= 0.0) {
        newHeight = H(here);
        newVelocity = vec2(0.0, 0.0);
    }

    return vec4(newVelocity, newHeight, T(here));
}