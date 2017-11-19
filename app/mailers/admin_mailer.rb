class AdminMailer < ActionMailer::Base
  default from: "ilmasheriff@gmail.com"

  def test_mail(clock)
    mail(to: ["ilmasheriff@gmail.com"],  body: clock.to_s)
  end

  def timesheet(date)
    @user_data={}
    Setting.active.where(group: "user_name").each{|x| @user_data[x.value]={check_in: nil, check_in_real_time: nil , check_out: nil, check_out_real_time: nil , check_in_message: nil, check_out_message: nil}}
    Clock.where( date: date).each do |t|
      @user_data[t.user][t.action.to_sym] = t.time.localtime
      @user_data[t.user]["#{t.action}".to_sym] = t.time.localtime
      @user_data[t.user]["#{t.action}_real_time".to_sym] = t.created_at.localtime
      @user_data[t.user]["#{t.action}_message".to_sym] = t.message
    end
    mail(to: ["ilmasheriff@gmail.com", "ilmasheriff@gmail.com"])


  end
end
