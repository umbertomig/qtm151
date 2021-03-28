gss_cat %>%
  count(partyid) %>%
  ggplot(aes(x=n, 
           y = fct_reorder(partyid, n) %>% 
             fct_relevel("No answer", after=0) %>%
             fct_relevel("Independent", after=1))) + 
  geom_point()

gss_cat %>%
  mutate(marital = fct_infreq(marital) %>% 
           fct_rev()) %>%
  ggplot(aes(marital)) +
  geom_bar()

gss %>% 
  drop_na(health) %>%
  mutate(health2 = fct_recode(health, 
                              "Other" = "DK", 
                              "Excellent" = "EXCELLENT", 
                              "Not that ok" = "FAIR", 
                              "Good" = "GOOD", 
                              "No idea" = "IAP", 
                              "Not good at all" = "POOR")) %>%
  count(health2)

gss_cat %>%
  mutate(partyidnew = fct_collapse(partyid,
                                   Other = c("No answer", "Don't know", "Other party"),
                                   Republican = c("Strong republican", "Not str republican"),
                                   Independent = c("Ind,near rep", "Independent", "Ind,near dem"),
                                   Democrat = c("Not str democrat", "Strong democrat")
  )) %>%
  count(partyidnew)

gss %>%
  mutate(wrkstatnew = fct_collapse(wrkstat,
                                   Working = c("KEEPING HOUSE", "WORKING FULLTIME", "WORKING PARTTIME"),
                                   `Not Working` = c("TEMP NOT WORKING", "UNEMPL LAID OFF"),
                                   Studying = c("SCHOOL"),
                                   Other = c("OTHER", "RETIRED")
  )) %>%
  count(wrkstatnew)
