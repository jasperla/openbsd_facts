sensor_data = Facter::Util::Resolution.exec('/sbin/sysctl hw.sensors')
sensors_list = sensor_data.scan(/^\S+/).collect { |s| s.gsub(/hw\.sensors\.(\w*)\..*/, '\1')}.uniq

# List of all sensors in the system
Facter.add('sensors') do
  confine :kernel => :OpenBSD

  setcode do
    sensors_list.join(',')
  end
end

# Strip out one more level and create a fact composed of the `sensor` and the
# node below it. We assume that each sensor has the metrics one level deeper.
# i.e., cpu0.temp0=44.00 degC
sensors_list.each do |sensor|
  sensor_nodes = sensor_data.scan(/^\S+/).delete_if{|s| s !~ /#{sensor}/}.collect { |s| s.gsub(/hw\.sensors\.#{sensor}\.(\w*)=.*/, '\1')}.uniq

  sensor_nodes.each do |node|
    Facter.add("sensor_#{sensor}_#{node}") do
      confine :kernel => :OpenBSD

      setcode do
        Facter::Util::Resolution.exec("/sbin/sysctl -n hw.sensors.#{sensor}.#{node}")
      end
    end
  end
end
