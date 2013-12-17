Facter.add('osrevision') do
  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.osrevision')
  end
end
