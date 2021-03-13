-- Component: Flips bits of b if needed for subtractor
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity Overloading is
  port (
    c0    : in std_logic;
    b     : in std_logic_vector (7 downto 0);
    b_mod : out std_logic_vector (7 downto 0)
  );
end entity;

architecture struct of Overloading is

  component XorGate is
    port (
      a, b : in std_logic;
      z    : out std_logic
    );
  end component;

begin

  -- Parallel Sum computation using for...generate statement
  modifier_loop : for I in 0 to 7 generate
    xor_i : XorGate
    port map(a => b(I), b => c0, z => b_mod(I));
  end generate modifier_loop;

end architecture;
