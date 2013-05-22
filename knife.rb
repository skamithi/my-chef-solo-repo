root = File.join(File.dirname(__FILE__))
# knife solo will install new cookbooks in the first cookbook path found
cookbook_path "#{root}/site-cookbooks", "#{root}/cookbooks"
data_bag_path root + '/data_bags'
knife[:secret_file] = root + '/solo.pem'
