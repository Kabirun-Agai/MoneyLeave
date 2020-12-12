class MoneyMController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all
    #現在の日付を取得し、YYYYMMの形に整形
    nowtime = Date.today
    nowyear = nowtime.year.to_s
    nowmonth = nowtime.month.to_s
    now_year_month = nowyear + nowmonth

    #現在から残りの日付を計算
    last_day = Date.new(nowtime.year, nowtime.month, -1) 
    days_left = (last_day - nowtime).to_i



    #year_monthカラムがnilのデータがあれば全て取り出し、start_dateからYYYYMMの形に整形してyear_monthカラムに代入
    if date2 = Event.where(year_month: nil)
      date2.each  do |date|
        time = date.start_date
        year = time.year.to_s
        month = time.month.to_s 
        date.year_month = year + month
        date.save
      end
    end

    #現在の年月と同じデータだけを取得
    dates = Event.where(year_month: now_year_month, user_id: current_user.id)
    #今月の収入と支出
    @allincome = 0
    @allexpense = 0
    dates.each do |date|
      if date.income
        @allincome += date.income
      end

      if date.expense
        @allexpense += date.expense
      end
    end

    #今月の使えるお金
    @canmoney = @allincome-@allexpense 
    if @canmoney < 0
      @canmoney = 0
    end

    #一日に使えるお金
    @day_canmoney = @canmoney/days_left
  end
  
end
