CarrierWave.configure do |config|
config.grid_fs_database = Mongoid.database.name
config.grid_fs_host = Mongoid.config.master.connection.host
config.storage = :grid_fs
config.grid_fs_access_url = "/images"
config.delete_tmp_file_after_storage = false
config.cache_dir = '/uploads'
config.root = Rails.root.join('tmp')


end
