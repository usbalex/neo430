-- #################################################################################################
-- #  << NEO430 - Data memory ("DMEM") >>                                                          #
-- # ********************************************************************************************* #
-- # This file is part of the NEO430 Processor project: https://github.com/stnolting/neo430        #
-- # Copyright by Stephan Nolting: stnolting@gmail.com                                             #
-- #                                                                                               #
-- # This source file may be used and distributed without restriction provided that this copyright #
-- # statement is not removed from the file and that any derivative work contains the original     #
-- # copyright notice and the associated disclaimer.                                               #
-- #                                                                                               #
-- # This source file is free software; you can redistribute it and/or modify it under the terms   #
-- # of the GNU Lesser General Public License as published by the Free Software Foundation,        #
-- # either version 3 of the License, or (at your option) any later version.                       #
-- #                                                                                               #
-- # This source is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;      #
-- # without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.     #
-- # See the GNU Lesser General Public License for more details.                                   #
-- #                                                                                               #
-- # You should have received a copy of the GNU Lesser General Public License along with this      #
-- # source; if not, download it from https://www.gnu.org/licenses/lgpl-3.0.en.html                #
-- # ********************************************************************************************* #
-- # Stephan Nolting, Hannover, Germany                                                 15.01.2020 #
-- #################################################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neo430;
use neo430.neo430_package.all;

library iCE40UP;
use iCE40UP.components.all;

entity neo430_dmem is
  generic (
    DMEM_SIZE : natural := 2*1024 -- internal DMEM size in bytes
  );
  port (
    clk_i  : in  std_ulogic; -- global clock line
    rden_i : in  std_ulogic; -- read enable
    wren_i : in  std_ulogic_vector(01 downto 0); -- write enable
    addr_i : in  std_ulogic_vector(15 downto 0); -- address
    data_i : in  std_ulogic_vector(15 downto 0); -- data in
    data_o : out std_ulogic_vector(15 downto 0)  -- data out
  );
end neo430_dmem;

architecture neo430_dmem_rtl of neo430_dmem is

  -- local signals --
  signal acc_en : std_ulogic;
  signal rdata  : std_ulogic_vector(15 downto 0);
  signal rden   : std_ulogic;
  signal addr   : integer;

  -- RAM --
  type dmem_file_t is array (0 to DMEM_SIZE/2-1) of std_ulogic_vector(7 downto 0);
  signal dmem_file_l : dmem_file_t;
  signal dmem_file_h : dmem_file_t;

  -- RAM attribute to inhibit bypass-logic - Intel only! --
  attribute ramstyle : string;
  attribute ramstyle of dmem_file_l : signal is "no_rw_check";
  attribute ramstyle of dmem_file_h : signal is "no_rw_check";

  -- RAM attribute to inhibit bypass-logic - Lattice ICE40up only! --
  attribute syn_ramstyle : string;
  attribute syn_ramstyle of dmem_file_l : signal is "no_rw_check";
  attribute syn_ramstyle of dmem_file_h : signal is "no_rw_check";

  -- SPRAM signals --
  signal spram_clk  : std_logic;
  signal spram_addr : std_logic_vector(13 downto 0);
  signal spram_di   : std_logic_vector(15 downto 0);
  signal spram_do   : std_logic_vector(15 downto 0);
  signal spram_be   : std_logic_vector(03 downto 0);
  signal spram_we   : std_logic;

begin

  -- Access Control -----------------------------------------------------------
  -- -----------------------------------------------------------------------------
  acc_en <= '1' when (addr_i >= dmem_base_c) and (addr_i < std_ulogic_vector(unsigned(dmem_base_c) + DMEM_SIZE)) else '0';
  addr <= to_integer(unsigned(addr_i(index_size_f(DMEM_SIZE/2) downto 1))); -- word aligned


  -- Memory Access ------------------------------------------------------------
  -- -----------------------------------------------------------------------------
  dmem_spram_inst : SP256K
  port map (
    AD       => spram_addr,  -- I
    DI       => spram_di,  -- I
    MASKWE   => spram_be,  -- I
    WE       => spram_we,  -- I
    CS       => '1',  -- I
    CK       => spram_clk,  -- I
    STDBY    => '0',  -- I
    SLEEP    => '0',  -- I
    PWROFF_N => '1',  -- I
    DO       => spram_do   -- O
  );

  -- signal type conversion --
  spram_clk  <= std_logic(clk_i);
  spram_addr <= std_logic_vector(addr_i(13+1 downto 0+1));
  spram_di   <= std_logic_vector(data_i(15 downto 0));
  spram_we   <= '1' when ((acc_en and (wren_i(0) or wren_i(1))) = '1') else '0'; -- global write enable
  rdata      <= std_ulogic_vector(spram_do);

  spram_be(1 downto 0) <= "11" when (wren_i(0) = '1') else "00"; -- low byte write enable
  spram_be(3 downto 2) <= "11" when (wren_i(1) = '1') else "00"; -- high byte write enable

  buffer_ff: process(clk_i)
  begin
    -- sanity check
    if (DMEM_SIZE > 12*1024) then
      assert false report "D-mem size out of range! Max 12kB!" severity error;
    end if;
    -- buffer --
    if rising_edge(clk_i) then
      rden <= rden_i and acc_en;
    end if;
  end process buffer_ff;

  -- output gate --
  data_o <= rdata when (rden = '1') else (others => '0');


end neo430_dmem_rtl;
