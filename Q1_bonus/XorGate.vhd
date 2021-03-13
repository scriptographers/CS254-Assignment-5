-- Component: XOR Gate using 2x1 MUXes
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity XorGate is
	port (
		a, b : in std_logic;
		z    : out std_logic
	);
end entity;

architecture struct of XorGate is

	signal b10 : std_logic;

	component TwoByOneMux is
		port (
			i   : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z   : out std_logic);
	end component;

begin

	mux_b10 : TwoByOneMux
	port map(i(0) => '1', i(1) => '0', sel => b, z => b10);

	mux_xor : TwoByOneMux
	port map(i(0) => b, i(1) => b10, sel => a, z => z);

end architecture;
