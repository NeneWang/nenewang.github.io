# Theorical Foundations of Genetic Algorithms

## Schemas and the Two Armed Bandit Problem


- Holland's schema analysis revealed that genetic algorithms implicitly estimate the average fitness of schemas, leading to "implicit parallelism" in the search process.
- Selection in genetic algorithms focuses the search on subsets of the search space with estimated above-average fitness, while crossover combines high-fitness "building blocks" to create strings of higher fitness.
- Mutation acts as an insurance policy to maintain genetic diversity in the population. Adaptation, according to Holland, involves a balance between exploration (testing new schemas) and exploitation (using and propagating known schemas), crucial for facing unpredictable environments.
- Holland's original genetic algorithm was proposed as an "adaptive plan" to achieve this balance. 
- Holland's schema analysis demonstrated that genetic algorithms achieve a near-optimal balance between exploration and exploitation.
- Holland's theory of schemas initially assumed binary strings and single-point crossover but has since been extended to different representations and crossover operators.

### The Two-Armed Bandit Problem


- The Two-Armed Bandit problem serves as a model to illustrate the tradeoff between exploration and exploitation, commonly studied in statistical decision theory and adaptive control.
- In this scenario, a gambler is given N coins to play a slot machine with two arms, each with different mean payoff rates and variances.
- The gambler's goal is to maximize total payoff over N trials by allocating samples to each arm, without prior knowledge of which arm has a higher payoff rate.
- The performance criterion is "on-line," meaning that the payoff at every trial contributes to the final evaluation of performance.
- Holland's solution to the Two-Armed Bandit problem suggests that, as more information is gained through sampling, the optimal strategy is to exponentially increase the probability of sampling the better-seeming arm relative to the worse-seeming arm.
- This solution can be applied to schema sampling in genetic algorithms, where schemas are analogous to arms in a multi-armed slot machine. The observed "payoff" of a schema is its observed average fitness, implicitly tracked by the genetic algorithm.
- Holland's claim, supported by the Schema Theorem, is that a near-optimal strategy for sampling schemas arises implicitly in the genetic algorithm, leading to the maximization of on-line performance.

### Sketch of a Solution



- The Two-Armed Bandit problem illustrates the challenge of maximizing expected profits over N trials by allocating samples to two arms without prior knowledge of their payoff rates.
- The gambler aims to minimize expected losses, defined as trials on which the true better arm is not sampled.
- Holland's solution involves calculating the losses `L(N - n, n)` over `N` trials, where `n` is the number of trials allocated to the arm with the lower observed payoff.

$$
q=\operatorname{Pr}\left(A_l(N, n)=A_1\right) .
$$


- The probability `q` represents the likelihood that the observed worse arm is actually the better arm, given the allocation of trials.


$$
L(N-n, n)=q(N-n)\left(\mu_1-\mu_2\right)+(1-q) n\left(\mu_1-\mu_2\right) .
$$

- The solution entails finding `n*` that minimizes `L(N - n, n)` by taking its derivative with respect to `n` and solving for `n`.

$$
q=\operatorname{Pr}\left(\frac{S_2^{N-n}}{N-n}>\frac{S_1^n}{n}\right)
$$

- Holland approximated `q` using the difference in the sums of payoffs for the two arms and corrected it using the theory of large deviations.
- The optimal allocation of trials `n*` to the observed second-best arm is approximated by an equation
- involving constants `c1`, `c2`, and `c3`.
- As `n*` increases, the optimal allocation of trials to the observed better arm should increase exponentially with the number of trials to the observed worse arm.









