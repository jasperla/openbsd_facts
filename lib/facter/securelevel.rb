Facter.add('securelevel') do
  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.securelevel')
  end
end
