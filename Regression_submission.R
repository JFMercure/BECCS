
### load rewuired packages
library(lme4)
library(ggplot2)
library(readxl)
library(dplyr)
library(MuMIn)


###################################
# A. data preparation
###################################

# load IPCC AR5 dataset
BECCSData <- read_xlsx("BECCSTable_Submission.xlsx")

# transform variables to factors
BECCSData$MODEL <- as.factor(BECCSData$MODEL) # controls for different models

# exclude models with cumulative CO2 > 1300Gt
BECCSData2 <- subset(BECCSData,BECCSData$Below1300Gt==1)

# scaling of variables
BECCSData2$CO2cum <- BECCSData2$CumEmissions20102050/100 # cumulative CO2 emissions 2010-2050
BECCSData2$BECCScum <- BECCSData2$CumBiomassWCCS20502100 # cumulative BECCS use 2050-2100


###################################
# B. create and analyse regression models
###################################

# 1. mixed effects model (random effect on intercept and slope, per model)
M1<-lmer(BECCScum~CO2cum+(1+CO2cum|MODEL),data=BECCSData2)

summary(M1)
r.squaredGLMM(M1)

# 2. mixed effects model (random effect on intercept only, per model)
M1b<-lmer(BECCScum~CO2cum+(1|MODEL),data=BECCSData2)

summary(M1b)
r.squaredGLMM(M1b)

# 3. simple linear model
M1c<-lm(BECCScum~CO2cum,data=BECCSData2)

summary(M1c)


###################################
# C. plot of data and regression results (reproduces figure 1A)
###################################

# extraxt parameter estimates
fixParam<-fixef(M1)
ranParam<-ranef(M1)$MODEL
params<-cbind(ranParam[1]+fixParam[1],ranParam[2]+fixParam[2])
confPara <- confint(M1)

# colour codes
model_colours <- c("BET" = rgb(1,0,0),
                   "GCAM" = rgb(1,0,1),
                   "IMACLIM" = rgb(0,0,1),
                   "IMAGE" = rgb(0,1,1),
                   "MERGE" = rgb(1,1,0),
                   "MESSAGE" = rgb(0,1,0),
                   "POLES" = rgb(0,0,0),
                   "REMIND" = rgb(.5,.5,.5),
                   "TIAM" = rgb(1,.5,0),
                   "WITCH" = rgb(0,.5,1),
                   "GRAPE" = rgb(0,1,.5))

# plot
ggplot(BECCSData2, aes(x=CO2cum, y=BECCScum)) +
  geom_point(aes(fill=MODEL), alpha=0.5,pch = 21, size=3) + # plot observation points, coloured by model type
  theme_bw() + labs(x='CO2 emissions pre-2050', y='BECCS post-2050') +
  geom_abline(intercept=fixParam[1], slope=fixParam[2], # main regression line
              colour='red', size=1.5) +  
  geom_abline(intercept=params[,1], slope=params[,2], group=row.names(params), # per model
              linetype = "dashed") + 
  scale_fill_manual(values = model_colours) + theme(legend.title=element_blank()) +
  theme(legend.position=c(0.1, .7), legend.background = element_rect(fill="transparent")) +
  theme(axis.text=element_text(size=14), legend.text=element_text(size=10),
        axis.title=element_text(size=14))
