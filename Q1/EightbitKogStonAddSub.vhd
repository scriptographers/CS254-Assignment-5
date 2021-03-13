-- Top Module: EightbitKogStonAddSub
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity EightbitKogStonAddSub is
	port (
		a, b : in std_logic_vector (7 downto 0); -- the two numbers to be added/subtracted
		cin  : in std_logic;                     -- cin == 0 implies a+b, cin == 0 implies a-b
		sum  : out std_logic_vector (7 downto 0);
		cout : out std_logic -- final carry
	);
end entity;

architecture struct of EightbitKogStonAddSub is

	signal g, p, Gi0, Pi0 : std_logic_vector (7 downto 0);
	
	component PreProcess is
		port (
			a, b : in std_logic_vector (7 downto 0);
			g, p : out std_logic_vector (7 downto 0)
		);
	end component;
	
	component PrefixComputation is
		port (
			g, p     : in std_logic_vector (7 downto 0);
			G_out, P_out : out std_logic_vector (7 downto 0)
		);
	end component;
	
	component PostProcess is
		port (
			Gi0, p : in std_logic_vector (7 downto 0);
			cout   : out std_logic;
			sum    : out std_logic_vector (7 downto 0)
		);
	end component;

begin

	-- Pre-processing
	preprocess_block : PreProcess
		port map(a => a, b => b, g => g, p => p);

	-- Prefix Computation
	prefix_block : PrefixComputation
		port map(g => g, p => p, G_out => Gi0, P_out => Pi0);

	-- Post-processing
	postprocess_block: PostProcess
		port map(Gi0 => Gi0, p => p, cout => cout, sum => sum);
	
end architecture;
