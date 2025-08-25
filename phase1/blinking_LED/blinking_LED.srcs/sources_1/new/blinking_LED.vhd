----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Drew Prescott
-- 
-- Create Date: 08/22/2025 12:16:36 PM
-- Design Name: 
-- Module Name: blinking_LED - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- comment

entity blinking_LED is
    Port ( clk : in STD_LOGIC; --100 MHz Clock
           led2 : inout STD_LOGIC); --LED 2
end blinking_LED;

architecture Behavioral of blinking_LED is
    signal counter : unsigned(26 downto 0) := (others => '0'); -- 27-bit counter
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if counter < 49_999_999 then
                counter <= counter +1;
            else
                counter <= (others => '0');
                led2 <= not led2;
            end if;
        end if;
    end process;
        

end Behavioral;
