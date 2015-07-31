namespace :import do
  task :photos => :environment do
    Dir['./datastore/albumelement-convert-json/**/*json'].each do |json_file|
      ap(json_file)
      JSON.load(open(json_file)).each do |record|
          loc = {latitude: record['location']['geojson']['coordinates'].first, 
                longitude: record['location']['geojson']['coordinates'].last}
          photo = Photo.create(
            url: record['url'],
            link: record['link'],
            thumb: record['thumb'],
            hits: record['hits']['total'],
            uploaded_at: Time.at(record['uploaded_at'].to_i),
            location: record['location']['geojson']['coordinates'],
          )
      end
    end
  end
end