##### SEARCH ONE OR MULTIPLE LABELLED DATASETS #####

rm(list=ls())

#packages
library(haven)
library(dplyr)
library(downloader)
library(tidyr)

##### IMPORT DATA IN STATA FORMAT FROM https://www.twaweza.org/go/uwezo-datasets #####

# Kenya 2015 hhld data
url <-"https://www.twaweza.org/uploads/files/KE15_hhld%20(1).zip"
temp <- tempfile()
temp2 <- tempfile()
download.file(url, temp)
unzip(zipfile = temp, exdir = temp2)
Kenya2015 <- haven::read_dta(file.path(temp2, "./KE15_hhld.dta"))
# Tanzania 2015 hhld data
url <-"https://www.twaweza.org/uploads/files/TZ15_hhld%20(1).zip"
temp <- tempfile()
temp2 <- tempfile()
download.file(url, temp)
unzip(zipfile = temp, exdir = temp2)
Tanzania2015 <- haven::read_dta(file.path(temp2, "./TZ15_hhld.dta"))
# Uganda 2015 hhld data
url <-"https://www.twaweza.org/uploads/files/UG15_hhld(1).zip"
temp <- tempfile()
temp2 <- tempfile()
download.file(url, temp)
unzip(zipfile = temp, exdir = temp2)
Uganda2015 <- haven::read_dta(file.path(temp2, "./UG15_hhld.dta"))
rm(temp, temp2, url) #clear temp val.s/files
#list and concatenate imported data 
dfs_list<-list(Kenya2015=Kenya2015,Tanzania2015=Tanzania2015,Uganda2015=Uganda2015) #up to 8 datasets can be listed for searching, with expansion requiring revision of the script below
dfs_conc<-c(Kenya2015,Tanzania2015,Uganda2015)

#check that dfs_conc can be examined using str 
str(dfs_conc[1:2]) 
#check if there is any non-unique var labelling in any individ df
dfs_no<-length(dfs_list)
for (p in dfs_list) {
  check_result<-head(p) 
}
# if there was non-unique var labelling, the above for loop will produce an error 
rm(check_result, p) #clear temp val.s/df.s

#prefixing the colnames of df.s so that search script ultimately applied will show which df results come from
prefixes_list<-c((names(dfs_list)))
dfs_list_b <- vector(mode = "list", length = 0) #creating a list of 0 to use in for loop
for (p in prefixes_list) {
  for (i in dfs_list) {
    colnames(i)<-paste(p,colnames(i),sep="_var_")
    dfs_list_b<-list(dfs_list_b,i)
  } #this is matrix.ing, but with the order meaning that colnames come out correctly in some locations (with no grep.ing required just the following if loop to select the right locations)
} 
if (dfs_no==1) {
  trial_list<-list(dfs_list_b[[2]])  
  trial_list_c<-c(dfs_list_b[[2]])
} else if (dfs_no==2) {
  trial_list<-list(dfs_list_b[[2]],dfs_list_b[[1]][[1]][[1]][[2]])  
  trial_list_c<-c(dfs_list_b[[2]],dfs_list_b[[1]][[1]][[1]][[2]])
} else if (dfs_no==3) {
  trial_list<-list(dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]],dfs_list_b[[1]][[1]][[1]][[1]][[2]],dfs_list_b[[2]]) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
  trial_list_c<-c(dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]],dfs_list_b[[1]][[1]][[1]][[1]][[2]],dfs_list_b[[2]]) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
} else if (dfs_no==4) {
  a<- dfs_list_b[[2]] #last
  b<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[2]] #2nd last
  c<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #3rd last
  d<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #4th last
  trial_list<-list(a,b,c,d) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
  trial_list_c<-c(a,b,c,d)
} else if (dfs_no==5) {
  a<- dfs_list_b[[2]] #last
  b<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[2]] #2nd last
  c<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #3rd last
  d<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #4th last
  e<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #5th last
  trial_list<-list(a,b,c,d,e) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
  trial_list_c<-c(a,b,c,d,e)
} else if (dfs_no==6) {
  a<- dfs_list_b[[2]] #last
  b<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #2nd last
  c<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #3rd last
  d<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #4th last
  e<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #5th last 
  f<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #6th last
  trial_list<-list(a,b,c,d,e,f) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
  trial_list_c<-c(a,b,c,d,e,f) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
} else if (dfs_no==7) {
  a<-dfs_list_b[[2]] #last
  b<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #2nd last
  c<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #3rd last
  d<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #4th last
  e<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #5th last 
  f<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #6th last
  g<- dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #7th last
  trial_list<-list(a,b,c,d,e,f,g) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
  trial_list_c<-c(a,b,c,d,e,f,g) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
} else if (dfs_no==8) {
  a<-dfs_list_b[[2]] #last
  b<-dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #2nd last
  c<-dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #3rd last
  d<-dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #4th last
  e<-dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #5th last
  f<-dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]]#6th last
  g<-dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #7th last
  h<-dfs_list_b[[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[1]][[2]] #8th last
  trial_list<-list(a,b,c,d,e,f,g,h) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
  trial_list_c<-c(a,b,c,d,e,f,g,h) #this puts the output in a workable format, noting that this form of col renaming is pointless at present
} else {print("error")}
#total ncol in all selected trial_list df.s (which is same as total ncol of all listed df.s)
temp_table<-c()
for (j in trial_list) {
  result<-ncol(j)
  temp_table<-rbind(temp_table,result)
} #this is giving you the nrow of all df.s in trial_list (which is dfs_list just with colname prefixes)
ncol_vector<-1:sum(temp_table) #ncol_vector is the number of cols in each df in the list added together

##### CREATING INITIAL VERSION OF DF FOR SEARCHING, x #####

result<-NULL #removing the result from the prev for loop to start fresh for this one
t<-c() 
for (p in ncol_vector)
{result<-capture.output(str(trial_list_c[p]))
t<-rbind(t,c(result[1],result[2],result[3],result[4],result[5],result[6],result[7]))
}
x<-as.data.frame(t) 
x$V1<-NULL
x$V4<-NULL
colnames(x) <- c("var_name", "var_label", "val_label_type", "val_labels", "val_labels_2")

##### STRING MANIP TO IMPROVE DF FOR SEARCHING, xx_clean #####

xx_clean<-x
xx_clean<-separate(xx_clean, var_name, into = c("var_name", "var_contents"), sep = ":", remove = TRUE,
                   convert = FALSE, extra = "merge", fill = "warn")
#remove ' $ ' from the start of var_name string (whilst keeping the _ imbetween words) - removing the $ symbol can be achieved by splitting and dropping
xx_clean<-separate(xx_clean, var_name, into = c("blank_name", "dollar", "var_name"), sep = " ", n=3, remove = TRUE,
                   convert = FALSE, extra = "warn", fill = "warn")
xx_clean$blank_name<-NULL
xx_clean$dollar<-NULL
#cleaning of string info in remaining var.s 
xx_clean$var_label <- sapply(strsplit(as.character(xx_clean$var_label), '= '), '[', 2)
xx_clean$val_label_type <- sapply(strsplit(as.character(xx_clean$val_label_type), '= '), '[', 2)
xx_clean$val_labels <- sapply(strsplit(as.character(xx_clean$val_labels), '= '), '[', 2)
xx_clean$val_labels_2 <- sapply(strsplit(as.character(xx_clean$val_labels_2), '= '), '[', 2)
#removing temp val.s/data
rm(i,j,t,temp_table,trial_list,trial_list_c,x,ncol_vector,p,prefixes_list,result,dfs_list_b)

####### SEARCHING #######

cols<-ncol(xx_clean) #start of creation of loop within a loop, to hunt for all terms rel to a partic topic
search_vector <- c(1:cols) #searching through all columns (inc col 2 which holds 10 values for each variable)

#searching all datasets for string information relevant to technology
search_string <- c("TV","television","radio", "mobile", "phone", "computer", "laptop", "tablet", "ipad") #all strings of relevance to given topic 
tabley<-c()
for (p in search_vector) {
  for (r in search_string) {
    result<-grep(r, xx_clean[,p], ignore.case = T)
    tabley<-rbind(tabley,c(result[1:30]))
  }
} #this loop can give up to 30 results per search term per column (with giving too many results likely not helpful) 
d<-unique(c(tabley[,1:30])) #retain uniques only
d<-d[!is.na(d)] #get rid of na
d<-d[order(d)] #then sort
#print out info, or say no info
if(length(d)>0) {
  View(xx_clean[d,])
} else {
  print("no relevant information found")
}


