root = File.join(File.dirname(__FILE__))
cookbook_path root + '/cookbooks'
data_bag_path root + '/data_bags'

knife[:secret_file] = root + '/solo.pem'
