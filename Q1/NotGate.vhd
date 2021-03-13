-- Component: NOT Gate using 2x1 MUX
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity NotGate is
	port (
		a : in std_logic;
		z : out std_logic
	);
end entity;

architecture struct of NotGate is

	component TwoByOneMux is
		port (
			i   : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z   : out std_logic);
	end component;

begin

	mux_not : TwoByOneMux
	port map(i(0) => '1', i(1) => '0', sel => a, z => z);

end architecture;
