# This is hardware dependent (i.e. OpenBSD/sparc64)
Facter.add('led_blink') do
  confine :kernel => :OpenBSD

  setcode do
    output = Facter::Util::Resolution.exec('/sbin/sysctl -n machdep.led_blink 2>/dev/null')

    if ! output.is_a? Integer
      nil
    end
  end
end
