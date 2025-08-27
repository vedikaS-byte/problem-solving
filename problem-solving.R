#install.packages("googlesheets4")
library(googlesheets4)

# 1. Tiny Example ---------------------------------------------------------

# Workbook link: tinyurl.com/eds214-tiny-problem

# Is it small enough to see all at once?
# Is it simple enough to solve by hand?
# Does it represent the problem?


# 2. Solve by Hand --------------------------------------------------------

# Answer in the workbook


# 3. Minimum Information --------------------------------------------------

# What is the list of variables you need to solve the problem for _one_ case?
# - sample_date
# - concentration
#- window size: one value
#- focal date: one value
# - maybe year-week column? that would return the week of the year along with the year as "year-week". for example, 

# 4. Solution in a Function -----------------------------------------------

# Write a function that takes the minimum information as parameters

# your_function <- function(param1, param2, param3) {
#   do_stuff <- param1 + param2 + param3
#   return(do_stuff)
# }

moving_avg <- function(focal_date, dates, conc, window_size) {
  #which dates are in the window? subset these dates 
  #dates <- as.Date(dates)
  is_in_window <- (dates > focal_date - (window_size/2)*7)  & # tell me when dates are greater than focal date offset by half of window 
    (dates < focal_date + (window_size/2)*7)

  # find associated concentrations
  window_conc <- conc[is_in_window] # pull out associated concentrations
 
   # calculate mean
 result <- mean(window_conc, na.rm = T)
  return(result)
}

as.Date(tiny_problem$sample_date)
ca_moving_avg_1990_04_05 <- moving_avg(as.Date("2001-12-04"), dates = as.Date(tiny_problem$sample_date), conc = tiny_problem$ca, window_size = 9)

ca_moving_avg_1990_04_05

library(datapasta)

# 5. Verify Your Solution -------------------------------------------------

sheet_url <- "https://docs.google.com/spreadsheets/d/1X-SltNKUaZH0zVWSUkC8sUrrlhPEPAd-6tBmbcihCSw"
# tiny_problem <- googlesheets4::read_sheet(sheet_url, sheet = "Group 8")
tiny_problem <- data.frame(
  stringsAsFactors = FALSE,
                       sample_date = c("2001-07-29","2001-12-04","2002-03-11",
                                       "2002-06-07","2002-07-03",
                                       "2002-07-12","2002-08-04","2002-08-05",
                                       "2002-08-06","2002-08-07"),
                         sample_id = c("Q1","Q1","Q1","Q1","Q1","Q1","Q1",
                                       "Q1","Q1","Q1"),
                                ca = c(0.456,0.278,0.892,0.498,0.273,
                                       0.3757,0.3828,0.583,0.2543,0.324),
                       rolling_avg = c(0.456,0.278,0.892,0.3855,0.382375,
                                       0.3844,0.38396,0.38396,0.38396,0.38396)
                )
one_case_solution <- your_function(...)

# Did it work? If not, what went wrong? Don't debug yet!


# 6. Apply the Function ---------------------------------------------------

# _How_ will you apply your function?

# Write your full solution
# sapply

tiny_problem$moving_avg_fun <- sapply(X = as.Date(tiny_problem$sample_date), 
  moving_avg, dates = as.Date(tiny_problem$sample_date), 
  conc = tiny_problem$ca, window_size = 9)
tiny_problem$moving_avg_fun


tiny_problem

# Did it work? If not, what went wrong? Don't debug yet! 
