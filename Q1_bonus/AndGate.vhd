-- Component: AND Gate using 2x1 MUX
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity AndGate is
	port (
		a, b : in std_logic;
		z    : out std_logic
	);
end entity;

architecture struct of AndGate is

	component TwoByOneMux is
		port (
			i   : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z   : out std_logic);
	end component;

begin

	mux_and : TwoByOneMux
	port map(i(0) => '0', i(1) => b, sel => a, z => z);

end architecture;
