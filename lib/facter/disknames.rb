Facter.add('disknames') do
  confine :kernel => :OpenBSD

  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n hw.disknames')
  end
end
