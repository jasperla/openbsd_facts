Facter.add('buffercache') do
  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.bufcachepercent')
  end
end
