require 'pathname'
ROOT = Pathname.new(File.expand_path('..', __FILE__))

$: << ROOT.join('lib')
