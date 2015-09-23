component "razor-torquebox" do |pkg, settings, platform|
  pkg.version "3.1.1"
  pkg.md5sum "f66d730f6fd480cb79e5470db61950b0"
  pkg.url "http://buildsources.delivery.puppetlabs.net/torquebox-#{pkg.get_version}.tar.gz"
  pkg.add_source "file://files/razor-torquebox.sh", sum: 'b0c34243002a691ee2179e749de59ae4'
  pkg.add_source "file://files/standalone.xml", sum: '6b0a5e1a7fe63407de03a8ee1bba43f8'

  pkg.install do
    [
       "mv * #{settings[:torquebox_prefix]}/",
       "rm -rf #{settings[:torquebox_prefix]}/jruby/lib/ruby/gems/shared/gems/builder-3.0.0/TAGS",
       "rm -rf #{settings[:torquebox_prefix]}/jruby/lib/ruby/gems/shared/gems/thor-0.19.1/spec",
       "rm -rf #{settings[:torquebox_prefix]}/jruby/lib/jni/{arm-Linux,Darwin,i386-SunOS,i386-Windows,ppc-AIX,sparcv9-SunOS,x86_64-FreeBSD,x86_64-SunOS,x86_64-Windows}",
    ]
  end

  pkg.install_configfile "../razor-torquebox.sh", "#{settings[:sysconfdir]}/razor-torquebox.sh"
  pkg.install_configfile "../standalone.xml", "#{settings[:torquebox_prefix]}/jboss/standalone/configuration/standalone.xml"

  pkg.add_postinstall_action ['install', 'upgrade'],
    [
      "/bin/chown -R razor:razor #{settings[:torquebox_prefix]}",
    ]
end
