-- Top Module: EightbitKogStonAddSub
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity EightbitKogStonAddSub is
	port(
		a, b : in std_logic_vector (7 downto 0); -- the two numbers to be added/subtracted
		cin: in std_logic; -- cin == 0 implies a+b, cin == 0 implies a-b
		sum: out std_logic_vector (7 downto 0);
		cout: out std_logic -- final carry
	);
end entity;

architecture struct of EightbitKogStonAddSub is
   
   -- components

begin

	-- port maps

end architecture;