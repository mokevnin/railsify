class Cname
  def self.resolver(current_host)
    cnames = Resolv::DNS.new.getresources(current_host, Resolv::DNS::Resource::IN::CNAME)
    cname = cnames.detect {|cn| cn.name.to_s.include? configus.host }
    cname ? cname.name.to_s : nil
  end
end
