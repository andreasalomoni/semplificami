class Practice < ActiveRecord::Base
  extend Enumerize

  belongs_to :sentence, dependent: :destroy
  belongs_to :user
  belongs_to :marriage_act, dependent: :destroy

  accepts_nested_attributes_for :sentence
  accepts_nested_attributes_for :marriage_act

  cattr_accessor :current_user

  enumerize :practice_type, in: {DIVORZIO_CONGIUNTO: 10, DIVORZIO_GIUDIZIALE: 20}

  enumerize :practice_status, in: {COMPILA_DATI:1000, DA_FIRMARE:1100, DA_INVIARE_COMUNE:1200, IN_VERIFICA_COMUNE:2000, ATTESA_CONFERMA_ANNOTAZIONI:2100, ESEGUITA_ANNOTAZIONE_DA_FIRMARE:2200, ESEGUITA_ANNOTAZIONE_DA_INVIARE:2300, ESEGUITA_ANNOTAZIONE_INVIATA:2400, ARCHIVIATA:2900}

  validates :practice_type, presence: true
  validates :user, presence: true
  validates :sentence, presence: true

  def initialize(attributes = {})
    attributes = Practice.default_values.merge attributes
    super
  end

  def self.default_values
    {
        'presentation_date' => Date.today
    }
  end

  def self.set_user(user)
    default_scope -> { where(user: user) }
  end
end
