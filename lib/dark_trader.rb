require 'rubygems'
require 'nokogiri' 
require 'open-uri'


def url
Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #définir url pour les xpath remplace le stockage dans page = url()
end

def crypto_name
  symbol_crypto_array = url.xpath('//tr[*]/td[3]').collect(&:text) #copier tous les Url des symbol tr => colonne //td ligne
  return symbol_crypto_array
end

def currency_rate
  price_crypto_array = url.xpath('//tr[*]/td[5]').collect(&:text) #.collect(&:arguments) => méthode de collect raccourci
  return price_crypto_array
end

def big_hash 
  hash_crypto = Hash[crypto_name.zip(currency_rate)] #As of Ruby 2.5 you can use : Hash[ary1.zip(ary2)] méthode de compression de array
  return hash_crypto
end

  def mini_hash
    array_final = [] #déclarer un tableau vide (mise en forme)
    big_hash.each { |key_value| array_final << {key_value[0] => key_value[1]}} #initier la boucle du big_hash / méthode compressée
    '''
    key_value name(0)&price(1) / boucle le hash [.zip] key = clé (symbol) value = valeur (price)
    '''
    puts array_final
  end

def perform
  big_hash
  mini_hash
  
end
perform
