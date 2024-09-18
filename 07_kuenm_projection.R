#Running kuenm and projecting to other time periods
#code based on https://youtu.be/dn4-G_-MXu8 and kuenm_start(file.name = tempfile())

library(kuenm)
library(readr)

####note current calibration area buffer is 1500km

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")

#getting training and testing data
occs = read_csv(file="glyp_rancholabrean_rotated_spatial_filter_moved.csv", col_names=TRUE)
occs['Species']='Glyptotherium' 
train_prop <- 0.8
method = "random"
name = "pts"
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")

data_split <- kuenm_occsplit(occ = occs, train.proportion = train_prop, save = TRUE,
                             method = method, name = name)

#making environmental layer combinations
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
help(kuenm_varcomb)

var_dir <- "variables" # your directory with variables to be combined
out_dir <- "variables_comb" # output directory to be created
min_n <- 2
in_format <- "ascii"
out_format <- "ascii"

comb <- kuenm_varcomb(var.dir = var_dir, out.dir = out_dir, min.number = min_n,
                      in.format = in_format, out.format = out_format)

#getting candidate models
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
help(kuenm_cal)

occ_joint <- "pts_joint.csv"
occ_tra <- "pts_train.csv"
M_var_dir <- "variables_comb"
batch_cal <- "candidate_models"
out_dir <- "candidate_models"
reg_mult <- c(seq(0.1, 1, 0.1), 2:5)
f_clas <- "all"
args = c("maximumbackground=1000 writebackgroundpredictions=TRUE") #using 1000 background points
maxent_path <- "C:/Users/Kat/Desktop/ENM_Fourth_Try"
wait <- FALSE
run <- TRUE

kuenm_cal(occ.joint = occ_joint, occ.tra = occ_tra, M.var.dir = M_var_dir, 
          batch = batch_cal, out.dir = out_dir, reg.mult = reg_mult, 
          f.clas = f_clas, args = args, maxent.path = maxent_path, 
          wait = wait, run = run)

#evaluating the models
help(kuenm_ceval)

occ_test <- "pts_test.csv"
out_eval <- "calibration_results"
threshold <- 5
rand_percent <- 50
iterations <- 500
kept <- TRUE
selection <- "OR_AICc"
paral_proc <- FALSE # make this true to perform pROC calculations in parallel

cal_eval <- kuenm_ceval(path = out_dir, occ.joint = occ_joint, occ.tra = occ_tra, 
                        occ.test = occ_test, batch = batch_cal, out.eval = out_eval, 
                        threshold = threshold, rand.percent = rand_percent, 
                        iterations = iterations, kept = kept, selection = selection, parallel.proc = paral_proc)

#final model creation
help(kuenm_mod)
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")

batch_fin <- "final_models"
mod_dir <- "final_models"
rep_n <- 5
rep_type <- "Crossvalidate"
jackknife <- TRUE
out_format <- "cloglog"
project <- TRUE
G_var_dir <- "projection"
ext_type <- "all"
write_mess <- TRUE
write_clamp <- TRUE
wait1 <- FALSE
run1 <- TRUE
args = c("maximumbackground=1000 writebackgroundpredictions=TRUE") #using 1000 background points

kuenm_mod(occ.joint = occ_joint, M.var.dir = M_var_dir, out.eval = out_eval, 
          batch = batch_fin, rep.n = rep_n, rep.type = rep_type, 
          jackknife = jackknife, out.dir = mod_dir, out.format = out_format, 
          project = project, G.var.dir = G_var_dir, ext.type = ext_type,
          write.mess = write_mess, write.clamp = write_clamp, 
          maxent.path = maxent_path, args = args, wait = wait1, run = run1)

# Final model evaluation
help(kuenm_feval)

occ_ind <- "pts_external.csv"
replicates <- TRUE
out_feval <- "final_models_evaluation"

fin_eval <- kuenm_feval(path = mod_dir, occ.joint = occ_joint, occ.ind = occ_ind, 
                        replicates = replicates, out.eval = out_feval, 
                        threshold = threshold, rand.percent = rand_percent,
                        iterations = iterations)