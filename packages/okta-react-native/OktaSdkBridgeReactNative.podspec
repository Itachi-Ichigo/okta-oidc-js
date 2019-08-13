require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
version = package['version']

Pod::Spec.new do |s|
  s.name         = package['podname']
  s.version      = version
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/okta/okta-oidc-js.git" }
  source[:tag] = "@okta/@{version}"
  s.source_files  = "ios/**/*.{h,m,swift}"

  s.dependency 'React'
  s.dependency "OktaOidc"
end

