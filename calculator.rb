require 'sinatra'

get '/' do
  erb :calculator
end

post '/calculate' do
  num1 = params[:num1].to_f
  num2 = params[:num2].to_f
  operator = params[:operator]

  result = case operator
           when "+"
             num1 + num2
           when "-"
             num1 - num2
           when "*"
             num1 * num2
           when "/"
             num1 / num2
           else
             "Некорректная операция"
           end

  "Результат: #{result}"
end

__END__

@@ calculator
<!DOCTYPE html>
<html>
<head>
  <title>Калькулятор</title>
</head>
<body>
  <h1>Калькулятор</h1>
  <form action="/calculate" method="post">
    <input type="number" name="num1" step="any" placeholder="Введите первое число" required><br>
    <input type="number" name="num2" step="any" placeholder="Введите второе число" required><br>
    <select name="operator">
      <option value="+">+</option>
      <option value="-">-</option>
      <option value="*">*</option>
      <option value="/">/</option>
    </select><br>
    <input type="submit" value="Посчитать">
  </form>
</body>
</html>
