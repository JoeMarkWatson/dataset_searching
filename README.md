This repository provides a script enabling R to search multiple labelled datasets for topics of interest

Programming language: R

R packages: haven, dplyr, downloader, tidyr

The script in this repository allows the user to search single or multiple labelled dataframes in R for terms of interest present in the variable names, (head of) variable contents, variable labels and value labels. This script could therefore benefit programmers/researchers seeking to conduct data searching in a manner that accounts for variable structure information. 

To demonstrate application of this search method, the script in this repository first imports publicly available labelled (Stata-format) data from Uwezo (https://www.twaweza.org/go/uwezo-datasets) before manipulating all data into a single dataframe for searching, called xx_clean. The dataframe, xx_clean, is then searched for all terms in a search string, called search_string.

The user can substitute the datasets in dfs_list and dfs_conc for any other datasets (up to 8 in total). Similarly, the terms in search_string can be substituted to all those of interest to the user.

Users should be aware that information in the var_name column of xx_clean features the original variable name prefixed with both the name of the dataset in which it is located and the text string, 'var'.
