// (C) 2001-2021 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Altera Signal Tap Agent Wrapper

`timescale 1 ps / 1 ps
module altera_signaltap_agent_wrapper #(
    parameter sld_node_info = "",
    parameter SLD_SECTION_ID = "",
    parameter sld_data_bits = "",
    parameter sld_trigger_bits = "",
    parameter sld_node_crc_bits = "",
    parameter sld_node_crc_hiword = "",
    parameter sld_node_crc_loword = "",
    parameter sld_incremental_routing = "",
    parameter sld_sample_depth = "",
    parameter sld_segment_size = "",
    parameter sld_ram_block_type = "",
    parameter sld_state_bits = "",
    parameter sld_buffer_full_stop = "",
    parameter sld_trigger_level = "",
    parameter sld_trigger_in_enabled = "",
    parameter sld_hps_trigger_in_enabled = "",
    parameter sld_hps_trigger_out_enabled = "",
    parameter sld_hps_event_enabled = "",
    parameter sld_hps_event_id = "",
    parameter sld_advanced_trigger_entity = "",
    parameter sld_trigger_level_pipeline = "",
    parameter sld_enable_advanced_trigger = "",
    parameter sld_advanced_trigger_1 = "",
    parameter sld_advanced_trigger_2 = "",
    parameter sld_advanced_trigger_3 = "",
    parameter sld_advanced_trigger_4 = "",
    parameter sld_advanced_trigger_5 = "",
    parameter sld_advanced_trigger_6 = "",
    parameter sld_advanced_trigger_7 = "",
    parameter sld_advanced_trigger_8 = "",
    parameter sld_advanced_trigger_9 = "",
    parameter sld_advanced_trigger_10 = "",
    parameter sld_inversion_mask_length = "",
    parameter sld_inversion_mask_mod = "",
    parameter sld_power_up_trigger = "",
    parameter sld_state_flow_mgr_entity = "",
    parameter sld_state_flow_use_generated = "",
    parameter sld_current_resource_width = "",
    parameter sld_attribute_mem_mode = "",
    parameter sld_storage_qualifier_bits = "",
    parameter sld_storage_qualifier_gap_record = "",
    parameter sld_storage_qualifier_mode = "",
    parameter sld_storage_qualifier_enable_advanced_condition = "",
    parameter sld_storage_qualifier_inversion_mask_length = "",
    parameter sld_storage_qualifier_advanced_condition_entity = "",
    parameter sld_storage_qualifier_pipeline = "",
    parameter sld_trigger_pipeline = "",
    parameter sld_ram_pipeline = "",
    parameter sld_counter_pipeline = "",
    parameter sld_use_jtag_signal_adapter = "",
    parameter sld_create_monitor_interface = ""
)(
        input  wire       dbg_fab_poweron_reset_release,
        input  wire       raw_tck,
        input  wire [9:0] ir_in,
        output wire [9:0] ir_out,
        output wire       tdo,
        input  wire       tdi,
        input  wire       clr,
        input  wire       usr1,
        input  wire       ena,
        input  wire       jtag_state_cdr,
        input  wire       jtag_state_sdr,
        input  wire       jtag_state_e1dr,
        input  wire       jtag_state_udr,
        input  wire       jtag_state_uir,
        input  wire       jtag_state_tlr,
        input  wire       jtag_state_rti,
        input  wire       jtag_state_sdrs,
        input  wire       jtag_state_pdr,
        input  wire       jtag_state_e2dr,
        input  wire       jtag_state_sirs,
        input  wire       jtag_state_cir,
        input  wire       jtag_state_sir,
        input  wire       jtag_state_e1ir,
        input  wire       jtag_state_pir,
        input  wire       jtag_state_e2ir,
        input  wire       tms,
        input  wire       clrn,
        output wire       irq
);

    sld_signaltap #(
        .sld_node_info                                   (sld_node_info),
        .SLD_SECTION_ID                                  (SLD_SECTION_ID),
        .sld_data_bits                                   (sld_data_bits),
        .sld_trigger_bits                                (sld_trigger_bits),
        .sld_node_crc_bits                               (sld_node_crc_bits),
        .sld_node_crc_hiword                             (sld_node_crc_hiword),
        .sld_node_crc_loword                             (sld_node_crc_loword),
        .sld_incremental_routing                         (sld_incremental_routing),
        .sld_sample_depth                                (sld_sample_depth),
        .sld_segment_size                                (sld_segment_size),
        .sld_ram_block_type                              (sld_ram_block_type),
        .sld_state_bits                                  (sld_state_bits),
        .sld_buffer_full_stop                            (sld_buffer_full_stop),
        .sld_trigger_level                               (sld_trigger_level),
        .sld_trigger_in_enabled                          (sld_trigger_in_enabled),
        .sld_hps_trigger_in_enabled                      (sld_hps_trigger_in_enabled),
        .sld_hps_trigger_out_enabled                     (sld_hps_trigger_out_enabled),
        .sld_hps_event_enabled                           (sld_hps_event_enabled),
        .sld_hps_event_id                                (sld_hps_event_id),
        .sld_advanced_trigger_entity                     (sld_advanced_trigger_entity),
        .sld_trigger_level_pipeline                      (sld_trigger_level_pipeline),
        .sld_enable_advanced_trigger                     (sld_enable_advanced_trigger),
        .sld_advanced_trigger_1                          (sld_advanced_trigger_1),
        .sld_advanced_trigger_2                          (sld_advanced_trigger_2),
        .sld_advanced_trigger_3                          (sld_advanced_trigger_3),
        .sld_advanced_trigger_4                          (sld_advanced_trigger_4),
        .sld_advanced_trigger_5                          (sld_advanced_trigger_5),
        .sld_advanced_trigger_6                          (sld_advanced_trigger_6),
        .sld_advanced_trigger_7                          (sld_advanced_trigger_7),
        .sld_advanced_trigger_8                          (sld_advanced_trigger_8),
        .sld_advanced_trigger_9                          (sld_advanced_trigger_9),
        .sld_advanced_trigger_10                         (sld_advanced_trigger_10),
        .sld_inversion_mask_length                       (sld_inversion_mask_length),
        .sld_inversion_mask                              (sld_inversion_mask_mod),
        .sld_power_up_trigger                            (sld_power_up_trigger),
        .sld_state_flow_mgr_entity                       (sld_state_flow_mgr_entity),
        .sld_state_flow_use_generated                    (sld_state_flow_use_generated),
        .sld_current_resource_width                      (sld_current_resource_width),
        .sld_attribute_mem_mode                          (sld_attribute_mem_mode),
        .sld_storage_qualifier_bits                      (sld_storage_qualifier_bits),
        .sld_storage_qualifier_gap_record                (sld_storage_qualifier_gap_record),
        .sld_storage_qualifier_mode                      (sld_storage_qualifier_mode),
        .sld_storage_qualifier_enable_advanced_condition (sld_storage_qualifier_enable_advanced_condition),
        .sld_storage_qualifier_inversion_mask_length     (sld_storage_qualifier_inversion_mask_length),
        .sld_storage_qualifier_advanced_condition_entity (sld_storage_qualifier_advanced_condition_entity),
        .sld_storage_qualifier_pipeline                  (sld_storage_qualifier_pipeline),
        .sld_trigger_pipeline                            (sld_trigger_pipeline),
        .sld_ram_pipeline                                (sld_ram_pipeline),
        .sld_counter_pipeline                            (sld_counter_pipeline),
        .sld_use_jtag_signal_adapter                     (sld_use_jtag_signal_adapter),
        .sld_create_monitor_interface                    (sld_create_monitor_interface)
    ) sld_signaltap_inst (
        .dbg_fab_poweron_reset_release      (dbg_fab_poweron_reset_release),
        .ir_in           (ir_in),
        .ir_out          (ir_out),
        .tdo             (tdo),
        .tdi             (tdi),
        .clr             (clr),
        .usr1            (usr1),
        .ena             (ena),
        .jtag_state_cdr  (jtag_state_cdr),
        .jtag_state_sdr  (jtag_state_sdr),
        .jtag_state_e1dr (jtag_state_e1dr),
        .jtag_state_udr  (jtag_state_udr),
        .jtag_state_uir  (jtag_state_uir),
        .jtag_state_tlr  (jtag_state_tlr),
        .jtag_state_rti  (jtag_state_rti),
        .jtag_state_sdrs (jtag_state_sdrs),
        .jtag_state_pdr  (jtag_state_pdr),
        .jtag_state_e2dr (jtag_state_e2dr),
        .jtag_state_sirs (jtag_state_sirs),
        .jtag_state_cir  (jtag_state_cir),
        .jtag_state_sir  (jtag_state_sir),
        .jtag_state_e1ir (jtag_state_e1ir),
        .jtag_state_pir  (jtag_state_pir),
        .jtag_state_e2ir (jtag_state_e2ir),
        .tms             (tms),
        .clrn            (clrn),
        .irq             (irq),
        .raw_tck         (raw_tck)
    );

endmodule