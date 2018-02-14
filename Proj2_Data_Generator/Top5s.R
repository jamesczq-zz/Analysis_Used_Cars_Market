library('tidyverse')

df = read_csv('cars2nd.csv')
df$Years = 2018 - df$Year

head(df)

print('*****************************************')
print('Top 5 Makes Overall')
print('*****************************************')
df %>% 
  group_by(., Make) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))

cat('\014')
print('*****************************************')
print('Top 5 US Makes')
print('*****************************************')
df %>% 
  filter(., Country %in% c('USA')) %>%
  group_by(., Make) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))

cat('\014')
print('*****************************************')
print('Top 5 Non-US Makes')
print('*****************************************')
df %>% 
  filter(., ! (Country %in% c('USA'))) %>%
  group_by(., Make) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))



cat('\014')
print('*****************************************')
print('Top 5 Models Overall')
print('*****************************************')
df %>% 
  group_by(., Make_Model) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))



cat('\014')
print('*****************************************')
print('Top 5 US Models')
print('*****************************************')
df %>% 
  filter(., Country %in% c('USA')) %>%
  group_by(., Make_Model) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))


cat('\014')
print('*****************************************')
print('Top 5 Non-US Models')
print('*****************************************')
df %>% 
  filter(., ! (Country %in% c('USA'))) %>%
  group_by(., Make_Model) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))



cat('\014')
print('*****************************************')
print('Top 5 Colors')
print('*****************************************')
df %>% 
  group_by(., Color) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))



cat('\014')
print('*****************************************')
print('Top 5 Audi')
print('*****************************************')
df %>% 
  filter(., Make=='Audi') %>%
  group_by(., Model) %>%
  summarise(., N = n()) %>%
  top_n(., 5) %>%
  arrange(., desc(N))





cat('\014')
print('*****************************************')
print('Top 5 US Model Prices')
print('*****************************************')
df %>% 
  filter(., Country %in% c('USA')) %>%
  group_by(., Make_Model) %>%
  summarise(., medPrice = median(Price)) %>%
  top_n(., 5) %>%
  arrange(., desc(medPrice))


cat('\014')
print('*****************************************')
print('Top 5 non US Model Prices')
print('*****************************************')
df %>% 
  filter(., !( Country %in% c('USA')) ) %>%
  group_by(., Make_Model) %>%
  summarise(., medPrice = median(Price)) %>%
  top_n(., 5) %>%
  arrange(., desc(medPrice))




