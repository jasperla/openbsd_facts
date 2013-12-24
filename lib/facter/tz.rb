# The 'timezone' fact uses Ruby's Time.new.zone which may not
# be the right zone on OpenBSD; so read /etc/localtime instead.
Facter.add('tz') do
  confine :kernel => :OpenBSD

  setcode do
    File.readlink('/etc/localtime').split('/').last(2).join('/')
  end
end
