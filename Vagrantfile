Vagrant.configure(2) do |config|

   config.vm.define :java7 do |java7|
    java7.vm.box = "precise32"
    laravel.vm.box_url = "http://files.vagrantup.com/precise32.box"
    java7.vm.provision :shell, path: "java.sh"
    java7.vm.synced_folder "workspace", "/opt/apache-tomcat-8.0.22/webapps"
    java7.vm.network :forwarded_port, guest: 8080, host: 8080
  end
   
end
