function isStable = evaluateStability(f, V, h, domain)
    % f: Function handle for system dynamics (f(x))
    % V: Function handle for Lyapunov function (V(x))
    % h: Function handle for h(x) in Lyapunov condition
    % domain: A matrix where each column is a state vector in the domain

    % Check V(0) = 0
    if V(zeros(size(domain, 1), 1)) ~= 0
        disp('V(0) is not zero. Stability cannot be confirmed.');
        isStable = false;
        return;
    end

    % Check V(x) > 0 for x != 0
    for i = 1:size(domain, 2)
        x = domain(:, i);
        if any(x ~= 0) && V(x) <= 0
            disp('V(x) is not positive for all x != 0. Stability cannot be confirmed.');
            isStable = false;
            return;
        end
    end

    % Check DV(x)f(x) <= -h(x)
    syms x [size(domain, 1) 1]
    DV = gradient(V(x), x); % Compute the gradient of V
    for i = 1:size(domain, 2)
        x_val = domain(:, i);
        if any(x_val ~= 0) && dot(subs(DV, x, x_val), f(x_val)) > -h(x_val)
            disp('DV(x)f(x) is not negative definite. Stability cannot be confirmed.');
            isStable = false;
            return;
        end
    end

    % If all conditions are satisfied
    disp('The system is Lyapunov stable.');
    isStable = true;
end
