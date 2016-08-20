require 'sinatra'
require "sinatra/reloader" if development?

enable :sessions

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

helpers do
  def calc_result
    session['q1'] + session['q2'] + session['q3'] + session['q4'] + session['q5']
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
  redirect to('/')
end


send :get, '/q1' do
  erb :qn_one
end

send :post, '/q1' do
  if params[:num].upcase == 'Y' or params[:num].upcase == 'N'
    session['q1'] = if params[:num].upcase == 'y' then 1 else 0 end
  redirect to('/q2')
  else
    erb :qn_one
  end
end

send :get, '/q2' do
  erb :qn_two
end

send :post, '/q2' do
  if params[:num].upcase == 'Y' or params[:num].upcase == 'N'
    session['q2'] = if params[:num].upcase == 'Y' then 2 else 0 end
  redirect to('/q3')
  else
    erb :qn_two
  end
end

send :get, '/q3' do
  erb :qn_three
end

send :post, '/q3' do
  if params[:num].upcase == 'Y' or params[:num].upcase == 'N'
    session['q3'] = if params[:num].upcase == 'Y' then 4 else 0 end
  redirect to('/q4')
  else
    erb :qn_three
  end
end

send :get, '/q4' do
  erb :qn_four
end

send :post, '/q4' do
  if params[:num].upcase == 'Y' or params[:num].upcase == 'N'
    session['q4'] = if params[:num].upcase == 'Y' then 8 else 0 end
  redirect to('/q5')
  else
    erb :qn_four
  end
end

send :get, '/q5' do
  erb :qn_five
end

send :post, '/q5' do
  if params[:num].upcase == 'Y' or params[:num].upcase == 'N'
    session['q5'] = if params[:num].upcase == 'Y' then 16 else 0 end
    calc_result
    redirect to('/final')
  else
    erb :qn_five
  end
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

