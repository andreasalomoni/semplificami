class StatsController < ApplicationController
  before_filter :set_data, except: [:drilldown]

  def index
    #
    #@values = []
    #Outbox.all.where(['created_at >= ? AND created_at < ?', Time.new(cur_year),Time.new(cur_year+1)]).group_by { |o| o.created_at.month }.each do |year, outboxes|
    #  @values << {name: t("date.month_names")[year].titleize, data: multigroup_by(outboxes) {|o| o.stato.humanize} }
    #end
    #
    #@channels = multigroup_by(Shipment.includes(:account).where(['created_at >= ? AND created_at < ?', Time.new(cur_year),Time.new(cur_year+1)])) { |s| s.account.channel.name }
    #
    #states = {INVIATO:100,CONSEGNATO:300,PRONTO_PER_INVIO:5,ERRORE:10}
    #
    #@rand = []
    #states.each do |s,w|
    #  data = {}
    #  (1..12).each do |m|
    #    data[t('date.month_names')[m]] = rand(w)
    #  end
    #  @rand << {name: s.to_s, data: data}
    #end
    #
    @cur_year = (params[:year] || Date.today.year).to_i
  end

  def data
    render json: @data
  end

  def drilldown
    y = (params[:year] || Date.today.year).to_i
    m = (params[:month] || Date.today.month).to_i
    s = params[:status] || :INVIATO

    cy = Date.today.year
    cm = Date.today.month
    cd = Date.today.mday

    @dd = {values:[], labels:[], tooltips:[]}
    (1..Time.days_in_month(m,y)).each do |day|
      v = cy==y && cm==m && cd<=day ? 0 : rand(10)
      dt = Date.new(y,m,day).to_s
      @dd[:values] << v
      @dd[:labels] << dt
      @dd[:tooltips] << "#{dt} : #{v}"
    end
    @dd[:title] = "Dettagli invii in stato #{s.humanize.titleize} per #{t('date.month_names')[m]} #{y}"

    render json: @dd
  end

  def set_data
    pYear = (params[:year] || Date.today.year).to_i
    cur_year = Date.today.year
    cur_month = Date.today.month

    @data = {values: [], tooltips: [], labels: [], drilldownparams: []}

    states = {INVIATO:100,CONSEGNATO:300,PRONTO_PER_INVIO:5,ERRORE:10}

    (1..12).each do |m|
      values = []
      states.each do |s,w|
        v = cur_year!=pYear || m<cur_month ? rand(w) : m == cur_month ? rand(w) * Date.today.mday / Time.days_in_month(cur_month, cur_year) : 0
        values << v
        @data[:tooltips] << "#{s}: #{v}"
        @data[:drilldownparams] << "year=#{pYear}&month=#{m}&status=#{s}"
      end
      @data[:values] << values
      @data[:labels] << t('date.month_names')[m]
    end
    @data[:keys] = states.keys
  end

  def in_year(field, cur_year)
    where(["#{field} >= ? AND #{field} < ?", Time.new(cur_year),Time.new(cur_year+1)])
  end

  def multigroup_by(values, &block)
    Hash[values.group_by(&block).map { |k,v| [k,v.count] }]
  end
end
