% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/application_visualization.R
\name{infer_supporting_datasources}
\alias{infer_supporting_datasources}
\title{Get the data sources that support the specific interactions in the extracted ligand-target signaling subnetwork}
\usage{
infer_supporting_datasources(signaling_graph_list,lr_network, sig_network, gr_network)
}
\arguments{
\item{signaling_graph_list}{A list of two elements: sig: a data frame/ tibble containg weighted ligand-receptor and signaling interactions (from, to, weight); and gr: a data frame/tibble containng weighted gene regulatory interactions (from, to, weight)}

\item{lr_network}{A data frame / tibble containing ligand-receptor interactions (required columns: from, to, source)}

\item{sig_network}{A data frame / tibble containing signaling interactions (required columns: from, to, source)}

\item{gr_network}{A data frame / tibble containing gene regulatory interactions (required columns: from, to, source)}
}
\value{
A tibble with columns from, to, source and layer
}
\description{
\code{infer_supporting_datasources} Get the data sources that support the specific interactions in the extracted ligand-target signaling subnetwork
}
\examples{
\dontrun{
weighted_networks = construct_weighted_networks(lr_network, sig_network, gr_network,source_weights_df)
ligands = list("TNF","BMP2",c("IL4","IL13"))
ligand_tf_matrix = construct_ligand_tf_matrix(weighted_networks, ligands, ltf_cutoff = 0.99, algorithm = "PPR", damping_factor = 0.5,ligands_as_cols = TRUE)
all_ligands = c("BMP2")
all_targets = c("HEY1")
top_n_regulators = 2
ligand_target_signaling_list = get_ligand_signaling_path(ligand_tf_matrix,all_ligands,all_targets,top_n_regulators,weighted_networks)
data_source_info_network = infer_supporting_datasources(ligand_target_signaling_list, lr_network, sig_network, gr_network)
}
}
