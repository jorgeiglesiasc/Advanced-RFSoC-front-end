-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity chain_selector is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 6;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    data_in0_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    data_in0_empty_n : IN STD_LOGIC;
    data_in0_read : OUT STD_LOGIC;
    data_in1_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    data_in1_empty_n : IN STD_LOGIC;
    data_in1_read : OUT STD_LOGIC;
    data_in2_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    data_in2_empty_n : IN STD_LOGIC;
    data_in2_read : OUT STD_LOGIC;
    data_in3_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    data_in3_empty_n : IN STD_LOGIC;
    data_in3_read : OUT STD_LOGIC;
    data_out_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    data_out_full_n : IN STD_LOGIC;
    data_out_write : OUT STD_LOGIC;
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0) );
end;


architecture behav of chain_selector is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "chain_selector_chain_selector,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu48dr-ffvg1517-2-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.997000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=69,HLS_SYN_LUT=173,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal s0 : STD_LOGIC;
    signal s1 : STD_LOGIC;
    signal s2 : STD_LOGIC;
    signal s3 : STD_LOGIC;
    signal data_in0_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal data_in1_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal data_in2_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal data_in3_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal tmp_reg_147 : STD_LOGIC_VECTOR (0 downto 0);
    signal data_out_blk_n : STD_LOGIC;
    signal s0_read_reg_143 : STD_LOGIC_VECTOR (0 downto 0);
    signal s1_read_reg_139 : STD_LOGIC_VECTOR (0 downto 0);
    signal s2_read_reg_135 : STD_LOGIC_VECTOR (0 downto 0);
    signal s3_read_reg_131 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_nbreadreq_fu_88_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_state2 : BOOLEAN;
    signal ap_block_state3 : BOOLEAN;
    signal ap_block_state4 : BOOLEAN;
    signal ap_predicate_op52_write_state5 : BOOLEAN;
    signal ap_block_state5 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component chain_selector_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        s0 : OUT STD_LOGIC;
        s1 : OUT STD_LOGIC;
        s2 : OUT STD_LOGIC;
        s3 : OUT STD_LOGIC );
    end component;



begin
    control_s_axi_U : component chain_selector_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        s0 => s0,
        s1 => s1,
        s2 => s2,
        s3 => s3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state5) and ((tmp_reg_147 = ap_const_lv1_0) or (grp_nbreadreq_fu_88_p3 = ap_const_lv1_0)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                s0_read_reg_143 <= (0=>s0, others=>'-');
                s1_read_reg_139 <= (0=>s1, others=>'-');
                s2_read_reg_135 <= (0=>s2, others=>'-');
                s3_read_reg_131 <= (0=>s3, others=>'-');
                tmp_reg_147 <= grp_nbreadreq_fu_88_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, data_in0_empty_n, data_in1_empty_n, data_in2_empty_n, data_in3_empty_n, data_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, tmp_reg_147, s0_read_reg_143, s1_read_reg_139, s2_read_reg_135, grp_nbreadreq_fu_88_p3, ap_predicate_op52_write_state5)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1) and (grp_nbreadreq_fu_88_p3 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                elsif ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1) and (grp_nbreadreq_fu_88_p3 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((data_in0_empty_n = ap_const_logic_0) or ((s0_read_reg_143 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if ((not(((data_in1_empty_n = ap_const_logic_0) or ((s1_read_reg_139 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if ((not(((data_in2_empty_n = ap_const_logic_0) or ((s2_read_reg_135 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if ((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state5) and ((tmp_reg_147 = ap_const_lv1_0) or (grp_nbreadreq_fu_88_p3 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif ((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (tmp_reg_147 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (grp_nbreadreq_fu_88_p3 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(data_in0_empty_n, data_out_full_n, s0_read_reg_143)
    begin
        if (((data_in0_empty_n = ap_const_logic_0) or ((s0_read_reg_143 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state3_blk_assign_proc : process(data_in1_empty_n, data_out_full_n, s1_read_reg_139)
    begin
        if (((data_in1_empty_n = ap_const_logic_0) or ((s1_read_reg_139 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state4_blk_assign_proc : process(data_in2_empty_n, data_out_full_n, s2_read_reg_135)
    begin
        if (((data_in2_empty_n = ap_const_logic_0) or ((s2_read_reg_135 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state5_blk_assign_proc : process(data_in3_empty_n, data_out_full_n, tmp_reg_147, ap_predicate_op52_write_state5)
    begin
        if ((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state2_assign_proc : process(data_in0_empty_n, data_out_full_n, s0_read_reg_143)
    begin
                ap_block_state2 <= ((data_in0_empty_n = ap_const_logic_0) or ((s0_read_reg_143 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)));
    end process;


    ap_block_state3_assign_proc : process(data_in1_empty_n, data_out_full_n, s1_read_reg_139)
    begin
                ap_block_state3 <= ((data_in1_empty_n = ap_const_logic_0) or ((s1_read_reg_139 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)));
    end process;


    ap_block_state4_assign_proc : process(data_in2_empty_n, data_out_full_n, s2_read_reg_135)
    begin
                ap_block_state4 <= ((data_in2_empty_n = ap_const_logic_0) or ((s2_read_reg_135 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)));
    end process;


    ap_block_state5_assign_proc : process(data_in3_empty_n, data_out_full_n, tmp_reg_147, ap_predicate_op52_write_state5)
    begin
                ap_block_state5 <= (((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)));
    end process;


    ap_done_assign_proc : process(ap_done_reg, data_in3_empty_n, data_out_full_n, ap_CS_fsm_state5, tmp_reg_147, grp_nbreadreq_fu_88_p3, ap_predicate_op52_write_state5)
    begin
        if ((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state5) and ((tmp_reg_147 = ap_const_lv1_0) or (grp_nbreadreq_fu_88_p3 = ap_const_lv1_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_predicate_op52_write_state5_assign_proc : process(tmp_reg_147, s3_read_reg_131)
    begin
                ap_predicate_op52_write_state5 <= ((s3_read_reg_131 = ap_const_lv1_1) and (tmp_reg_147 = ap_const_lv1_1));
    end process;


    ap_ready_assign_proc : process(data_in3_empty_n, data_out_full_n, ap_CS_fsm_state5, tmp_reg_147, grp_nbreadreq_fu_88_p3, ap_predicate_op52_write_state5)
    begin
        if ((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state5) and ((tmp_reg_147 = ap_const_lv1_0) or (grp_nbreadreq_fu_88_p3 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    data_in0_blk_n_assign_proc : process(data_in0_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            data_in0_blk_n <= data_in0_empty_n;
        else 
            data_in0_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_in0_read_assign_proc : process(data_in0_empty_n, data_out_full_n, ap_CS_fsm_state2, s0_read_reg_143)
    begin
        if ((not(((data_in0_empty_n = ap_const_logic_0) or ((s0_read_reg_143 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            data_in0_read <= ap_const_logic_1;
        else 
            data_in0_read <= ap_const_logic_0;
        end if; 
    end process;


    data_in1_blk_n_assign_proc : process(data_in1_empty_n, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            data_in1_blk_n <= data_in1_empty_n;
        else 
            data_in1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_in1_read_assign_proc : process(data_in1_empty_n, data_out_full_n, ap_CS_fsm_state3, s1_read_reg_139)
    begin
        if ((not(((data_in1_empty_n = ap_const_logic_0) or ((s1_read_reg_139 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            data_in1_read <= ap_const_logic_1;
        else 
            data_in1_read <= ap_const_logic_0;
        end if; 
    end process;


    data_in2_blk_n_assign_proc : process(data_in2_empty_n, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            data_in2_blk_n <= data_in2_empty_n;
        else 
            data_in2_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_in2_read_assign_proc : process(data_in2_empty_n, data_out_full_n, ap_CS_fsm_state4, s2_read_reg_135)
    begin
        if ((not(((data_in2_empty_n = ap_const_logic_0) or ((s2_read_reg_135 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            data_in2_read <= ap_const_logic_1;
        else 
            data_in2_read <= ap_const_logic_0;
        end if; 
    end process;


    data_in3_blk_n_assign_proc : process(data_in3_empty_n, ap_CS_fsm_state5, tmp_reg_147)
    begin
        if (((tmp_reg_147 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            data_in3_blk_n <= data_in3_empty_n;
        else 
            data_in3_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_in3_read_assign_proc : process(data_in3_empty_n, data_out_full_n, ap_CS_fsm_state5, tmp_reg_147, ap_predicate_op52_write_state5)
    begin
        if ((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (tmp_reg_147 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            data_in3_read <= ap_const_logic_1;
        else 
            data_in3_read <= ap_const_logic_0;
        end if; 
    end process;


    data_out_blk_n_assign_proc : process(data_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, tmp_reg_147, s0_read_reg_143, s1_read_reg_139, s2_read_reg_135, s3_read_reg_131)
    begin
        if ((((s3_read_reg_131 = ap_const_lv1_1) and (tmp_reg_147 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5)) or ((s2_read_reg_135 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4)) or ((s1_read_reg_139 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3)) or ((s0_read_reg_143 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            data_out_blk_n <= data_out_full_n;
        else 
            data_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_out_din_assign_proc : process(data_in0_dout, data_in0_empty_n, data_in1_dout, data_in1_empty_n, data_in2_dout, data_in2_empty_n, data_in3_dout, data_in3_empty_n, data_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, tmp_reg_147, s0_read_reg_143, s1_read_reg_139, s2_read_reg_135, ap_predicate_op52_write_state5)
    begin
        if ((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state5) and (ap_predicate_op52_write_state5 = ap_const_boolean_1))) then 
            data_out_din <= data_in3_dout;
        elsif ((not(((data_in2_empty_n = ap_const_logic_0) or ((s2_read_reg_135 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (s2_read_reg_135 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            data_out_din <= data_in2_dout;
        elsif ((not(((data_in1_empty_n = ap_const_logic_0) or ((s1_read_reg_139 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (s1_read_reg_139 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            data_out_din <= data_in1_dout;
        elsif ((not(((data_in0_empty_n = ap_const_logic_0) or ((s0_read_reg_143 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (s0_read_reg_143 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            data_out_din <= data_in0_dout;
        else 
            data_out_din <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    data_out_write_assign_proc : process(data_in0_empty_n, data_in1_empty_n, data_in2_empty_n, data_in3_empty_n, data_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, tmp_reg_147, s0_read_reg_143, s1_read_reg_139, s2_read_reg_135, ap_predicate_op52_write_state5)
    begin
        if (((not((((tmp_reg_147 = ap_const_lv1_1) and (data_in3_empty_n = ap_const_logic_0)) or ((data_out_full_n = ap_const_logic_0) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state5) and (ap_predicate_op52_write_state5 = ap_const_boolean_1)) or (not(((data_in2_empty_n = ap_const_logic_0) or ((s2_read_reg_135 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (s2_read_reg_135 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4)) or (not(((data_in1_empty_n = ap_const_logic_0) or ((s1_read_reg_139 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (s1_read_reg_139 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3)) or (not(((data_in0_empty_n = ap_const_logic_0) or ((s0_read_reg_143 = ap_const_lv1_1) and (data_out_full_n = ap_const_logic_0)))) and (s0_read_reg_143 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            data_out_write <= ap_const_logic_1;
        else 
            data_out_write <= ap_const_logic_0;
        end if; 
    end process;

    grp_nbreadreq_fu_88_p3 <= (0=>(data_in0_empty_n), others=>'-');
end behav;
