
setwd("C:\\Users\\s28ki\\Desktop\\spring 18\\data mining\\project-trial-3")
data <- read.csv('train_x_may06_5pm.csv')

attach(data)

clean_d <- data[,c('accommodates','availability_30','availability_60','availability_90','availability_365','bathrooms','bed_type','bedrooms',
                   'beds', 'cancellation_policy','cleaning_fee','city','extra_people','year_first_review','guests_included','host_has_profile_pic',
                    'host_identity_verified', 'host_is_superhost','host_response_rate','host_response_time','host_total_listings_count',
                  'house_rules', 'instant_bookable', 'is_business_travel_ready','is_location_exact','maximum_nights','minimum_nights',
                  'monthly_price','price','require_guest_phone_verification','require_guest_profile_picture','requires_license','room_type',
                'security_deposit','state','weekly_price','Wifi','parking','Kitchen','Breakfast','ac','Heating',
             'year_first_review','year_host','Reviews','Email','Phone','Facebook','transit_available')]
head(clean_d)

install.packages('glmnet')
library(glmnet)

y_data <- read.csv('airbnb_train_y.csv')
head(y_data)
y_data$high_booking_rate[is.na(y_data$high_booking_rate)] <- 0
table(y_data$high_booking_rate)

#lasso
glmnet_lasso.cv=cv.glmnet(data.matrix(clean_d),y_data$high_booking_rate,alpha=1)
glmnet_lasso.cv
#plot(glmnet_ridge.cv)
coef(glmnet_lasso.cv, s="lambda.min")
best.lambda_lasso=glmnet_lasso.cv$lambda.min
best.lambda_lasso
