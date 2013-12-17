Facter.add('disknames') do
  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n hw.disknames')
  end
end
