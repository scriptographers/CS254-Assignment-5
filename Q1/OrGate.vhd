-- Component: Or Gate using 2x1 MUXes
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity OrGate is
	port (
		a, b : in std_logic;
		z    : out std_logic
	);
end entity;

architecture struct of OrGate is

	component TwoByOneMux is
		port (
			i   : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z   : out std_logic);
	end component;

begin

	mux_or : TwoByOneMux
	port map(i(0) => b, i(1) => '1', sel => a, z => z);

end architecture;
