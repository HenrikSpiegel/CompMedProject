rm(list = ls()) #Clear workspace

##
# Download the raw datasources and store in data/raw

dir.create(file.path("data", "raw"), showWarnings = FALSE)


# download datasource:

# CIT set.

# CIT set from course - perhaps we need raw?
CIT_url = "https://www.dropbox.com/s/225icgnw8drqzp2/CIT_data.Rdata?raw=1"
dest_file = "data/raw/01_CIT_data.Rdata"
print(paste("You need to download: ", CIT_url, "and place it in:", dest_file, sep=" "))

# The following apparently corrupts the file.
#download.file(URLencode(CIT_url),
#              destfile=dest_file,
#              method="auto")

load(dest_file)


