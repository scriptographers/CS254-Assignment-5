-- Component: Computes carry and sum for the post-processing step
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity PostProcess is
	port (
		Gi0, p : in std_logic_vector (7 downto 0);
		cout   : out std_logic;
		sum    : out std_logic_vector (7 downto 0)
	);
end entity;

architecture struct of PostProcess is

	signal c : std_logic_vector (8 downto 0);

	component XorGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

begin

	-- Assuming c_0 = 0, thus c(i+1) = G[i:0]
	c(0) <= '0';
	init_carry : for I in 0 to 7 generate
		c(I+1) <= Gi0(I);
	end generate init_carry;
	
	cout <= c(8);

	-- Parallel Sum computation using for...generate statement
	postprocess_loop : for I in 0 to 7 generate
		xor_i : XorGate
		port map(a => p(I), b => c(I), z => sum(I));
	end generate postprocess_loop;

end architecture;
