rm(list = ls())

library(Seurat)
library(MAST)

set.seed(1)

time1 = Sys.time()
print(time1)
### ---------getting original table---------
seurat_obj <- readRDS("./DE/altas_Epithelial_Immune.rds")
seurat_obj <- subset(seurat_obj, subset = cell_type %in% c("alveolar macrophage", "type II pneumocyte"))

# alveolar macrophage  type II pneumocyte 
# 78816               62405 
# [1]  28024 141221

seurat_obj@meta.data$cell_type <- droplevels(seurat_obj@meta.data$cell_type)
Idents(seurat_obj) <- seurat_obj@meta.data$cell_type

degs <- FindMarkers(seurat_obj, ident.1 = "alveolar macrophage", ident.2 = "type II pneumocyte",
                       test.use = "MAST", only.pos = FALSE, min.pct = 0, logfc.threshold = 0)

saveRDS(degs, file = "./DE/result/table_orig_big_MASTtest.rds")

print("finish getting DE table from original method")
time2 = Sys.time()
print(time2 - time1)
