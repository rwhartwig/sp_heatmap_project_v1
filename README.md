# Spectrum Protect tape heatmap project v1
This repo containst the assets to build a container to process data from the Spectrum Protect summary table and build a tape heatmap.

Docker R image


Dockerfile

FROM r-base
WORKDIR /heatmap_data/scripts
COPY sample /heatmap_data/sample
COPY scripts /heatmap_data/scripts
RUN chmod 755 *.pl
RUN Rscript packages.R
CMD ["bash"]

docker build -t heatmapapp .

/heatmap_data/scripts

-rw-r--r-- 1 root root 1702 Nov 27 20:23 heat_map.pl
-rw-r--r-- 1 root root  672 Nov 27 20:23 heatmap.R
-rw-r--r-- 1 root root  884 Nov 27 20:23 mount_5.pl
-rw-r--r-- 1 root root  866 Nov 27 20:23 mount.pl
-rw-r--r-- 1 root root   58 Nov 27 20:23 packages.R




# Create IBM Cloud Account

Click [Here](https://ibm.biz/BdfMKE) to register for your IBM Cloud account. <br>

There are 3 steps to create your account: <br>
1- Put your email and password. <br>
2- You get a verification link with the registered email to verify your account. <br>
3- Fill the personal information fields. <br>

<img width="1188" alt="Screen Shot 2021-05-31 at 11 25 01 AM" src="https://user-images.githubusercontent.com/15332386/120156441-0769d980-c203-11eb-8cb3-29f4a8d5616a.png">

# Assets
- Presentation slides are available in this repo as a pdf file.
- Click [Here](https://developer.ibm.com/tutorials/build-and-compare-models-using-ibm-spss-modeler/?mhsrc=ibmsearch_a&mhq=spss) for the Hands-On part that shows all the steps for this workshop. <br>
- Click [Here](https://ibm.biz/BdfMKX) to fill the survey (We really appreciate any feedback :D) <br>
- Follow Our [Meetup Page](https://www.meetup.com/IBM-Cloud-MEA/) to get updates on our events <br>
- Check [IBM Developer](https://developer.ibm.com/) to learn and explore a variety technologies and services that you're interested in <br>

# Call For Code
- Call for Code [Main Page](ibm.biz/callforcode) <br>
- [FAQs](callforcode.org/faq/) <br> <br>

Starter Kits:<br> 
- [Zero Hunger](https://github.com/Call-for-Code/Solution-Starter-Kit-Hunger-2021#solution-ideas)
- [Clean Water and Sanitation](https://github.com/Call-for-Code/Solution-Starter-Kit-Water-2021#solution-ideas)
- [Responsible production and green consumption](https://github.com/Call-for-Code/Solution-Starter-Kit-Production-2021#more-solution-ideas)
