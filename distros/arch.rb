# adapt Distrø dependencies to Arch

before :pack do
  data = YAML.parse(filesystem.arch_linux.dependencies.to_s).transform

  dependencies.each {|dependency|
    data.each {|key, value|
      next unless dependency.in?(Packo::Package.parse(key))

      dependency.name = value
    }
  }
end

__END__
$$$

$$$ arch_linux/dependencies $$$

python%2: "python2"
