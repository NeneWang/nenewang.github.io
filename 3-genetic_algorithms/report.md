
## Introduction to Genetic Algorithms


Here a small section describing distinctively what Genetic Algorithms are and how they are used in optimization problems.


###  Resources


::::{card-carousel} 2

:::{card}
:margin: 3
:class-body: text-center
:class-header: bg-light text-center
:link: https://paper.flys.dev/api/documents/429/preview/
**Hands-On Genetic Algorithms with Python**
^^^
```{image} https://gcdnb.pbrd.co/images/sCQNSiRcgwcH.png?o=1
:height: 100
```

+++
{bdg-primary}`Packt`
{bdg-primary}`Eyal Wirsansky`
+++
Explore this project {fas}`arrow-right`
:::


:::{card}
:margin: 3
:class-body: text-center
:class-header: bg-light text-center
:link: https://paper.flys.dev/api/documents/428/preview/
**An Introduction To Genetic Algorithms**
^^^
```{image} https://storage.googleapis.com/openscreenshot/V%2F5%2Fs/ksaYnDs5V.png
:height: 100
```

+++
{bdg-primary}`Mitchell Melanie`
{bdg-primary}`MIT Press`
+++
Quick Access {fas}`arrow-right`
:::

::::

## 2. Understanding the Key Components of Genetic Algorithms



![](../img/genetic-algorithms-book-report_image_1.png)

### Selection Methods


| Selection Method              | Illustration                          |
| ----------------------------- | ------------------------------------- |
| Roulette Wheel Selection      | ![](../img/genetic-algorithms-book-report_image_2.png) |
| Stochastic Universal Sampling | ![](../img/genetic-algorithms-book-report_image_3.png) |
| Rank Based                    | ![](../img/genetic-algorithms-book-report_image_4.png) |
| Tournament Selection          | ![](../img/genetic-algorithms-book-report_image_5.png) |

![](../img/genetic-algorithms-book-report_image_6.png)

### Cross Over Methods
#### Single Point Crossover

![](../img/genetic-algorithms-book-report_image_7.png)

#### Cross Over Method

![](../img/genetic-algorithms-book-report_image_8.png)

#### Uniform Crossover

![](../img/genetic-algorithms-book-report_image_9.png)

### Ordered Cross Over

![](../img/genetic-algorithms-book-report_image_10.png)

### Mutation Methods

| Method                 | Picture                                                 | Description                                                              |
| ---------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------ |
| Flip Bit Mutation      | ![](../img/genetic-algorithms-book-report_image_11.png) |                                                                          |
| Swap Mutation          | ![](../img/genetic-algorithms-book-report_image_12.png) | For non binary/integer based chromosomes, randomly selected gets swapped |
| Inversion mutation     | ![](../img/genetic-algorithms-book-report_image_13.png) | Sequences are reversed                                                   |
| Real Coded Algoritmics | ![](../img/genetic-algorithms-book-report_image_14.png) |                                                                          |
| Blend Crossover        | ![](../img/genetic-algorithms-book-report_image_15.png) |                                                                          |
![](../img/genetic-algorithms-book-report_image_16.png)


## 3. Using the DEAP Framework


![](../img/genetic-algorithms-book-report_image_17.png)


**Code**

#### 3.1 DEAP Framework Long

Shows the long strategy using loops, and more in depth exploration of a solution
#### 3.2 DEAP Framework Short

- Literally just defines:
	- The fitness Sterategies

![](../img/genetic-algorithms-book-report_image_18.png)

## 4. Combinatorial Operations

![](../img/genetic-algorithms-book-report_image_19.png)


### 4.1 Permutations

![](../img/genetic-algorithms-book-report_image_20.png)

![alt text](../img/genetic-algorithms-book-report_image_21.png)

![](../img/genetic-algorithms-book-report_image_22.png)

![](../img/genetic-algorithms-book-report_image_23.png)


![](../img/genetic-algorithms-book-report_image_24.png)

#### The Rosetta Knapsack Problem

![](../img/genetic-algorithms-book-report_image_25.png)




![](../img/genetic-algorithms-book-report_image_26.png)


#### The Traveling Salesman



![](../img/genetic-algorithms-book-report_image_27.png)


#### The vehicle routing problem


Imagine that you now manage a larger fulfillment center. You still need to deliver packages to a list of customers, but now you have a fleet of several vehicles at your disposal. What is the best way to deliver the packages to the customers using these vehicles?


