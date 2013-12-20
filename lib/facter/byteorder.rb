Facter.add('byteorder') do
  confine :kernel => :OpenBSD

  setcode do
    case Facter::Util::Resolution.exec('/sbin/sysctl -n hw.byteorder')
    when /1234/
      "little"
    when /4321/
      "big"
    end
  end
end
