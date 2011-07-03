build do |t|
  before :pack do
    data = YAML.parse(t.filesystem.build.dependencies.to_s).transform

    dependencies.each {|dependency|
      data.each {|key, value|
        next unless dependency.in?(Packo::Package.parse(key))

        dependency.name = value
      }
    }
  end
end

__END__
$$$

$$$ build/dependencies $$$

python%2: "python2"
