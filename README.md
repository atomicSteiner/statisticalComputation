# Statistical Modelling and Computation

Assignments for **T-750-SMAC Statistical Modelling and Computation** at Reykjavik University (Fall 2025), completed during my double-degree MSc in Computer Science.

The three assignments apply statistical and computational methods to real datasets: regression and dimensionality reduction on global health data, network analysis of the *Game of Thrones* character network, and time-series forecasting of Google search trends.

## Contents

| Assignment | Topic | Dataset | Methods |
|---|---|---|---|
| [1](statistical%20computation/assignment1/) | Regression, ANOVA, dimensionality reduction | WHO Life Expectancy | OLS, one-way ANOVA, Tukey HSD, PCA, MDS, t-SNE |
| [2](statistical%20computation/assignment2/) | Network analysis | *Game of Thrones* co-occurrence networks (5 books) | Density, centrality measures, community detection |
| [3](statistical%20computation/assignment3/) | Time-series forecasting | Monthly Google searches for "Reykjavik" (from 2004) | Decomposition, stationarity tests, structural breaks, forecasting models, cross-validation |

## Assignment 1: Life expectancy

**Regression and ANOVA** (`ex2.ipynb`)
- Multiple linear regression (OLS) of life expectancy on health, economic and social indicators, comparing a full model with country and status dummies against a reduced model without them
- One-way ANOVA on five countries from different continents to test whether life expectancy differs between them, followed by a Tukey HSD post-hoc test

**Dimensionality reduction** (`Week1_Assignment_Part3_Buzzo.ipynb`)
- Data for a single year, standardized, projected to two dimensions with PCA, metric and non-metric MDS, and t-SNE
- Plots colored by development status and by continent (derived with `pycountry_convert`)
- The two principal components explain about 32% and 15% of the variance. Developed and developing countries separate clearly in all three methods, and African countries form a distinct group.
- Analysis of how t-SNE's perplexity and learning rate change the result, and a final comparison of the three methods

## Assignment 2: Game of Thrones networks

`Week2_Assignment_Damiano_buzzo.ipynb` builds one weighted undirected network per book from the character co-occurrence data (`book1.csv` to `book5.csv`).

- **Descriptive analysis:** size, density and average degree of the five networks. Books 3 and 5 are the largest, while Book 1 is the most densely connected.
- **Centrality:** degree, betweenness, closeness, eigenvector and PageRank centrality to find the most influential character in each book, and how four selected characters evolve across the series
- **Community detection:** Girvan–Newman (greedy modularity), Louvain and label propagation on Book 1, also on its 3-core, compared through modularity and normalized mutual information. Louvain reaches the highest modularity.

## Assignment 3: Forecasting Google search trends

`BuzzoTimeSeries_Assignment.ipynb` analyses monthly Google search interest for Reykjavik.

- **Exploration:** additive and multiplicative decomposition (the series turns out to be multiplicative), ADF stationarity test, first and seasonal differencing, ACF and PACF
- **Structural breaks:** detected in R with `strucchange` (bonus task)
- **Preprocessing:** detrending, deseasonalizing and rolling-mean smoothing
- **Forecasting:** seasonal naive, moving average and Auto-ARIMA (seasonal, m = 12), compared on 70/30, 80/20 and 90/10 train-test splits using MSE
- **Time-series cross-validation:** with `TimeSeriesSplit`, Auto-ARIMA is clearly the most reliable model

| Model | Average MSE (3-fold time-series CV) |
|---|---|
| Auto-ARIMA | **260.33** |
| Seasonal naive | 772.46 |
| Moving average | 815.57 |

## Course materials

Some files are lecture materials provided by the course, kept here as reference:

- `assignment2/Week 2 Network Data.ipynb`: network analysis lecture notebook
- `assignment3/TimeSeriesNotebook.ipynb`: time-series lecture notebook
- `assignment3/StructuralBreaks.R`: structural-break example in R

## Running the notebooks

The notebooks use Python 3 and read their datasets from the same folder, so open each one from inside its assignment directory. Main dependencies:

```bash
pip install pandas numpy matplotlib seaborn scikit-learn statsmodels networkx pmdarima xgboost pycountry-convert jupyter
```

The structural-break analysis requires R with the `strucchange`, `forecast`, `tseries`, `xts` and `CPAT` packages.

## Author

Damiano Buzzo, MSc in Computer Science, University of Camerino and Reykjavik University
