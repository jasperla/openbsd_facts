# This is hardware dependent (i.e. OpenBSD/amd64)
Facter.add('lidsuspend') do
  confine :kernel => :OpenBSD

  setcode do
    output = Facter::Util::Resolution.exec('/sbin/sysctl -n machdep.lidsuspend 2>/dev/null');

    output == '1' ? true : false
  end
end
