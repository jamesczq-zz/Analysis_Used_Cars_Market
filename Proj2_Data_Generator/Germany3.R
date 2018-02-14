library('tidyverse')

df = read_csv('cars2nd.csv');
df$Years = 2018 - df$Year;

df_de3 = df %>%
  filter(., Make %in% c('Audi', 'BMW', 'Mercedes-Benz'))%>%
  filter(., Model %in% c('A4', '3', 'C-Class')) %>% 
  filter(., Mileage <= 80000 );

df_de3$Price_to_Mileage = df_de3$Price / df_de3$Mileage

#-----------------------------------------------------
# Price density Audi, BMW, M-Benz
#-----------------------------------------------------
g_Germany3 = 
  ggplot(data = df_de3, aes(x = Price)) + 
  stat_density(aes(color = Make_Model), geom="line",position="identity")
g_Germany3
ggsave('germany3_price.pdf');

#-----------------------------------------------------
# Mileage density Audi, BMW, M-Benz
#-----------------------------------------------------
g_Germany3 = 
  ggplot(data = df_de3, aes(x = Mileage)) + 
  stat_density(aes(color = Make_Model), geom="line",position="identity")
g_Germany3
ggsave('germany3_mileage.pdf');

#-----------------------------------------------------
# Price/Mileage density Audi, BMW, M-Benz
#-----------------------------------------------------

g_Germany3 = 
  ggplot(data = df_de3, aes(x = Price_to_Mileage)) + 
  stat_density(aes(color = Make_Model), geom="line",position="identity")
g_Germany3
ggsave('germany3_p2mi.pdf');


#-----------------------------------------------------
# z_Price/Mileage density Audi, BMW, M-Benz
#-----------------------------------------------------
df_de3_stat = df_de3%>% 
  group_by(., Make) %>%
  summarise(., mu_P2Mi = mean(Price_to_Mileage), std_P2Mi = sd(Price_to_Mileage))

df_de3 = merge(df_de3, df_de3_stat)

df_de3$z_P2Mi = (df_de3$Price_to_Mileage - df_de3$mu_P2Mi) / df_de3$std_P2Mi

g_Germany3 = 
  ggplot(data = df_de3, aes(x = z_P2Mi)) + 
  stat_density(aes(color = Make_Model), geom="line",position="identity")
g_Germany3
ggsave('germany3_p2mi_z.pdf');
  
  








