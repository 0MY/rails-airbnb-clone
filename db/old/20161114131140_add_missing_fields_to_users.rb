class AddMissingFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :description, :string
    add_column :users, :avatar, :string
    add_column :users, :admin, :boolean

    # Pas de 'rating' qui calculerait la moyenne des ratings,
    # on le recalcule à chaque fois qu'on en a besoin et on mettra
    # en place ensuite des 'caches' pour accélerer les traitements.

    # Pas de flag 'owner' ni 'renter', on considère que chaque user
    # à la fois owner et renter, et comme devise ne nous permet pas
    # de checker si le current_user est loggué comme owner ou renter,
    # on devra le traiter en recherchant si le user possède ou pas
    # une oeuvre d'art dans la table woa: si oui, alors il est aussi
    # owner et on pourra afficher dans les views les options / liens
    # qui sont propres au owner en plus de ceux du renter.
  end
end
