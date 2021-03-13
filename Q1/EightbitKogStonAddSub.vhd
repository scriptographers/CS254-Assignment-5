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

	signal b_mod, g, p, Gi0, Pi0 : std_logic_vector (7 downto 0);

	component Overloading is
		port (
			c0    : in std_logic;
			b     : in std_logic_vector (7 downto 0);
			b_mod : out std_logic_vector (7 downto 0)
		);
	end component;

	component PreProcess is
		port (
			a, b : in std_logic_vector (7 downto 0);
			g, p : out std_logic_vector (7 downto 0)
		);
	end component;

	component PrefixComputation is
		port (
			g, p         : in std_logic_vector (7 downto 0);
			G_out, P_out : out std_logic_vector (7 downto 0)
		);
	end component;

	component PostProcess is
		port (
			cin      : in std_logic;
			Gi0, Pi0 : in std_logic_vector (7 downto 0);
			p        : in std_logic_vector (7 downto 0);
			cout     : out std_logic;
			sum      : out std_logic_vector (7 downto 0)
		);
	end component;

begin

	-- Overloading
	overloading_block : Overloading
	port map(c0 => cin, b => b, b_mod => b_mod);

	-- Pre-processing
	preprocess_block : PreProcess
	port map(a => a, b => b_mod, g => g, p => p);

	-- Prefix Computation
	prefix_block : PrefixComputation
	port map(g => g, p => p, G_out => Gi0, P_out => Pi0);

	-- Post-processing
	postprocess_block : PostProcess
	port map(cin => cin, Gi0 => Gi0, Pi0 => Pi0, p => p, cout => cout, sum => sum);

end architecture;
