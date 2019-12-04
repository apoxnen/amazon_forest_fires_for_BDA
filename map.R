
library(geobr)
library(ggplot2)
library(sf)
library(dplyr)
library(rio)

state <- read_state(code_state="all", year=2018) 
no_axis <- theme(axis.title=element_blank(),
                 axis.text=element_blank(),
                 axis.ticks=element_blank())

# Plot all Brazilian states
ggplot() + 
  geom_sf(data=state, fill="#2D3E50", color="#FEBF57", size=.15, show.legend = FALSE) + 
  labs(subtitle="States", size=8) + 
  theme_minimal() +
  no_axis

means=as.data.frame(colMeans(dataset))
colnames(means)="means"
data2=data.frame("values"=c(means$means,0,0,0,0), "name_state"= c("Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará","Distrito Federal", "Espírito Santo",
                            "Goiás", "Maranhão", "Mato Grosso", "Minas Gerais",  "Pará", "Paraíba", "Pernambuco" , "Piauí" , 
                            "Rio De Janeiro",
                            "Rondônia", "Roraima" ,"Santa Catarina", "São Paulo", "Sergipe", "Tocantins",
                            "Rio Grande Do Norte", "Paraná", "Rio Grande Do Sul", "Mato Grosso Do Sul") )

data=merge(state,data2, by="name_state")

ggplot() + 
  geom_sf(data=data, aes(fill=values), color= NA, size=.15) + 
  labs(subtitle="Mean number of forest fires in Brazil, 1998-2017", size=8) + 
  scale_fill_distiller(palette = "Reds", name="Number of forest fires", direction=1, limits = c(0,50000)) +
  theme_minimal() +
  no_axis

