Facter.add('buffercache') do
  confine :kernel => :OpenBSD

  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.bufcachepercent') + "%"
  end
end
