#!/usr/bin/env ruby

Bundler.require(:default)

string_distance_threshold = 0.80

url = "https://pinegrove.bandcamp.com/"
html_page = ::HTTParty.get(url)
jarrow = ::FuzzyStringMatch::JaroWinkler.create(:native)

loop do
  new_html_page = ::HTTParty.get(url)
  string_distance = jarrow.getDistance(html_page, new_html_page)
  puts string_distance
  if string_distance < string_distance_threshold
    system("say all of a sudden it is morning time")
    puts %{
                                              +++++++++++    + +    ++  +   + +                      
                                              +                               +                      
                                              +                               /                      
                                              +                               +                      
                                              +                               ++                     
                          +  + ++++++++ ++++++/+++++++++++                    ++                     
                        ++                    +          +                    ++                     
                        +                     +          /                    ++                     
                        +                     +          /                    ++                     
                        +                     +          /                    ++                     
                        +                     +          +                     +                     
                        +                     +          +                    ++                     
                        +                     +          +                    ++                     
                        +                     +          +                    ++                     
                        +                     +          +                    ++                     
                        +                     +          /                    ++                     
                        +                     ++  +++    /++++ +++++++++++ ++++                      
                        +                                +                                           
                        +                                /                                           
                        +                                /                                           
                        +                                +                                           
                        +                                /                                           
                        +  +   +    + ++  +++++++ +++++++                                              
    }
  break                                                                                                    
  else
    progressbar = ::ProgressBar.create(:title => "Sleeping", :remainder_mark => "-")
    100.times { progressbar.increment; sleep 0.1 }
  end
end