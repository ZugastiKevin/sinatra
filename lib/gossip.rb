
class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @content = content  # le contenue content pouras etre utiliser autre pars
    @author = author  # le contenue author pouras etre utiliser autre pars
  end



  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|  # permet de stocker dans un fichier csv
      csv << [@author, @content]  # sauvegarde dans l'array 
    end

  end



  def self.all
    all_gossips = []  # permet de stocker
    CSV.read("./db/gossip.csv").each do |csv_line|  # permet de lire le fichier csv et les infos stocker
      all_gossips << Gossip.new(csv_line[0], csv_line[1]) # crée une dans l'array une indentation le nom de l'auteur en premier et le texte ensuite
    end
    return all_gossips  # renvoie l'array
  end


  def self.find(id)
    gossips = []   # permet de stocker la ligne csv demandée
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      if (id == index+1)          # si l'index est égale
        gossips << Gossip.new(csv_line[0], csv_line[1])    # si trouvé, ajout dans array et break pour retourner l'array
        break
        end
      end
    return gossips
  end

end