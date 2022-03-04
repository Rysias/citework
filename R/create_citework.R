# Functions for creating network objects from edgelists found in get_references

calc_nodesize_ <-
  function(network,
           size_func = igraph::page_rank,
           min_size = 1) {
    raw_size <- size_func(network)$vector
    scale_fact <- min_size / min(raw_size)

    raw_size * scale_fact
  }

edges_to_citework <-
  function(edge_df, size_func = igraph::page_rank) {
    network_igraph <- igraph::graph_from_data_frame(edge_df)
    d3_graph <-
      networkD3::igraph_to_networkD3(network_igraph, group = rep(1, 13))
    d3_graph$nodes <- d3_graph$nodes %>%
      mutate(size = calc_nodesize_(network_igraph, size_func = size_func))

    networkD3::forceNetwork(
      d3_graph$links,
      d3_graph$nodes,
      NodeID = "name",
      Group = "group",
      Nodesize = "size"
    )
  }
