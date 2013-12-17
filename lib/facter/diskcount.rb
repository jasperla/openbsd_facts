Facter.add('diskcount') do
  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n hw.diskcount')
  end
end
