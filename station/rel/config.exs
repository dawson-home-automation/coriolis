use Mix.Releases.Config,
    default_release: :default,
    default_environment: :dev

release :firmware do
  set version: current_version(:firmware)
  plugin Shoehorn
  plugin Nerves
end

