
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name RocketTracks_Test -dir "C:/Users/Rob/Projects/RocketTracks_HDL/RocketTracks_Test/planAhead_run_1" -part xc3s200ft256-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Rob/Projects/RocketTracks_HDL/RocketTracks_Test/h_bridge_wrapper.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Rob/Projects/RocketTracks_HDL/RocketTracks_Test} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "h_bridge_wrapper.ucf"
add_files "h_bridge_wrapper.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
