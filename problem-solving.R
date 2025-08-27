# install.packages("googlesheets4")


# 1. Tiny Example ---------------------------------------------------------

# Workbook link: tinyurl.com/eds214-tiny-problem

# Is it small enough to see all at once?
# Is it simple enough to solve by hand?
# Does it represent the problem?


# 2. Solve by Hand --------------------------------------------------------

# Answer in the workbook


# 3. Minimum Information --------------------------------------------------

# What is the list of variables you need to solve the problem for _one_ case?


# 4. Solution in a Function -----------------------------------------------

# Write a function that takes the minimum information as parameters

your_function <- function(param1, param2, param3) {
  do_stuff <- param1 + param2 + param3
  return(do_stuff)
}


# 5. Verify Your Solution -------------------------------------------------

sheet_url <- "https://docs.google.com/spreadsheets/d/1X-SltNKUaZH0zVWSUkC8sUrrlhPEPAd-6tBmbcihCSw"
tiny_problem <- googlesheets4::read_sheet(sheet_url, sheet = "Example")

one_case_solution <- your_function(...)

# Did it work? If not, what went wrong? Don't debug yet!


# 6. Apply the Function ---------------------------------------------------

# _How_ will you apply your function?

# Write your full solution

# Did it work? If not, what went wrong? Don't debug yet! 
