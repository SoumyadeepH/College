

    #Assignment 1: Basic operations in Python

    1. Read two integers and print sum, difference, product, and integer division.

    a=int(input("Enter the first integer: "))
    b=int(input("Enter the second integer: "))

    print("Sum: ",a+b)
    print("Difference: ",a-b)
    print("Product: ",a*b)
    if b!=0:
        print("Integer Division: ",a//b)
    else:
        print("Cannot divide with 0")

    Write a function is_even(n) that returns True if n is even, else False.

    def is_even(n):
        return n%2==0
    a=int(input("Enter an integer: "))
    print(is_even(a))

    3. From a list of integers, create a new list with only even numbers.

    arr=list(map(int,input().split()))
    even_list=[x for x in arr if x%2==0]
    print(even_list)

    4. Write a Python program student_marks_analyzer.py that asks the user
    to enter the number of students in a class. Then ask the user to enter the
    marks (0–100) for each student, one by one, and store all the marks so
    that they can be processed later. After all marks are entered, the
    program should display:
    ● The list of all marks entered.
    ● The total of all marks.
    ● The average marks of the class.
    ● The highest and lowest marks in the class.
    ● How many students passed (marks ≥ 40).
    ● How many students failed (marks < 40).
    ● Display the marks in reverse order of entry.
    ● Display only those marks that are even numbers.

    n=int(input("Enter the number of students in class: "))

    marks=[]

    for i in range(n):
        while True:
            m=int(input(f"Enter the marks for student {i+1}"))
            if 0<=m<=100:
                marks.append(m)
                break
            else:
                print("Enter valid marks: ")

    print("List of all marks: ", marks)

    total=sum(marks)
    print("Total of all marks: ", total)

    avg=total/n
    print("Avg. marks of class: ", avg)

    highest=max(marks)
    lowest=min(marks)
    print("Highest marks in the class: ",highest)
    print("Lowest marks in the class: ",lowest)

    passed=len([m for m in marks if m >=40])
    failed=len([m for m in marks if m <40])

    print("No. of students passed: ", passed)
    print("No. of students failed: ", failed)

    print("Marks in reverse order: ", marks[::-1])

    even_marks=[m for m in marks if m%2==0]
    print("Even marks: ",even_marks)

    #Assignment 2

    Task 1: Customer Purchase Decision
    Each customer entering the grocery store may or may not buy at least one item.
    Historical data shows that 30% of customers make a purchase. You observe 1000
    independent
    customers.
    ● Define a random variable representing the outcome of a customer visit
    ● Identify all possible values of the random variable
    ● Decide the appropriate probability model
    ● Simulate the experiment using Python
    ● Compute the mean and variance
    ● Visualize the outcomes

    import numpy as np
    import matplotlib.pyplot as plt

    n_customers=1000
    p_purchase=0.3

    data=np.random.binomial(1,p_purchase,n_customers)

    total_purchase=np.sum(data)
    mean=np.mean(data)
    variance=np.var(data)

    print("Total customer: ",n_customers)
    print("Total purchase: ",total_purchase)
    print("Mean: ",mean)
    print("Variance: ",variance)

    plt.figure()
    plt.hist(data,bins=2,edgecolor='black')
    plt.xlabel("Customer outcomes")
    plt.ylabel("No. of customers")
    plt.title("Customer purchase outcomes")
    plt.show()

    Task 2: Number of Purchasing Customers in a Fixed Group
    During a discount hour, a fixed number of customers enter the store. Exactly 50
    customers enter the store in one hour. Each customer independently decides whether
    to purchase. The probability of purchase remains constant.
    ● Define a random variable representing the number of customers who make
    purchases
    ● Identify the structure of the experiment (fixed trials, success/failure)
    ● Select a suitable probability distribution
    ● Compute and plot the probability mass function (PMF)
    ● Interpret the most likely outcome

    import numpy as np
    import matplotlib.pyplot as plt
    from scipy.stats import binom

    n=50
    p=0.3

    x=np.arange(0, n+1)

    pmf=binom.pmf(x,n,p)

    mean=n*p
    variance=n*p*(1-p)
    mode=int(np.floor((n+1)*p))

    print("mean: ", mean)
    print("variance: ", variance)
    print("mode: ", mode)

    plt.figure()
    plt.bar(x, pmf)
    plt.xlabel("Purchasing Customer")
    plt.ylabel("Probability")
    plt.title("PMF")
    plt.show()

    Task 3: Checkout Demand Over Time
    Customers arrive at checkout counters continuously. The average number of customers checking out per hour is 10 Checkout events occur randomly and independently. Exact arrival times are unpredictable.
    ● Define a random variable representing the number of checkouts in one hour
    ● Identify the characteristics of the arrival process
    ● Select a probability distribution suitable for event counts over time
    ● Compute:
    ○ Probability of exactly 8 checkouts in one hour
    ○ Probability of more than 15 checkouts in one hour
    ● Visualize the distribution and explain how it helps staffing decisions

    import math
    from scipy.stats import poisson
    import matplotlib.pyplot as plt

    lam=10

    def poisson_pmf(k, lam):
        return (math.exp(-lam)*lam**k)/math.factorial(k)

    p_exact_8 = poisson_pmf(8, lam)
    p_more_15 = 1-poisson.cdf(15, lam)

    print("P(X = 8): ", p_exact_8)
    print("P(X > 15): ", p_more_15)

    x=list(range(0, 25))
    y=[poisson_pmf(k, lam) for k in x]

    plt.bar(x, y)
    plt.xlabel("Number of Checkouts")
    plt.ylabel("Probability")
    plt.title("Poisson Distribution (lambda = 10)")
    plt.show()

    Task 4: First Successful Promotion Response
    A store promotion is announced repeatedly to customers until someone responds. Each promotional interaction has a 25% chance of success. Customer responses are independent.
    ● Define a random variable representing the number of interactions until the first
    positive response
    ● Identify whether past interactions affect future outcomes
    ● Choose a suitable probability distribution
    ● Compute the probability that the first success occurs on the 4th interaction
    ● Plot the PMF for the first 10 interactions

    import matplotlib.pyplot as plt

    p=0.25

    def geometric_pmf(k,p):
        return (1-p)**(k-1)*p

    p_k4 = geometric_pmf(4,p)
    print("P(X = 4): ",p_k4)

    x=list(range(1,11))
    y=[geometric_pmf(k,p) for k in x]

    plt.bar(x,y)
    plt.xlabel("Interaction Number")
    plt.ylabel("Probability")
    plt.title("Geometric Distribution (p=0.25)")
    plt.show()

    Task 5: Quality Control – Defective Grocery Items
    At the end of each day, packaged food items are inspected. Each item is either defective or non-defective. The probability of defect is small. A large number of items are handled daily.
    ● Define a suitable random variable for defects
    ● Decide whether to model defects individually or as counts
    ● Select an appropriate probability distribution
    ● Justify whether approximation methods can be applied
    ● Interpret results in terms of quality and waste reduction

    import numpy as np
    import matplotlib.pyplot as plt
    from scipy.stats import poisson

    n=5000
    p=0.001
    lam= n*p

    k=np.arange(0,25)
    pmf=poisson.pmf(k, lam)

    plt.figure()
    plt.stem(k,pmf)
    plt.xlabel("Defective items per day")
    plt.ylabel("Possibility")
    plt.title("Poisson model")
    plt.show()

    #Assignment 2A

    1 Module 1: The Real Estate Data Pipeline
    Goal: Practice NumPy for synthesis, Pandas for cleaning, and Seaborn for correlation analysis.
    1.1 Task
    1.1: Data Synthesis
    Generate a synthetic dataset of 100 houses:
    • Create a 1D NumPy array X (Square Footage) with 100 random integers [800, 5000].
    • Create a target array y (Price) using y = 150X+ε, where ε is Gaussian noise via np.random.normal(0,50000, 100).
    1.2 Task
    1.2: Wrangling & Encoding
    • Convert arrays to a DataFrame. Introduce 5 NaN values in Price and fill them with the
    median.
    • Add a categorical column Location (’Urban’, ’Suburban’, ’Rural’) and apply One-Hot En-
    coding.
    1.3 Task
    1.3: Visualizing Relationships
    • Plot a Seaborn Heatmap of the correlation matrix.
    • Use plt.subplots to show a Histogram of prices and a Scatter Plot of SqF t vs P rice.

    import pandas as pd
    import numpy as np
    import seaborn as sns
    import matplotlib.pyplot as plt

    np.random.seed(42)

    X=np.random.randint(800, 5001, 100)
    epsilon=np.random.normal(0, 50000, 100)
    y=150*X+epsilon

    df=pd.DataFrame({
        "SqFt": X,
        "Price": y
    })

    nan_indices=np.random.choice(df.index, 5, replace=False)
    df.loc[nan_indices, "Price"]=np.nan

    df["Price"].fillna(df["Price"].median(), inplace=True)

    locations = np.random.choice(["Urban", "Suburban", "Rural"], 100)
    df["Location"] = locations

    df=pd.get_dummies(df,columns=["Location"])
    corr=df.corr()

    plt.figure(figsize=(8,6))
    sns.heatmap(corr, annot=True, cmap="coolwarm")
    plt.title("Correlation Heatmap")

    fig, axes=plt.subplots(1,2,figsize=(12,5))

    axes[0].hist(df["Price"], edgecolor='black')
    axes[0].set_title("Price Distribution")

    axes[1].scatter(df["SqFt"], df["Price"])
    axes[1].set_title("SqFt vs Price")

    plt.tight_layout()
    plt.show()

    2 Module 2: Probability & Store Analytics
    Goal: Implement discrete probability distributions using scipy.stats.
    2.1 Task
    2.1: Bernoulli Trials
    30% of 1,000 customers make a purchase.
    • Simulate 1,000 trials. Compute empirical mean ( ̄x) and variance (s2).
    • Compare these to the theoretical values μ = p and σ2 = p(1 − p).
    2.2 Task
    2.2: Binomial Distribution
    Exactly 50 customers enter during a discount hour (p = 0.3).
    • Plot the Probability Mass Function (PMF) for all possible outcomes (0–50).
    • Identify the most likely number of customers to make a purchase.
    2.3 Task
    2.3: Poisson Process
    Average checkout rate is λ = 10 per hour.
    • Calculate P(X = 8) and P(X > 15).
    • Visualize the distribution. Explain how this helps in staffing decisions.
    2.4 Task
    2.4: Geometric Waiting Times
    A promotion has a 25% success rate.
    • Calculate the probability the first success occurs on the 4th interaction.
    • Plot the PMF for the first 10 interactions.
    2.5 Task
    2.5: Quality Control (Poisson Approximation)
    In a batch of 5,000 items with a very small defect rate (p = 0.001):
    • Justify the use of Poisson as an approximation for Binomial in this context.
    • Compute the probability of finding more than 10 defects.

    import numpy as np
    import matplotlib.pyplot as plt
    from scipy.stats import bernoulli, binom, poisson, geom

    np.random.seed(42)

    p=0.3
    trials=bernoulli.rvs(p, size=100)

    emp_mean = np.mean(trials)
    emp_var = np.var(trials)

    theo_mean=p
    theo_var=p*(1-p)

    print("Empirical Mean: ", emp_mean)
    print("Empirical Variance: ", emp_var)
    print("Theoretical Mean: ", theo_mean)
    print("Theoretical Variance: ", theo_var)

    n=50
    x=np.arange(0, n+1)
    pmf_binom = binom.pmf(x, n, p)

    plt.figure()
    plt.bar(x, pmf_binom)
    plt.title("Binomial PMF (n=50, p=0.03)")
    plt.xlabel("Number of Purchases")
    plt.ylabel("Probability)")

    most_likely = x[np.argmax(pmf_binom)]
    print("Most Likely Purchase: ", most_likely)

    lam=10
    p_x8=poisson.pmf(8, lam)
    p_gt15=1-poisson.cdf(15, lam)

    print("P(X = 8): ",p_x8)
    print("P(X > 15): ",p_gt15)

    x_pois = np.arange(0,25)
    pmf_pois = poisson.pmf(x_pois,lam)

    plt.figure()
    plt.bar(x_pois, pmf_pois)
    plt.title("Poisson PMF (Lambda = 10)")
    plt.xlabel("Checkouts")
    plt.ylabel("Probability")

    p_geom = 0.25
    p_k4 = geom.pmf(4, p_geom)
    print("P(X = 4): ", p_k4)

    x_geom = np.arange(1,11)
    pmf_geom = geom.pmf(x_geom, p_geom)

    plt.figure()
    plt.bar(x_geom, pmf_geom)
    plt.title("Geometric PMF (p=0.25)")
    plt.xlabel("Trial")
    plt.ylabel("Probability")

    n_large = 5000
    p_small = 0.001
    lam_approx = n_large*p_small

    p_more_10 = 1 - poisson.cdf(10, lam_approx)
    print("P(X > 10) using Poisson Approx: ", p_more_10)

    plt.show()

    #Assignment 3

    Find the Principal Components. How many components would you use for any analysis or reconstruction?

    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt
    from sklearn.preprocessing import StandardScaler
    from sklearn.decomposition import PCA


    df = pd.read_csv("wine.data", header=None)


    X = df.iloc[:, 1:]


    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)


    pca = PCA()
    X_pca = pca.fit_transform(X_scaled)

    explained_variance = pca.explained_variance_ratio_
    cumulative_variance = np.cumsum(explained_variance)

    print("Explained Variance Ratio:\n", explained_variance)
    print("Cumulative Variance:\n", cumulative_variance)

    plt.plot(range(1, len(cumulative_variance)+1), cumulative_variance, marker='o')
    plt.xlabel("Number of Components")
    plt.ylabel("Cumulative Explained Variance")
    plt.title("PCA Analysis")
    plt.grid()
    plt.show()

    n_components = np.argmax(cumulative_variance >= 0.95) + 1
    print("Optimal Number of Components:", n_components)

    pca_final = PCA(n_components=n_components)
    X_reduced = pca_final.fit_transform(X_scaled)

    print("Reduced Data Shape:", X_reduced.shape)

    #Assignment 4
