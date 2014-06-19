require 'digest'
require 'uri'
require 'cgi'

module ProfPic
  class << self


    def fb(fbid, https: true, width: nil, height: nil, type: 'square')
      query_hash = hash_without_nils({
        type: type,
        width: width,
        height: height
      })
      params = {
        scheme: (https ? 'https' : 'http'),
        host: 'graph.facebook.com',
        path: "/#{fbid}/picture",
        query: URI.encode_www_form(query_hash)
      }
      URI::Generic.build(params).to_s    
    end

    def gravatar(email, size: nil, default: nil, https: true)
      email_hash = Digest::MD5.hexdigest(email.strip.downcase)
      query_hash = hash_without_nils({
        s: size,
        d: (default ? CGI.escape(default) : nil)
      })
      params = {
        scheme: (https ? 'https' : 'http'),
        host: (https ? 'secure.gravatar.com' : 'www.gravatar.com'),
        path: "/avatar/#{email_hash}",
        query: URI.encode_www_form(query_hash)
      }
      URI::Generic.build(params).to_s
    end

    private

    def hash_without_nils(hash)
      hash.delete_if{ |k,v| v.nil? }
    end
  end
end
