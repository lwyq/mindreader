require 'sinatra'
require "sinatra/reloader" if development?

enable :sessions

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

helpers do
 # def no_response_yet_qn1?
  #  session['q1']= nil
 # end

#  def qn1_prompt
 #   if session['q1']= nil
  #    "Try and test me!"
   # else
    #  ["Try again. Y or N?", "Invalid response. Enter only Y or N.", "Come on, Y or N?"].sample
   # end
 # end

  def calc_result
    session['q1'] + session['q2'] + session['q3'] + session['q4'] + session['q5'] + session['q1_again'] + session['q2_again'] + session['q3_again'] + session['q4_again'] + session['q5_again']
  end

  def prompt
    ["Try again. Y or N?", "Invalid response. Enter only Y or N.", "Come on, Y or N?"].sample
  end
  
  def final_message
    ["Amazing? I really read your mind!", "I know this is mind-boggling. Try me again!", "I knew it from reading my crystal ball!"].sample
  end
end



get '/' do
    File.read(File.join('public', 'index.html'))
end


get '/new' do
  clear_q1_response
  clear_q2_response
  clear_q3_response
  clear_q4_response
  clear_q5_response
  clear_q1_again_response
  clear_q2_again_response
  clear_q3_again_response
  clear_q4_again_response
  clear_q5_again_response
  redirect to('/')
end


send :get, '/q1' do
  erb :qn_one
end

send :post, '/q1' do
  if params[:qn1_input].upcase == 'Y' or params[:qn1_input].upcase == 'N'
    session['q1'] = if params[:qn1_input].upcase == 'Y' then 1 elsif params[:qn1_input].upcase == 'N' then 0 end
    session['q1_again'] = 0
  redirect to('/q2')
  else
    session['q1'] = 0
    erb :qn_one_again
  end
end

send :get, '/q1_again' do
  erb :qn_one_again
end

send :post, '/q1_again' do
  if params[:qn1_input_again].upcase == 'Y' or params[:qn1_input_again].upcase == 'N'
    session['q1_again'] = if params[:qn1_input_again].upcase == 'Y' then 1 elsif params[:qn1_input_again].upcase == 'N' then 0 end
  redirect to('/q2')
  else
    erb :qn_one_again
  end
end


send :get, '/q2' do
  erb :qn_two
end

send :post, '/q2' do
  if params[:qn2_input].upcase == 'Y' or params[:qn2_input].upcase == 'N'
    session['q2'] = if params[:qn2_input].upcase == 'Y' then 2 else 0 end
    session['q2_again'] = 0
  redirect to('/q3')
  else
    session['q2'] = 0
    erb :qn_two_again
  end
end

send :get, '/q2_again' do
  erb :qn_two_again
end

send :post, '/q2_again' do
  if params[:qn2_input_again].upcase == 'Y' or params[:qn2_input_again].upcase == 'N'
    session['q2_again'] = if params[:qn2_input_again].upcase == 'Y' then 2 else 0 end
  redirect to('/q3')
  else
    erb :qn_two_again
  end
end

send :get, '/q3' do
  erb :qn_three
end

send :post, '/q3' do
  if params[:qn3_input].upcase == 'Y' or params[:qn3_input].upcase == 'N'
    session['q3'] = if params[:qn3_input].upcase == 'Y' then 4 else 0 end
    session['q3_again'] = 0
  redirect to('/q4')
  else
    session['q3'] = 0
    erb :qn_three_again
  end
end

send :get, '/q3_again' do
  erb :qn_three_again
end

send :post, '/q3_again' do
  if params[:qn3_input_again].upcase == 'Y' or params[:qn3_input_again].upcase == 'N'
    session['q3_again'] = if params[:qn3_input_again].upcase == 'Y' then 4 else 0 end
  redirect to('/q4')
  else
    erb :qn_three_again
  end
end


send :get, '/q4' do
  erb :qn_four
end

send :post, '/q4' do
  if params[:qn4_input].upcase == 'Y' or params[:qn4_input].upcase == 'N'
    session['q4'] = if params[:qn4_input].upcase == 'Y' then 8 else 0 end
    session['q4_again'] = 0
  redirect to('/q5')
  else
    session['q4'] = 0
    erb :qn_four_again
  end
end


send :get, '/q4_again' do
  erb :qn_four_again
end

send :post, '/q4_again' do
  if params[:qn4_input_again].upcase == 'Y' or params[:qn4_input_again].upcase == 'N'
    session['q4_again'] = if params[:qn4_input_again].upcase == 'Y' then 8 else 0 end
  redirect to('/q5')
  else
    erb :qn_four_again
  end
end


send :get, '/q5' do
  erb :qn_five
end

send :post, '/q5' do
  if params[:qn5_input].upcase == 'Y' or params[:qn5_input].upcase == 'N'
    session['q5'] = if params[:qn5_input].upcase == 'Y' then 16 else 0 end
    session['q5_again'] = 0
    redirect to('/final')
  else
    session['q5'] = 0
    erb :qn_five_again
  end
end

send :get, '/q5_again' do
  erb :qn_five_again
end

send :post, '/q5_again' do
  if params[:qn5_input_again].upcase == 'Y' or params[:qn5_input_again].upcase == 'N'
    session['q5_again'] = if params[:qn5_input_again].upcase == 'Y' then 16 else 0 end
    redirect to('/final')
  else
    erb :qn_five_again
  end
end


send :get, '/final' do
  erb :final
end



private


def clear_q1_response
  session['q1'] = nil
end

def clear_q2_response
  session['q2'] = nil
end

def clear_q3_response
  session['q3'] = nil
end

def clear_q4_response
  session['q4'] = nil
end

def clear_q5_response
  session['q5'] = nil
end

def clear_q1_again_response
  session['q1_again'] = nil
end

def clear_q2_again_response
  session['q2_again'] = nil
end

def clear_q3_again_response
  session['q3_again'] = nil
end

def clear_q4_again_response
  session['q4_again'] = nil
end

def clear_q5_again_response
  session['q5_again'] = nil
end

