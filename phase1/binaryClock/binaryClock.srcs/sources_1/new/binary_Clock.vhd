----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2025 05:35:39 PM
-- Design Name: 
-- Module Name: binary_Clock - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_Clock is
    Port ( clk : in STD_LOGIC;
           led0 : inout STD_LOGIC;
           led1 : inout STD_LOGIC;
           led2 : inout STD_LOGIC;
           led3 : inout STD_LOGIC;
           led4_r : inout STD_LOGIC;
           led4_g : inout STD_LOGIC;
           led4_b : inout STD_LOGIC;
           led5_r : inout STD_LOGIC;
           led5_g : inout STD_LOGIC;
           led5_b : inout STD_LOGIC);
end binary_Clock;

architecture Behavioral of binary_Clock is
    signal counter : unsigned(26 downto 0) := (others => '0'); -- 27-bit counter
    signal sec_counter : unsigned(10 downto 0) := (others => '0'); -- 11-bit counter
begin

    process(clk)
        begin
            if rising_edge(clk) then
                if counter < 99_999_999 then
                    counter <= counter +1;
                else
                    -- reset clock counter and add one to the second counter
                    counter <= (others => '0');
                    sec_counter <= sec_counter + 1;
                    
 ----------------------------------- 6th bit, 64 seconds ------------------------------
                    if sec_counter >= 64 then
                        led4_b <= '1';
                    else
                        led4_b <= '0';
                    end if;
                    
 ---------------------------------- 5th bit, 32 seconds -------------------------------
                    if (sec_counter >= 64) and ((sec_counter rem 64) >= 32) then
                        led4_g <= '1';
                    elsif (sec_counter >= 32) and (sec_counter < 64) then
                        led4_g <= '1';
                    else
                        led4_g <= '0';
                    end if;
                            
------------------------------------ 4th bit, 16 seconds --------------------------------
                    if (sec_counter >= 64) then
                        if ((sec_counter rem 64) >= 32) then
                            if (sec_counter rem 32) >= 16 then
                                led4_r <= '1';
                            else
                                led4_r <= '0';
                            end if;
                        else
                            if (sec_counter rem 64) >= 16 then
                                led4_r <= '1';
                            else
                                led4_r <= '0';
                            end if;
                        end if;
                    else
                        if ((sec_counter rem 64) >= 32) then
                            if (sec_counter rem 32) >= 16 then
                                led4_r <= '1';
                            else
                                led4_r <= '0';
                            end if;
                        else
                            if (sec_counter >= 16) and (sec_counter < 32) then
                                led4_r <= '1';
                            else
                                led4_r <= '0';
                            end if;
                        end if;
                    end if;
                                            
-------------------------------------------- 3rd bit, 8 seconds----------------------------
                    if (sec_counter >= 64) then
                        if ((sec_counter rem 64) >= 32) then
                            if ((sec_counter rem 32) >= 16) then
                                if (sec_counter rem 16) >= 8 then
                                    led3<= '1';
                                else
                                    led3 <= '0';
                                end if;                                
                            else
                                if (sec_counter rem 32) >= 8 then
                                    led3<= '1';
                                else
                                    led3 <= '0';
                                end if;
                            end if;
                        else
                            if ((sec_counter rem 32) >= 16) then
                                if (sec_counter rem 16) >= 8 then
                                    led3<= '1';
                                else
                                    led3 <= '0';
                                end if;
                            else
                                if (sec_counter rem 64) >= 8 then
                                    led3<= '1';
                                else
                                    led3 <= '0';
                                end if;
                            end if;
                        end if;
                    else
                        if ((sec_counter rem 64) >= 32) then
                            if ((sec_counter rem 32) >= 16) then
                                if (sec_counter rem 16) >= 8 then
                                    led3<= '1';
                                else
                                    led3 <= '0';
                                end if;
                            else
                                if (sec_counter rem 32) >= 8 then
                                    led3<= '1';
                                else
                                    led3 <= '0';
                                end if;
                            end if;
                        else
                            if ((sec_counter rem 32) >= 16) then
                                if (sec_counter rem 16) >= 8 then
                                    led3<= '1';
                                else
                                    led3 <= '0';
                                end if;
                            else
                                if (sec_counter >= 8) and (sec_counter < 16) then
                                    led3 <= '1';
                                else
                                    led3 <='0';
                                end if;
                            end if;
                        end if;
                    end if;
                    
 -------------------------------------------- 2nd bit, 4 seconds------------------------------------
                    if (sec_counter >= 64) then
                        if ((sec_counter rem 64) >= 32) then
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter rem 16) >=4 then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;                                
                            else
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter rem 32) >=4 then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;
                            end if;
                        else
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter rem 16) >=4 then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;                               
                            else
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter rem 64) >=4 then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;
                            end if;
                        end if;
                    else
                        if ((sec_counter rem 64) >= 32) then
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter rem 16) >=4 then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;                              
                            else
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter rem 32) >=4 then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;
                            end if;
                        else
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter rem 16) >=4 then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;                                
                            else
                                if ((sec_counter rem 16) >= 8) then  
                                    if (sec_counter rem 8) >= 4 then
                                        led2<= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                else
                                    if (sec_counter >= 4) and (sec_counter < 8) then
                                        led2 <= '1';
                                    else
                                        led2 <= '0';
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;                    
                    
----------------------------------------- 1st bit, 2 seconds-------------------------------------------------
                    if (sec_counter >= 64) then
                        if ((sec_counter rem 64) >= 32) then
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 16) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;                             
                            else
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 32) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;  
                            end if;
                        else
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 16) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;                             
                            else
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 64) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;  
                            end if;
                        end if;
                    else
                        if ((sec_counter rem 64) >= 32) then
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 16) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;                             
                            else
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 32) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;  
                            end if;
                        else
                            if ((sec_counter rem 32) >= 16) then
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 16) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;                             
                            else
                                if ((sec_counter rem 16) >= 8) then 
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter rem 8) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                else
                                    if ((sec_counter rem 8) >= 4) then 
                                        if (sec_counter rem 4) >= 2 then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    else
                                        if (sec_counter >= 2) and (sec_counter < 4) then
                                            led1<= '1';
                                        else
                                            led1 <= '0';
                                        end if;
                                    end if;
                                end if;  
                            end if;
                        end if;
                    end if;
                    
                    -- 0th bit, 1 second
                    if (sec_counter rem 2) = 1 then
                        led0 <= '1';
                    else
                        led0 <= '0';
                    end if;
                    
                    -- reset
                    if sec_counter = 127 then
                        sec_counter <= (others => '0');
                    end if;
                    
                end if;
            end if;
        end process;

end Behavioral;
