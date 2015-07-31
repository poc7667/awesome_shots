namespace :import do
  task :hotspots => :environment do
    Dir['./datastore/top-geolcation-articles/**/*json'].each do |json_file|
      ap(json_file)
      ap(Time.now)
      records = []
      JSON.load(open(json_file)).each do |record|
        records << {
          title: record['title'],
          url: record['url'],
          image: record['image'],
          location: record['latlon'].collect{|c|c.to_f},
        }
      end
      Hotspot.collection.insert(records)
      ap(Time.now)
    end
  end
end
