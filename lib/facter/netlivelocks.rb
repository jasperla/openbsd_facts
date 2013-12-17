Facter.add('netlivelocks') do
  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.netlivelocks')
  end
end
