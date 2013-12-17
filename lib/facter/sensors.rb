sensors = Facter::Util::Resolution.exec('/sbin/sysctl hw.sensors')
sensors_list = sensors.scan(/^\S+/).collect { |s| s.gsub(/hw\.sensors\.(\w*)\..*/, '\1')}.uniq

Facter.add('sensors') do
  setcode do
    sensors_list.join(',')
  end
end
